# i3 setup

Locker needs to be downloaded:

    git clone https://github.com/meskarune/i3lock-fancy.git
    cd i3lock-fancy
    sudo make install

And setup in systemd: https://gist.github.com/tylermolamphy/9e6392db3b5bf5b01bafc5a4e657c038

Finally, polybar:

    git clone https://github.com/jaagr/polybar.git
    cd polybar
		dnf install xcb-proto clang cmake perl-open powerline-fonts
    ./build.sh
