#!/bin/bash

if [ ! -d "$SCREENSHOTS_DIR" ]; then
    mkdir -p "$SCREENSHOTS_DIR"
fi

screenshot=$SCREENSHOTS_DIR/$(date +%Y-%m-%d-%H-%M-%S).png
grim -g "$(slurp)" "$screenshot"
wl-copy < "$screenshot"
