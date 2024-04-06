#!/bin/bash
mv ~/Desktop/Screen\ Shot* ~/Screenshots/
mv ~/Desktop/Screen_Shot* ~/Screenshots/
pre=$(ls -las ~/Screenshots | wc -l)
/usr/local/sbin/tmpwatch --mtime --all 31d ~/Screenshots/
echo Total: $pre
echo Remaining: $(ls -las ~/Screenshots | wc -l)
exit 0
