#!/bin/bash
pushd ~/dotfiles
git remote remove origin
git remote add origin git.molamphy.net:tm/dotfiles.git
popd
exit 0
