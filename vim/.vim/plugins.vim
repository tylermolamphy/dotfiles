"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ xero <x@xero.nu>
" ░▓ code   ▓ http://code.xero.nu/dotfiles
" ░▓ mirror ▓ http://git.io/.files
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"
"legacy
"Plugin 'chrisbra/unicode.vim'
"Plugin 'vim-scripts/Improved-AnsiEsc'
set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')

" colors
Plug 'xero/sourcerer.vim'
Plug 'xero/blaquemagick.vim'
Plug 'xero/vim-noctu'

" features

Plug 'ajh17/VimCompletesMe'
Plug 'sheerun/vim-polyglot'
Plug 'isa/vim-matchit'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'simeji/winresizer'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'matze/vim-move'
Plug 'tpope/tpope-vim-abolish'
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'godlygeek/tabular'

call plug#end()
