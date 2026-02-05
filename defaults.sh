#!/bin/bash
if [ -n "$(uname | grep Darwin)" ]; then
		defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
    defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew tap homebrew/cask
    brew install stow zsh tmux mosh httpie mtr telnet keychain macvim
    stow -v bin zsh tmux git vim
    brew install --cask alfred iterm2 scroll-reverser firefox 1password
    brew install homebrew/cask-fonts/font-powerline-symbols
#    brew tap sambadevi/powerlevel9k
#    brew install powerlevel9k
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
		git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh-vi-mode
exit 0
fi
if [ -n "$(command -v apt)" ]; then
    ~/dotfiles/scripts/scripts/apt/fuck-snap.sh
    ~/dotfiles/scripts/scripts/install-base.sh
    pushd ~/dotfiles
    stow -v scripts bin ssh zsh git vim mosh
    popd
    chsh -s `which zsh`
#    apt install -y zsh-theme-powerlevel9k fonts-powerline
		apt install -y fonts-powerline
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
		git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh-vi-mode
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
    stow -v zsh tmux scripts bin fun ssh git ranger vim themes
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
