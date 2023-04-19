#!/bin/bash

SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

screenshot="$SCREENSHOTS_DIR/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
grim -g "$(slurp)" "$screenshot"
wl-copy < "$screenshot"
