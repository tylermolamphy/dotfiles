killall BitBar
killall Amethyst
sleep 1
/usr/local/bin/brightness .9
defaults write com.apple.dock autohide -float C01
killall Dock
sleep 3
open /Applications/Amethyst.app
open /Applications/BitBar.app
exit 0
