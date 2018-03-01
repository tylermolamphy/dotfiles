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
    stow -v scripts bin ssh zsh tmux git vim
    chsh -s `which zsh`
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    yum install epel-release -y 
    ~/dotfiles/scripts/scripts/install-base.sh
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    systemctl stop firewalld
    systemctl disable firewalld
    cd /tmp && wget https://download.configserver.com/csf.tgz && tar -xvf /tmp/csf.tgz
    cd /tmp/csf && sh install.sh
    sed -i 's/TESTING = \"1\"/TESTING = \"0\"/g' /etc/csf/csf.conf
    reboot
    exit 0
fi
