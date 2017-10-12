```
      ██            ██     ████ ██  ██                
     ░██           ░██    ░██░ ░░  ░██                
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░ 
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████ 
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████ 
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░  
 

 bin            > system automation scripts
 figlet         > custom 3d font
 fun            > term color, sys info, and other misc scripts
 git            > global git config and aliases
 irssi          > neon gold irc theme
 mutt           > minimal mutt setup
 ncmpcpp        > ncurses mpc++ ui/color settings
 pacman         > pacman colors and progress bar animations
 pygments       > add syntax highlighting to cat and less commands
 ranger         > file manager with image previews and z3bra theme
 ssh            > remote ssh server keep alive
 themes         > mod of the cathexis dark theme for gtk/qt/xfce
 tmux           > terminal multiplexer with custom status bar
 vim            > wizard status bar and sourcerer color scheme
 zsh            > zshell settings, aliases, and custom prompts
```

# how it works
by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument. 

to install my **herbstluft** theme _greybeard_ use the command:

`stow herbstluftwm`

this will symlink files to `~/.config/herbstluftwm` and various other places.

but you can override the default behavior and symlink files to another location with the `-t` (target) argument flag. 

to install the **ryu-login** you need to execute the command:

`stow -t / ryu-login` 

this will symlink the file to `/etc/issue`.

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files.

# tl;dr
navigate to your home directory

`cd ~`

clone the repo:

`git clone http://git.xero.nu/dotfiles.git`

enter the dotfiles directory

`cd dotfiles`

install the zsh settings

`stow zsh`

install zsh settings for the root user

`sudo stow zsh -t /root`

install awesomewm theme

`stow awesome`

uninstall awesome theme

`stow -D awesome`

install herbstluftwm

`stow herbstluftwm`

etc, etc, etc...