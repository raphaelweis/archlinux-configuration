#!/bin/bash

chosen=$(printf "  Power Off\n  Reboot" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Reboot") reboot ;;
	*) exit 1 ;;
esac
