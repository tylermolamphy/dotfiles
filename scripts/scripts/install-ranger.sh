#!/bin/bash
if [ -n "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo -y
    ranger --copy-config=all
    cd ~/dotfiles && stow -v ranger
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    sudo yum update -y
    sudo yum install ranger caca-utils highlight atool w3m poppler-utils mediainfo -y
    ranger --copy-config=all
    cd ~/dotfiles && stow -v ranger
    exit 0
fi
