#!/bin/bash
add-apt-repository ppa:certbot/certbot -y
apt update
apt install -y python-certbot-nginx
certbot --nginx -d `hostname`.swarm.molamphy.net --agree-tos -m spam@tylermolamphy.net --redirect -n
