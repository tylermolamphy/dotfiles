#!/bin/bash
URL='https://duckduckgo.com/?q='
QUERY=$(echo '' | dmenu -p "Search:" -fn 'DejaVu Sans Mono-18')
if [ -n "$QUERY" ]; then
  xdg-open "${URL}${QUERY}" 2> /dev/null
  exec i3-msg [class="^Firefox$"] focus
fi
