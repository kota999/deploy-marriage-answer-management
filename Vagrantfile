VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
config.vm.define :hakamata do |node|
  node.vm.box = "centos7"
  node.vm.network "private_network", ip: "192.168.33.33"
end
  config.ssh.forward_agent = true
end
