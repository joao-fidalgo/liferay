# Dockerized Liferay Portal
This is the repository for docker joaofidalgo/liferay automated builds

# Usage
 docker run -it -p 8080:8080 joaofidalgo/liferay:6.2-ce-ga6

# Extending this image
 If you want to deploy your applications your  config files, this image offers an extension point at the cfg folder.

 1. Create your Dockerfile using joaofidalgo/liferay as the base image
 2. Add your WAR files under the folder "deploy"
 3. Add your global libraries under the folder "lib"
 4. Add your scripts under the folder "bin"
 5. Build and run your image using docker

# Development Environment
## Using [docker-compose](https://www.docker.com/docker-compose/ "docker-compose")
 docker-compose up

## Using [vagrant](https://www.vagrantup.com "vagrant")
 vagrant up (requires [vagrant-docker-compose](https://github.com/leighmcculloch/vagrant-docker-compose "vagrant-docker-compose") plugin)

# FAQ
## I'm behind a corporate proxy
 1. Install [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf "vagrant-proxyconf") plugin
 2. Change the Vagrantfile accordingly
  ```ruby
  Vagrant.configure("2") do |config|
    if Vagrant.has_plugin?("vagrant-proxyconf")
      config.proxy.http     = "http://proxy.example.com:8080"
      config.proxy.https    = "http://proxy.example.com:8080"
      config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    end
    # ...
  end
  ```
