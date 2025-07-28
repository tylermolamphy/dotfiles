#!/bin/bash
apt install --no-install-recommends python3-pil pip ffmpeg
python3 -m pip install --user -U copyparty
ln -s `find / -name copyparty | grep bin | grep -v usr/bin` /usr/bin
pushd /etc/systemd/system && wget https://github.com/9001/copyparty/raw/refs/heads/hovudstraum/contrib/package/arch/copyparty.service ; popd
systemctl enable --now copyparty.service
exit 0
