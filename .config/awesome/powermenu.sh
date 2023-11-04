#!/bin/bash
CHOICE="$(echo -e "Exit\nLock\nShutdown\nRestart" | dmenu)"
#notify-send $CHOICE
case  $CHOICE  in 
	"Exit")
		killall xinit
		killall Xsession
        killall awesome
        ;;
	"Lock")
		light-locker-command -l
		;;
	"Shutdown")
		systemctl poweroff
		;;
	"Restart")
		systemctl reboot
		;;
	*)
esac
