!#/bin/bash
cd /tmp
wget https://download.configserver.com/csf.tgz
tar xvf csf.tgz
cd ./csf
./install.sh
service csf status
