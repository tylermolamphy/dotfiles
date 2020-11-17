cd ~
rm -rf ~/.tmux
echo "Please wait, pulling dependencies for tmux"
git clone -q https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
exit 0
