# Vagrant Development Environment
Generic development environment for those who want Linux but can't have it.

Currently sets up:
- Docker
- GCloud SDK
- ZSH
- oh-my-zsh
- git

## Usage
### Configuration
You can configure the machine through environment variables.
```bash
export VAGRANT_VM_CPU=2 # num of cores
export VAGRANT_VM_MEMORY_GB=2 # memory in gb
export GIT_EMAIL="email@gmail.com" # email for git config
export GIT_NAME="My Name" # name for git config
export VAGRANT_PROJECT_DIR="C://Users/me/projects" # dir to mount at /mnt/projects
```
In addition, you should add any desired SSH keys to `files/id_rsa` and `files/id_rsa.pub`.

### Run
Now, simply run vagrant. A few applicable commands:
```bash
vagrant up
vagrant ssh
vagrant suspend
vagrant resume
```

See [Vagrant docs](https://www.vagrantup.com/intro/getting-started/) for more info.