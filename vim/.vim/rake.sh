plugins="vimwiki/vimwiki.git tpope/vim-markdown.git nelstrom/vim-markdown-folding.git"
for plugin in $plugins
do git clone https://github.com/$plugin ~/.vim/bundle/`echo $plugin | cut -d / -f 2`
done
