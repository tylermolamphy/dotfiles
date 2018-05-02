last=$(ls -t ~/vimwiki/diary/2*.md | head -1)
today=$(date +%Y-%m-%d)
if [ -f ~/vimwiki/diary/$today.md ]; then
echo Nope
exit 1
else
cat $last | grep -E '\[*\]|=' | grep -v "\[X\]" | sed "s/= 20.*-.*-.* =/= $(date +%Y-%m-%d) =/g" > ~/vimwiki/diary/$today.md
echo Done
exit 0
fi
