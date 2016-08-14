#!/usr/bin/env bash
# vi: set sts=2 sw=2 ts=2 fenc=utf8:

# Set timezone
timedatectl set-timezone Asia/Tokyo

# Add yum repository of docker
tgt=/etc/yum.repos.d/docker.repo
if [ ! -f $tgt ];
then
  echo '[dockerrepo]'                 > $tgt
  echo 'name=Docker Repository'       >> $tgt
  echo 'baseurl=https://yum.dockerproject.org/repo/main/centos/7/' \
                                      >> $tgt
  echo 'enabled=1'                    >> $tgt
  echo 'gpgcheck=1'                   >> $tgt
  echo 'gpgkey=https://yum.dockerproject.org/gpg' \
                                      >> $tgt
fi

# Update and install useful tools
yum update -y
yum install -y epel-release vim git htop tree wget ntpdate

# Install docker tools
yum install -y docker-engine python-pip
pip install -U pip
pip install docker-compose
pip install -U docker-compose

# It gets vagrant user to be able to operate docker without sudo.
usermod -g docker vagrant

# Start docker service
systemctl start docker
systemctl enable docker
