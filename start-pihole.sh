#!/bin/bash

docker run -d \
    --name pihole \
    -p 5353:53/tcp -p 5353:53/udp \
    -p 80:80 \
    -p 443:443 \
    -e TZ="Europs/Paris" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="15.236.86.112" \
    pihole/pihole:latest