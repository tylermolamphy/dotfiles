#!/bin/bash
pushd ~/dotfiles
git pull
for stowable in `find ~/dotfiles -type d -maxdepth 1 -mindepth 1 ! -name .git | xargs -n1 basename`
  do stow -Dv $stowable
done 
popd
pushd ~
rm -r ~/dotfiles
git clone git.molamphy.net:tm/dotfiles.git
popd
pushd ~/dotfiles
for stowable in `find ~/dotfiles -type d -maxdepth 1 -mindepth 1 ! -name .git | xargs -n1 basename`
  do stow -v $stowable
done 
popd
exit 0
