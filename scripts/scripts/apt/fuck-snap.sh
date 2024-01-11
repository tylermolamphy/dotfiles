#!/bin/bash
set -e
for snap in `snap list | awk {'print $1'} | grep -v Name`
do snap remove $snap ; done
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo systemctl mask snapd
sudo apt purge snapd -y
sudo apt-mark hold snapd
exit 0
