# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.40"
  config.vm.provision "ansible" do |ansible|
    ansible.limit = "vagrant"
    ansible.inventory_path = "deploy/ansible/inventory/development"
    ansible.playbook = "deploy/ansible/provision.yml"
  end

end
