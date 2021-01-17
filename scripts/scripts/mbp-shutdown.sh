#!/bin/bash
while [ "$select" != "NO" -a "$select" != "YES" ]; do
    select=$(echo -e 'NO\nYES' | dmenu -fn 'DejaVu Sans Mono-18' -i -p "Are you sure you want to power down?")
    [ -z "$select" ] && exit 0
done
[ "$select" = "NO" ] && exit 0
poweroff