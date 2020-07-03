#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# try upgrade kernel before
apt update &&s apt upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade &&
apt install ldnsutils git -y  &&
unlink /etc/localtime &&
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime &&
timedatectl

apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install -y docker-ce &&
apt install -y docker-compose &&
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose &&
chmod +x /usr/bin/docker-compose

apt install apt-utils
apt update && apt upgrade -y

cd docker-wireguard

docker-compose up --no-start

reboot



#systemctl status docker

