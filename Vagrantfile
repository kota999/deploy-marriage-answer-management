# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
config.vm.define :marriage do |node|
  node.vm.box = "centos7"
  #node.vm.box = "opscode-centos6.5"
  node.vm.network "private_network", ip: "192.168.33.33"

  node.vm.provision "ansible" do |ansible|
    ansible.playbook = "setup.yml"
    ansible.inventory_path = "hosts"
    ansible.limit = 'all'
  end
end
  config.ssh.forward_agent = true
end
