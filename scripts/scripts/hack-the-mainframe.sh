#!/bin/bash
# This script just generates a SHA256 key verbosely using the excellent project at github.com/in3rsha/sha256-animation
wget -S --spider mainframe.com
sleep 2
~/dotfiles/fun/bin/colorbars
which ruby || grab ruby
mkdir tmp
cd tmp
git clone https://github.com/in3rsha/sha256-animation.git
cd sha256-animation
ruby sha256.rb e8ddfb343e5c96a44a018de4eb4bfde8331951252f4bb51bf565ba749ad7e639
rm -rf tmp/sha256-animation
echo " "
echo "mainframe hax0r3d, l0lz"
