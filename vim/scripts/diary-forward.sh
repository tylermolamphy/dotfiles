last=$(ls -t ~/vimwiki/diary/2*.md | head -1)
today=$(date +%Y-%m-%d.md)
if [ -f ~/vimwiki/diary/$today ]; then
echo Nope
exit 1
fi
cat $last | grep -E '\[*\]|=' | grep -v "\[X\]" > ~/vimwiki/diary/$today
echo Done
exit 0
