#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
      $@&
  fi
}

# run picom --experimental-backends # compositor
run nitrogen --restore # wallpaper setter
run nm-applet --indicator # wifi/network indicator
run barrier
# run pulseaudio --daemonize
# run start-pulseaudio-x11
# run jamesdsp --tray # Launch JamesDSP and keep gui in tray
run mpd # Music Player Daemon
run mpDris2 # Mpris support for the Music Player Daemon
#run pnmixer # Audio control tray applet
run blueman-applet # Bluetooth tray icon
run numlockx on # enable numlock
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  # credetial manager
run xfce4-power-manager # Power manager
run flameshot # screenshot utility
#run steam -silent # Launch steam in background
run syncthing --no-browser # Syncthing - file sync
run setxkbmap ie -option "caps:swapescape"
