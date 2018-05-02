#!/bin/bash
vim -c VimwikiIndex -c VimwikiAll2HTML -c q
pushd ~/Dropbox/vimwiki_html
open http://localhost:8001
time python -m SimpleHTTPServer 8001
popd
echo "Cleaning up"
rm -rf ~/Dropbox/vimwiki_html
