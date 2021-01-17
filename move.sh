#!/bin/bash
pushd ~/dotfiles
git remote remove origin
git remote add origin git.molamphy.net:tm/dotfiles.git
git push -u origin --all
git push -u origin --tags
popd
echo "Done!"
exit 0
