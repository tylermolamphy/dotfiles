#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  

#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
# @xero's aliases, trimmed
alias ll="ls -las"
alias lsl="ls -last"
alias "cd.."="cd ../"
alias up="cd ../"
alias psef="ps -ef"
alias xsel="xsel -b"
alias fuck='sudo $(fc -ln -1)'
alias v="vim"
alias vi="vim"
alias emacs="vim"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git pull"
alias gco="git checkout"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias mixer="alsamixer"
alias matrix="cmatrix -b"
# @tylermolamphy's aliases
alias r='rm -rfv'
alias grab='sudo apt update && sudo apt install -y'
alias get='sudo yum -y install'
alias tarup='tar -czf'
alias tardown='tar -xvf'
alias tarpeek='tar -tvf'
alias gg="git add . && git commit && git push"
alias upcp='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias updot='git -C ~/dotfiles pull ; ~/.vim/rake.sh ; git -C ~/dotfiles status'
alias vimwiki="vim -c VimwikiIndex"
alias ww="vim -c VimwikiIndex"
alias tomorrow="cat ~/Dropbox/vimwiki/diary/$(date +%Y-%m-%d).md | grep -E '\[*\]|=' | grep -v '\[X\]'"

function t() {
  X=$#
  [[ $X -eq 0 ]] || X=X
  tmux new-session -A -s $X
}

function email() {
	echo $3 | mutt -s $2 $1
}
# colorized cat
function c() {
  for file in "$@"
  do
    pygmentize -O style=sourcerer -f console256 -g "$file" 
  done
}
# colorized less
function l() {
  pygmentize -O style=sourcerer -f console256 -g $1 | less -r 
}
# read markdown files like manpages
function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
# nullpointer url shortener
function short() {
  curl -F"shorten=$*" https://0x0.st
}
