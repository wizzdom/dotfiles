if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/mnt/storage/bin" ] ; then
    PATH="/mnt/storage/bin:$PATH"
fi
