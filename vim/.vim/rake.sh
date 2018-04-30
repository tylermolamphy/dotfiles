plugins="vimwiki/vimwiki \
mattn/calendar-vim \
tpope/vim-markdown \
scrooloose/nerdtree \
junegunn/vim-easy-align \
junegunn/fzf \
nathanaelkane/vim-indent-guides \
csexton/trailertrash.vim"
rm -rf ~/.vim/bundle/*
for plugin in $plugins
do git clone https://github.com/$plugin.git ~/.vim/bundle/$plugin
done
