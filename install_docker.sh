apt install -y docker-ce &&
apt install -y docker-compose &&
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose &&
chmod +x /usr/bin/docker-compose

apt install apt-utils
apt update && apt upgrade -y

docker-compose up --no-start

reboot