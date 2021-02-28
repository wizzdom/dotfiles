if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep awesome || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
