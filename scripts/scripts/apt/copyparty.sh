#!/bin/bash
apt install --no-install-recommends python3-pil pip ffmpeg
python3 -m pip install --user -U copyparty
ln -s `find / -name copyparty | grep bin | grep -v usr/bin` /usr/bin
mkdir /var/lib/copyparty-jail
touch /var/lib/copyparty-jail/files-go-here.txt
pushd /var/lib/copyparty-jail
/usr/bin/copyparty &disown
exit 0
