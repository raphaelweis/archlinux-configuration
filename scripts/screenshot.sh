#!/bin/sh

DIR="$HOME/screenshots/"

if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

screenshot=$DIR/$(date +%Y-%m-%d-%H-%M-%S).png
grim -g "$(slurp)" "$screenshot"
wl-copy < "$screenshot"
