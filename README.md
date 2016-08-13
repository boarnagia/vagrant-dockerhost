# Vagrant configuration for a docker host

## How to setup

1. Install latest Vagrant
https://www.vagrantup.com/downloads.html

2. Install vbguest plugin

$ vagrant plugin install vagrant-vbguest

3. Build & run the environment

$ vagrant up

## How to check that docker-compose is avarable

$ vagrant ssh
$ cd /vagrant_data/dockers/sample
$ docker-compose up -d


And then, open http://192.168.33.10/ to confirm the environment availability.

