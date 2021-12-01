function fish_greeting
    uptime
end

alias y='youtube-dl -i -o "%(title)s.%(ext)s"'+
alias y3='youtube-dl -i --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias y3p='youtube-dl -i --extract-audio --audio-format mp3 -o "%(playlist_index)s - %(title)s.%(ext)s"'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC --intf ncurses'
alias update-alfred='brew upgrade alfred ; open /Applications/Alfred\ 4.app'

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
fish_add_path /usr/local/sbin
