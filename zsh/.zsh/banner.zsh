echo $(whoami)@$(hostname)
echo $(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)
echo $(cat /proc/loadavg)
