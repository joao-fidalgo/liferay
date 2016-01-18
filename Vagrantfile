# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  $cpus   = 2
  $memory = 2048

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.gui    = false
    vb.cpus   = $cpus
    vb.memory = $memory
  end

  config.vm.provision :docker
  config.vm.provision :docker_compose, rebuild: true, run: "always", yml: "/vagrant/docker-compose.yml"
end