grep PRETTY_NAME /etc/os-release | cut -f 2 -d \"
echo $(whoami)@$(hostname)
