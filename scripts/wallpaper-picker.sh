#!/bin/bash

DEFAULT_WALLPAPER="$WALLPAPERS_DIR/default/wall"

# pick a wallpaper with rofi
chosen=$(ls ~/Pictures/wallpapers | rofi -dmenu -i)

# copy chosen wallpaper to the default wallpaper directory and rename it to wall
rm "$DEFAULT_WALLPAPER"
cp "$WALLPAPERS_DIR/$chosen" "$DEFAULT_WALLPAPER"

# select default wallpaper as current one with swww
swww img "$DEFAULT_WALLPAPER"
