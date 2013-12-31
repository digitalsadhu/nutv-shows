# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vagrant-node-basebox"

  config.vm.hostname = "nutv-shows.vm"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.21"

  config.vm.synced_folder ".", "/vagrant", :id => "vagrant-root", :owner => 'vagrant'
  config.vm.synced_folder ".", "/home/vagrant/project/", :nfs => true

  config.vm.provider :virtualbox do |vb|

    # Change memory and enable ioapic flag (recommended for 64bit)
    vb.customize ["modifyvm", :id, "--memory", "1024", "--ioapic", "on"]
  end

  config.vm.provision :shell, :inline => "cd /vagrant && npm install"
end
