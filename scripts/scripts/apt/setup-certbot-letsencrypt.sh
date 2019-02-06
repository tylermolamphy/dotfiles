#!/bin/bash
add-apt-repository ppa:certbot/certbot -y
apt update
apt install -y python-certbot-nginx
certbot -h
