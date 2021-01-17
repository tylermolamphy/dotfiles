#!/bin/bash
sudo pacman -Syu flatpak --noconfirm
flatpak install flathub com.spotify.Client
flatpak run com.spotify.Client
