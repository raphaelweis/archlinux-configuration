#! /bin/bash

chosen=$(printf "  Power Off\n  Reboot" | rofi -dmenu -i)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Reboot") reboot ;;
	*) exit 1 ;;
esac
