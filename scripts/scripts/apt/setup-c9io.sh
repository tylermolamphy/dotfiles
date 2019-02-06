#!/bin/bash
sudo apt install build-essential nginx-full -y
git clone https://github.com/c9/core.git c9sdk
pushd c9sdk
scripts/install-sdk.sh
popd
/root/.c9/node/bin/node /root/c9sdk/server.js &disown
systemctl start nginx --no-pager
systemctl enable nginx
systemctl status nginx --no-pager
echo "server {
listen 0.0.0.0:80 default_server;
set \$upstream 127.0.0.1:8181;
location / {
proxy_pass_header Authorization;
proxy_pass http://\$upstream;
proxy_set_header Host \$host;
proxy_set_header X-Real-IP \$remote_addr;
proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
proxy_http_version 1.1;
proxy_set_header Connection "";
proxy_buffering off;
client_max_body_size 0;
proxy_read_timeout 36000s;
proxy_redirect off;
}
}" > /etc/nginx/sites-enabled/default
systemctl restart nginx --no-pager
for ip in `w | awk {'print $3'} | sed 's/-//g' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'` ; do echo Whitelisting $ip ; ufw allow from $ip ; done
exit 0
