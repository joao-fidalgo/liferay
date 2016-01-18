# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.0.32.6:8080"
    config.proxy.https    = "http://10.0.32.6:8080"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

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