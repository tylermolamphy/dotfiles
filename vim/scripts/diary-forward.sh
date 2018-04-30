cd ~/vimwiki/diary && cat $(ls -t *.md | head -1) | grep '\[*\]' | grep -v "\[X\]" > $(date +%Y-%m-%d.md)
echo Done
