plugins="vimwiki/vimwiki.git \
tpope/vim-markdown.git \
scrooloose/nerdtree.git \
junegunn/vim-easy-align.git \
nathanaelkane/vim-indent-guides.git \
csexton/trailertrash.vim.git \
vim-airline/vim-airline.git \
https://github.com/nathangrigg/vim-beancount.git \
dracula/vim.git"
rm -rf ~/.vim/bundle/*
echo "Please wait, pulling dependencies for vim"
echo " "
for plugin in $plugins
do git clone -q https://github.com/$plugin ~/.vim/bundle/`echo $plugin | cut -d / -f 2`
done
