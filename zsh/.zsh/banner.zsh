
echo $(whoami)@$(hostname) running $(grep PRETTY_NAME /etc/os-release | cut -f 2 -d \")
