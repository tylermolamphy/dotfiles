#!/bin/bash
mv ~/Desktop/Screen\ Shot* ~/Pictures/screenshots/
mv ~/Desktop/Screen_Shot* ~/Pictures/screenshots/
pre=$(ls -las ~/Pictures/screenshots | wc -l)
/usr/local/sbin/tmpwatch --mtime --all 31d ~/Pictures/screenshots/
echo Total: $pre
echo Remaining: $(ls -las ~/Pictures/screenshots | wc -l)
exit 0
