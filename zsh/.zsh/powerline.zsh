if [ -n "$(uname -a | grep Manjaro)" ]; then
~/powerlevel9k/powerlevel9k.zsh-theme
fi
if [ -n "$(uname | grep Darwin)" ]; then
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
fi
if [ -n "$(uname -a | grep Ubuntu)" ]; then
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
fi
