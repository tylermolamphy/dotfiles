today=$(date +%Y-%m-%d.md)
if [ -f ~/vimwiki/diary/$today ]; then
echo Nope
exit 1
fi
cd ~/vimwiki/diary && cat $(ls -t *.md | head -1) | grep '\[*\]' | grep -v "\[X\]" > ~/vimwiki/diary/$file
echo Done
exit 0
