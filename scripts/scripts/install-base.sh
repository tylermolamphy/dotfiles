#!/bin/bash
cat /etc/os-release
if [ -n "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install stow zsh tmux vim git keychain wget iftop net-tools inetutils-tools mosh -y
    exit 0
fi
if [ -n "$(command -v dnf)" ]; then
    sudo dnf update -y
    sudo dnf install stow zsh tmux vim keychain curl wget iftop net-tools inetutils-tools mosh -y
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    sudo yum update -y
    sudo yum install stow zsh tmux vim keychain curl wget iftop net-tools i6netutils-tools mosh -y
    exit 0
fi
if [ -n "$(command -v pacman)" ]; then
    sudo pacman -Syyu --noconfirm
    sudo pacman -Syu stow zsh tmux vim keychain curl wget iftop inetutils-tools mosh i3-gaps i3lock polybar feh dmenu surf powerline-fonts ttf-hack syncthing-gtk --noconfirm
    exit 0
fi
