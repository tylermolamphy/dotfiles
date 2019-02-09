#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Missing port number! What should I proxy on 80?"
    exit 1
fi
apt install nginx-full httpie -y
systemctl start nginx --no-pager
systemctl enable nginx
systemctl status nginx --no-pager
rm -rfv /etc/nginx/sites-enabled/default
echo "server {
listen 0.0.0.0:80 default_server;
set \$upstream 127.0.0.1:$1;
location / {
proxy_pass_header Authorization;
proxy_pass http://\$upstream;
proxy_set_header Host \$host;
proxy_set_header X-Real-IP \$remote_addr;
proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
proxy_http_version 1.1;
proxy_set_header Connection \"\";
proxy_buffering off;
client_max_body_size 0;
proxy_read_timeout 36000s;
proxy_redirect off;
}
}" > /etc/nginx/sites-enabled/revproxy-$1
systemctl restart nginx --no-pager
http --headers `hostname`.swarm.molamphy.net
