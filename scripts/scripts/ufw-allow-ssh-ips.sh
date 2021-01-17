#!/bin/bash
# Designed to run every few minutes via crontab or something similar
# The idea is to allow an ip in ufw if it is conncted via ssh
# Then the challenge is deleting the allow rule when the ssh session ends.
date #for logging reasons
# First we get all ips that currently hold SSH sessions
ips="$(w | awk {'print $3'} | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' | uniq)"
# Then we save them to reference in the next step
echo $ips > /tmp/ufw-iplist
# Now that we have ips, add any ips that currently hold SSH sessions to ufw allow chain
for ip in $ips ; do echo $ip >> /root/ufw-ssh.state ; ufw allow from $ip ; done
# And finally, check any previously-allowed ip against the refernce earlier. If theyre not in the reference file, then they dont have a session, so remove the ip from ufw
for setip in `cat /root/ufw-ssh.state` ; do grep $setip /tmp/ufw-iplist || ufw delete allow from $setip && sed -i '/'$setip'/d' /root/ufw-ssh.state ; done
echo $ips >> /root/ufw-ssh.state
# Clean up
rm /tmp/ufw-iplist
# And remove duplicates
mv /root/ufw-ssh.state /root/ufw-ssh.state.old
uniq /root/ufw-ssh.state.old > /root/ufw-ssh.state
rm /root/ufw-ssh.state.old
# All done
exit 0
