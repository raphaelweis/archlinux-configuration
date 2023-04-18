#!/bin/bash

# check if required directories exist if not create them
if [ ! -d "$WALLPAPERS_DIR" ]; then
    mkdir -p "$WALLPAPERS_DIR"
fi

# stow hosts first
if [ "$(hostname)" = "archlinux-desktop" ]; then
  # stow package for desktop
  stow -R desktop -t ~/.config/
elif [ "$(hostname)" = "archlinux-laptop" ]; then
  # stow packages for laptop
  stow -R laptop -t ~/.config/
else
  echo "Unknown host: $(hostname)"
fi

# stow main second
stow -R main -t ~/.config

# stow scripts third
stow -R scripts -t ~/.local/bin

# stow wallpapers fourth
stow -R wallpapers -t ~/Pictures/wallpapers

# stow special packages
stow -R -d ./special wrappedhl -t ~/.local/bin
stow -R -d ./special zshenv -t ~/
