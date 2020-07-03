#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# try upgrade kernel before
apt update
apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade &&
apt install ldnsutils git -y  &&
unlink /etc/localtime &&
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime &&
timedatectl

apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update && apt upgrade -y
reboot

#systemctl status docker

