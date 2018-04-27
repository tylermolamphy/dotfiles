~/bin/unix
if [ -n "$(uname | grep Darwin)" ]; then
echo $(whoami)@$(hostname | sed s/.local//g) running macos $(sw_vers -productVersion)
else
echo $(whoami)@$(hostname) running $(grep PRETTY_NAME /etc/os-release | cut -f 2 -d \")
fi
