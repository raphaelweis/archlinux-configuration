#!/bin/bash

SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

screenshot="$SCREENSHOTS_DIR/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
grim -g "$(slurp -d)" "$screenshot"
wl-copy < "$screenshot"
notify-send "New screenshot" "the screenshot has been saved to<br>$screenshot" -i "$XDG_CONFIG_HOME/dunst/icons/screenshot-icon-color.png"
