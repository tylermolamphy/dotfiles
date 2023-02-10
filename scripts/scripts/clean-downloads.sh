#!/bin/bash
pre=$(ls -las ~/Downloads | wc -l)
find ~/Downloads/ -mtime +22 -delete 2>&1
echo Total: $pre
echo Remaining: $(ls -las ~/Downloads | wc -l)
exit 0
