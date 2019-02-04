if [ -n "$(uname | grep Darwin)" ]; then
echo $(whoami)@$(hostname | sed s/.local//g) running macos $(sw_vers -productVersion)
fi
if [ -d "/root/.dropbox-dist" ]; then echo Dropbox: $(/root/dropbox.py status) ; fi
