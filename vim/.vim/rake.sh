plugins="vimwiki/vimwiki.git \
mattn/calendar-vim.git \
tpope/vim-markdown.git \
vim-pandoc/vim-markdownfootnotes \
scrooloose/nerdtree.git \
junegunn/vim-easy-align.git \
junegunn/fzf.git \
nathanaelkane/vim-indent-guides.git \
csexton/trailertrash.vim.git \
vim-airline/vim-airline.git \
morhetz/gruvbox.git"
rm -rf ~/.vim/bundle/*
for plugin in $plugins
do git clone https://github.com/$plugin ~/.vim/bundle/`echo $plugin | cut -d / -f 2`
done
