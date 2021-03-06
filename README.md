# Vagrant configuration for docker-compose host

## How to setup

1. Install or upgrade Vagrant into latest

    Download here: https://www.vagrantup.com/downloads.html

2. Install vbguest plugin if you didn't install

    On your console:
    ```
    local# vagrant plugin install vagrant-vbguest
    ```

3. Finally, clone and run Vagrant environment

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

    1. Check status with docker-compose

        On your console:
        ```
        vm# docker-compose ps
        Name            Command          State              Ports
        -----------------------------------------------------------------------
        sample-web   nginx -g daemon off;   Up      443/tcp, 0.0.0.0:80->80/tcp
        ```

        It's running correctly if you saw state "Up" in the result.

    2. Check web server accessbility with your browser

        Open following URLs with your browser:

        1. http://192.168.33.10/
        2. http://localhost:8080/
        3. http://(your local machine IP addr):8080/

        It's running correctly and access settins is normal if you saw this image:
        ![Welcome message](https://assets.wp.nginx.com/wp-content/uploads/2014/01/welcome-screen-e1450116630667.png)

3. VM host environment information

```
Mac version 10.11.6
    ssh -V
        OpenSSH_6.9p1, LibreSSL 2.1.8

    vagrant --version
        Vagrant 1.8.5

Windows 10 Home + cygwin
    ssh -V
        OpenSSH_7.3p1, OpenSSL 1.0.2h 3 May 2016

    vagrant --version
        Vagrant 1.8.5
```
vi: set fenc=utf-8 :
