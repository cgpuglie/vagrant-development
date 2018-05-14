# Development machine to make windows a viable option
## If game devs would support Linux, I wouldn't be here... anyways...
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # Process any inputs
  vm_cpu = (ENV['VAGRANT_VM_CPU'] || 2).to_i
  vm_memory = (ENV['VAGRANT_VM_MEMORY_GB'] || 2).to_i * 1024
  project_dir = (ENV['VAGRANT_PROJECT_DIR'] || "~/projects")
  git_email = (ENV['GIT_EMAIL'] || '')
  git_name = (ENV['GIT_NAME'] || '')

  # Configure resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = vm_memory
    vb.cpus = vm_cpu
  end

  # Dynamic synced folders for development
  config.vm.synced_folder project_dir, "/mnt/projects"

  # Static copied files
  config.vm.provision "file", source: "./files/id_rsa", destination: "/tmp/id_rsa"
  config.vm.provision "file", source: "./files/id_rsa.pub", destination: "/tmp/id_rsa.pub"

  # Any additional logic required
  config.vm.provision "shell", 
    path: "scripts/provision.sh", 
    env: { 
      'GIT_EMAIL': git_email,
      'GIT_NAME': git_name
    }
end