#Containerized Liferay Portal
This is the repository for docker joaofidalgo/liferay automated builds
#Usage
docker run -it -p 8080:8080 joaofidalgo/liferay:6.2-ce-ga6
#Development Environment
##Using [docker-compose](https://www.docker.com/docker-compose/ "docker-compose")
docker-compose up
##Using [vagrant](https://www.vagrantup.com "vagrant")
vagrant up
###In case you're behind a corporate proxy
1. Install [vagrant-proxyconf](http://tmatilai.github.io/vagrant-proxyconf/ "vagrant-proxyconf")

   vagrant plugin install vagrant-proxyconf

2. Change the Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://proxy.example.com:8080"
    config.proxy.https    = "http://proxy.example.com:8080"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end
  # ... other stuff
end
```

3. Spin up the VM

   vagrant up
