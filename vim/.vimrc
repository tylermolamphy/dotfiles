set guioptions=-mT
set guioptions=+RLk
set guifont=Fira\ Mono\ 11
set guifontwide=Fira\ Mono\ 11
execute pathogen#infect()
set nocompatible
filetype plugin indent on
syntax enable
set nobackup
set noswapfile
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=4
set mouse=a
if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula
set background=dark
set guifont=Hack:h14 anti
set hlsearch
map q :q<cr>
map <Leader>\ :NERDTreeToggle<cr>
map <Leader>db :g/^$/d<cr>
map <C-j> :bnext<cr>
map <C-k> :bprev<cr>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-n> :tabnext<cr>
map <C-m> :tabprevious<cr>
noremap <leader>zz :w !sudo tee % > /dev/null<cr>
au FileType markdown vmap <Leader>ta :EasyAlign*<Bar><Enter>
hi UnwantedTrailerTrash guibg=white ctermbg=white
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * wincmd w
let g:indent_guides_enable_on_vim_startup = 1
