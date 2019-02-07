#!/bin/bash
apt update
apt install -y docker.io
systemctl start docker
systemctl enable docker
systemctl status docker --no-pager
docker run hello-world
