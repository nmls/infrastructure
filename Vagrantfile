# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "qDevBox"
  config.vm.box_check_update = false
  config.ssh.pty = true
  config.ssh.insert_key = false
  config.vm.hostname = "devbox"
  config.vm.network "forwarded_port", guest: 22, host: 3022
  config.vm.network "private_network", ip: "192.168.56.51", :adapter => 2
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
  end
  config.vm.provision "shell", path: "bootstrap_ansible.sh"
end

