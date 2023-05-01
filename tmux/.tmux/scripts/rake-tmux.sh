cd ~
rm -rf ~/.tmux
echo "Please wait, pulling dependencies for tmux"
git clone -q https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
exit 0
