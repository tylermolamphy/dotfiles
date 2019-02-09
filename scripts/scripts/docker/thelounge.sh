docker run --detach \
	--name thelounge \
	--publish 9000:9000 \
	--volume ~/.thelounge:/var/opt/thelounge \
	--restart always \
	thelounge/thelounge:latest
/root/dotfiles/scripts/scripts/apt/setup-nginx-revproxy.sh 9000
/root/dotfiles/scripts/scripts/apt/setup-certbot-letsencrypt.sh
echo Done
