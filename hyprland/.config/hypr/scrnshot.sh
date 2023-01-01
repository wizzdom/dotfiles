#!/bin/bash

grim -o $(hyprctl -j monitors | jq -r ".[] | select(.focused) | .name") - | imv -f - & grim -g "$(slurp)" - | wl-copy && hyprctl dispatch killactive x
