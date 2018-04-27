#!/bin/bash
ssh root@vm.molamphy.net -i ~/.ssh/id_rsa_vm "/root/dotfiles/scripts/scripts/killall-mosh.sh &disown"
find ~/Dropbox/vimwiki -name "*.swp"
find ~/Dropbox/vimwiki/ -name "*.swp" -delete
echo Done
exit 0
