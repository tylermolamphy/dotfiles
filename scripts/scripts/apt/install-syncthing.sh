#!/bin/bash
apt install curl apt-transport-https -y
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing release" > /etc/apt/sources.list.d/syncthing.list
apt update
apt install syncthing
syncthing --version
