#!/bin/sh

DIR="$HOME/screenshots/"

if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

grim -g "$(slurp)" "$DIR/$(date +%Y-%m-%d-%H-%M-%S).png"
