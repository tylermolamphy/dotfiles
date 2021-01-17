for pid in `ps auxww | grep mosh | grep -v pts | awk {'print $2'}` ; do kill $pid ; done
