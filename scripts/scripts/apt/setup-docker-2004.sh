#!/bin/bash
apt-get remove docker docker-engine docker.io containerd runc
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
apt update
apt install -y docker.io
systemctl start docker
systemctl enable docker
systemctl status docker --no-pager
docker run hello-world
