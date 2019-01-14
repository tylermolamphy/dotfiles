#!/bin/bash
cat /etc/os-release
if [ -n "$(command -v apt)" ]; then
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt install stow zsh tmux vim git keychain wget iftop mosh -y
    exit 0
fi
if [ -n "$(command -v dnf)" ]; then
    sudo dnf update -y
    sudo dnf install stow zsh tmux vim keychain curl wget iftop mosh -y
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    sudo yum update -y
    sudo yum install stow zsh tmux vim keychain curl wget iftop mosh -y
    exit 0
fi
if [ -n "$(command -v pacman)" ]; then
    sudo pacman -Syyu --noconfirm
    sudo pacman -Syu stow zsh tmux vim keychain curl wget iftop mosh i3-gaps i3lock dmenu syncthing-gtk --noconfirm
    exit 0
fi
