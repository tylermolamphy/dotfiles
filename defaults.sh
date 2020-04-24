#!/bin/bash
if [ -n "$(uname | grep Darwin)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    brew tap caskroom/cask
    brew install stow zsh tmux mosh httpie mtr telnet keychain
    stow -v bin zsh tmux git vim karabiner
    brew cask install alfred amethyst iterm2 scroll-reverser font-powerline-symbols
#    brew tap sambadevi/powerlevel9k
#    brew install powerlevel9k
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
exit 0
fi
if [ -n "$(command -v apt)" ]; then
    ~/dotfiles/scripts/scripts/install-base.sh
    pushd ~/dotfiles
    stow -v scripts bin ssh zsh tmux git vim
    popd
    chsh -s `which zsh`
#    apt install -y zsh-theme-powerlevel9k fonts-powerline
		apt install -y fonts-powerline
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    exit 0
fi
if [ -n "$(command -v dnf)" ]; then
    ~/dotfiles/scripts/scripts/install-base.sh
    reboot
    exit 0
fi

if [ -n "$(command -v pacman)" ]; then
    ~/dotfiles/scripts/scripts/install-base.sh
    chsh -s `which zsh`
    pushd ~/dotfiles
    stow -v zsh tmux scripts bin i3 polybar fun ssh git ranger vim themes
    popd
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    yum install epel-release -y 
    ~/dotfiles/scripts/scripts/install-base.sh
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    systemctl stop firewalld
    systemctl disable firewalld
    reboot
    exit 0
fi
