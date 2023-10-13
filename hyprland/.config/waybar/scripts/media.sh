#!/bin/sh
while true; do

	player_status=$(playerctl status 2>/dev/null)

	if [ -z "$(playerctl metadata album)" ]; then
		if [ "$player_status" = "Playing" ]; then
			echo "$(playerctl metadata artist) - $(playerctl metadata title)"
		elif [ "$player_status" = "Paused" ]; then
			echo " $(playerctl metadata artist) - $(playerctl metadata title)"
    else
			echo ""
		fi
	else
        player_info="$(playerctl metadata artist) - $(playerctl metadata title)"
        if [ ${#player_info} -gt 40 ]; then
            player_info="$(playerctl metadata title | cut -c1-40)"
        fi
		if [ "$player_status" = "Playing" ]; then
            echo " ⏵ $player_info"
		elif [ "$player_status" = "Paused" ]; then
			echo " ⏸ $player_info"
    else
			echo ""
		fi
	fi

	sleep 1

done
