# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant plugin install vagrant-vbguest
# http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.box_check_update = true

    config.vm.hostname = 'docker-host'
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 443, host: 8083

    config.vm.synced_folder "./data", "/vagrant_data", create: true, mount_options: ['dmode=777','fmode=777']

    config.ssh.insert_key = false

    # vagrant upした後に表示するメッセージを指定する。これはユーザが見ることが
    # 出来、開発環境の様々なコンポーネントにどのようにアクセスするかなどの指示
    # を含ませるなどに有用である。
    # config.vm.post_up_message

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"


    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    config.vm.provision "shell", inline: <<-SHELL
        yum update -y
        yum install -y vim git htop tree wget ntpdate

        echo '[dockerrepo]'                 > /etc/yum.repos.d/docker.repo
        echo 'name=Docker Repository'       >> /etc/yum.repos.d/docker.repo
        echo 'baseurl=https://yum.dockerproject.org/repo/main/centos/7/' \
                                            >> /etc/yum.repos.d/docker.repo
        echo 'enabled=1'                    >> /etc/yum.repos.d/docker.repo
        echo 'gpgcheck=1'                   >> /etc/yum.repos.d/docker.repo
        echo 'gpgkey=https://yum.dockerproject.org/gpg' \
                                            >> /etc/yum.repos.d/docker.repo
        yum install -y docker-engine
        yum install -y epel-release
        yum install -y python-pip
        pip install --upgrade pip
        pip install docker-compose
        pip install --upgrade docker-compose

        usermod -g docker vagrant

        systemctl start docker
        systemctl enable docker

        timedatectl set-timezone Asia/Tokyo

        if [ ! -d $ddir ];
        then
            mkdir $ddir
            chown vagrant:docker $ddir
        fi
    SHELL
end
