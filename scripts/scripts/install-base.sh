#!/bin/bash
cat /etc/os-release
if [ -n "$(command -v apt)" ]; then
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt install stow zsh tmux vim git keychain wget iftop mosh -y
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    sudo yum update -y
    sudo yum install stow zsh tmux vim keychain curl wget iftop mosh -y
    exit 0
fi
