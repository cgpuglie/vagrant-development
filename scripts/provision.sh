#!/bin/bash

log() {
  level=$1
  message=$2
  echo "$(date -Is) - [$level] $message"
}

log "INFO" "Adding package repos"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

log "INFO" "Performing apt-update"
apt-get update -y

log "INFO" "Installing packages"
apt-get install -y docker.io \
    google-cloud-sdk \
    zsh

# install zsh
su vagrant -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
su vagrant -c 'echo "vagrant" | chsh -s $(which zsh)'

log "INFO" "Configuring user"
# Add vagrant to docker group
sudo gpasswd -a vagrant docker

# Copy ssh keys
mkdir -p -m 700 /home/vagrant/.ssh
mv /tmp/id_rsa /home/vagrant/.ssh/id_rsa
mv /tmp/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/*
 
# Set editor to vim
su vagrant -c 'git config --global core.editor "vim"'
[ ! -z "$GIT_NAME" ] && su vagrant -c "git config --global user.name '$GIT_NAME'"
[ ! -z "$GIT_EMAIL" ] && su vagrant -c "git config --global user.email '$GIT_EMAIL'"