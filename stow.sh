#!/bin/sh

# stow hosts first
if [ "$(hostname)" = "archlinux-desktop" ]; then
  # stow package for desktop
  stow desktop -t ~/.config/
elif [ "$(hostname)" = "archlinux-laptop" ]; then
  # stow packages for laptop
  stow laptop -t ~/.config/
else
  echo "Unknown host: $(hostname)"
fi

# stow main second
stow main -t ~/.config

# stow special packages
stow -d ./special wrappedhl -t ~/.local/bin/
stow -d ./special zshenv -t ~/
