#!/bin/bash

sudo apt update &&
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade &&
sudo apt install ldnsutils -y  &&
sudo unlink /etc/localtime &&
sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime &&
sudo timedatectl

sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

sudo apt install -y docker-ce

sudo apt install -y docker-compose

sudo systemctl status docker

