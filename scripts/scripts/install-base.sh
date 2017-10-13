#!/bin/bash
cat /etc/os-release
if [ -n "$(command -v apt)" ]; then
    apt update
    apt dist-upgrade -y
    apt install stow zsh tmux wget iftop -y
    exit 0
fi
if [ -n "$(command -v yum)" ]; then
    yum update -y
    yum install stow zsh tmux curl wget iftop -y
    exit 0
fi
