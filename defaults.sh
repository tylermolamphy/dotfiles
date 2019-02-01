#!/bin/bash
if [ -n "$(uname | grep Darwin)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    brew tap caskroom/cask
    brew install stow zsh tmux mosh httpie mtr telnet keychain
    stow -v bin zsh tmux git vim karabiner
    brew cask install quicksilver amethyst iterm2 scroll-reverser karabiner-elements bettertouchtool
exit 0
fi
if [ -n "$(command -v apt)" ]; then
    ~/dotfiles/scripts/scripts/install-base.sh
    pushd ~/dotfiles
    stow -v scripts bin ssh zsh tmux git vim
    popd
    chsh -s `which zsh`
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
