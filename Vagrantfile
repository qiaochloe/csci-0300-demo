# Example Vagrantfile that works on arm64.
# Reference: https://github.com/rofrano/vagrant-docker-provider

# -*- mode: ruby -*-
# vi: set ft=ruby :

# ### CS300 Development VM ###
# Feel free to modify this file to best work with your machine.
#
# For documentation, please see the comments here or go to
# https://docs.vagrantup.com for more information.

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
	 # The most common configuration options are documented and commented below.
 	 # For a complete reference, please see the online documentation at
 	 # https://docs.vagrantup.com.
	  
	config.vm.hostname = "ubuntu"

	# Create a forwarded port mapping which allows access to a specific port
	# within the machine from a port on the host machine. In the example below,
	# accessing "localhost:8080" will access port 80 on the guest machine.
	# NOTE: This will enable public access to the opened port
	# config.vm.network "forwarded_port", guest: 80, host: 8080

	# Create a public network, which generally matched to bridged network.
	# Bridged networks make the machine appear as another physical device on
	# your network.
	# config.vm.network "public_network"

	# Share an additional folder to the guest VM. The first argument is
	# the path on the host to the actual folder. The second argument is
	# the path on the guest to mount the folder. And the optional third
	# argument is a set of non-required options.
	# config.vm.synced_folder "./go/src", "/home/vagrant/go/src"
	# Manually edit synced folder mount options just in case, but this
	# should not be an issue for most
	config.vm.synced_folder '.', '/vagrant', mount_options: ["dmode=775,fmode=777"]

	############################################################
	# Provider for Docker on Intel or ARM (aarch64)
	############################################################
	config.vm.provider :docker do |docker, override|
		override.vm.box = nil
		docker.image = "vicsli/vagrant-providers:ubuntu"
		docker.remains_running = true
		docker.has_ssh = true
		docker.privileged = true
		docker.volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:ro"]
		# Uncomment to force arm64 for testing images on Intel
		# docker.create_args = ["--platform=linux/arm64"]     
	end
end