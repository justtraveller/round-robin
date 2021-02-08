Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'docker-host-vm'
    vb.memory = 4096
    vb.cpus = 1
  end

  # set up Docker in the new VM:
  config.vm.provision :docker
  config.vm.provision :docker_compose, rebuild: true, run: "always", yml: "/vagrant/docker-compose.yml"
end
