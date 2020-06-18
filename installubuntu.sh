#!/bin/bash

sudo apt update &&
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade &&
sudo apt install ldnsutils git -y  &&
sudo unlink /etc/localtime &&
sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime &&
sudo timedatectl

# section a changer par rapport a debian
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io &&
sudo apt install -y docker-compose &&
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose
# fin de section

sudo apt-install apt-utils

sudo apt update && sudo apt upgrade -y

git clone https://github.com/darksip/docker-wireguard.git

cd docker-wireguard

sudo docker-compose up --no-start

sudo reboot



#sudo systemctl status docker

