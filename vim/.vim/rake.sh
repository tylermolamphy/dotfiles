plugins="vimwiki/vimwiki.git tpope/vim-markdown.git scrooloose/nerdtree.git junegunn/fzf.git nathanaelkane/vim-indent-guides.git"
rm -rf ~/.vim/bundle/*
for plugin in $plugins
do git clone https://github.com/$plugin ~/.vim/bundle/`echo $plugin | cut -d / -f 2`
done
