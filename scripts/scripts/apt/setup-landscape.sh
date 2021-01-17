#!/bin/bash
add-apt-repository ppa:landscape/17.03 -y
apt update
apt install landscape-server-quickstart -y
exit 0
