#!/bin/bash
pre=$(ls -las ~/Downloads | wc -l)
/usr/local/sbin/tmpwatch --mtime --all 31d ~/Downloads/
echo Total: $pre
echo Remaining: $(ls -las ~/Downloads | wc -l)
exit 0
