# Vagrant configuration for docker-compose host

## How to setup

1. Install or upgrade Vagrant into latest

    Download here: https://www.vagrantup.com/downloads.html

2. Install vbguest plugin if you didn't install

   On your console:
    ```
    local# vagrant plugin install vagrant-vbguest
    ```

3. Clone and run the environment

    ```
    local# git clone https://github.com/boarnagia/vagrant-dockerhost.git dockerhost
    local# cd dockerhost/Vagrant
    local# vagrant up
    ```

## Test your environment availability

1. Start docker-compose sample

    ```
    local# vagrant ssh
    vm# cd /vagrant_data/dockers/sample
    vm# docker-compose up -d
    ```

2. Check that the server is running

    1. Check status in docker-compose

        On your console:
        ```
        vm# docker-compose ps
        Name            Command          State              Ports
        -----------------------------------------------------------------------
        sample-web   nginx -g daemon off;   Up      443/tcp, 0.0.0.0:80->80/tcp
        ```

        It's running correctly if you saw state "Up" in the result.

    2. Check service accessbility with your browser

        Open belows in your browser to check

        1. http://192.168.33.10/
        2. http://localhost:8080/
        3. http://(your local machine IP addr):8080/

        It's running correctly if you saw this image:
        ![Welcome message](https://assets.wp.nginx.com/wp-content/uploads/2014/01/welcome-screen-e1450116630667.png)
