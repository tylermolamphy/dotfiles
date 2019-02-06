#!/bin/bash
add-apt-repository ppa:certbot/certbot
apt update
apt install -y install python-certbot-nginx
certbot -h
