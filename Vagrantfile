# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Pablo Toledo Gavagnin

Vagrant.configure(2) do |config|
  
    # Machine
      config.vm.define "devops-simplilearn" do |ci_service|
        ci_service.vm.box = "ubuntu/focal64"
        #ci_service.vm.network "private_network", type: "dhcp"
        config.vm.network "private_network", ip: "192.168.50.10"
        ci_service.vm.hostname = "devops-lab"
        config.vm.provider :virtualbox do |vb|
           vb.customize ["modifyvm", :id, "--memory", "8192"]
           vb.customize ["modifyvm", :id, "--cpus", "2"]
           vb.name = "devops-lab"
        end
        
        # Installing Docker CE
        ci_service.vm.provision "shell", inline: <<-SHELL
          sudo apt update
          sudo apt upgrade -y
          curl -fsSL https://get.docker.com -o get-docker.sh
          sudo sh get-docker.sh
          sudo usermod -aG docker vagrant
          sudo systemctl enable docker
          sudo systemctl start docker
          sudo apt install -y docker-compose
       SHELL
      end
  
  end