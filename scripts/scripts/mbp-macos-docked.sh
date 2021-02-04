killall BitBar
killall Amethyst
sleep 1
defaults write com.apple.dock autohide -float 0
killall Dock
sleep 3
open /Applications/Amethyst.app
open /Applications/BitBar.app
exit 0
