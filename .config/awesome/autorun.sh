#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
      $@&
  fi
}

run picom --experimental-backends # compositor
run nitrogen --restore # wallpaper setter
run nm-applet --indicator # wifi/network indicator
run pnmixer # Audio control tray applet
run blueman-applet # Bluetooth tray icon
run numlockx on # enable numlock
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  # credetial manager
run xfce4-power-manager # Power manager
run flameshot # screenshot utility
run birdtray # Birdtray - Thunderbird in tray
run mpDris2 # Mpris support for the Music Player Daemon
run viper-gui -st # Launch viper and keep gui in tray
#run steam -silent # Launch steam in background
run setxkbmap ie -option "caps:swapescape"
