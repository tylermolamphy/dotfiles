#!/bin/bash
set -e
snap remove lxd
snap remove `snap list | grep core | awk {'print $1'}`
snap remove snapd
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo systemctl mask snapd
sudo apt purge snapd -y
sudo apt-mark hold snapd
rm -rfv ~/snap
exit 0
