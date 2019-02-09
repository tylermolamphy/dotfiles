mkdir /data
docker run -p 81:80 -p 444:443 -v /data:/data khlieng/dispatch &disown
/root/dotfiles/scripts/scripts/apt/setup-nginx-revproxy.sh 444
