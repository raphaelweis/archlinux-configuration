# stow hosts first
if [ "$(hostname)" = "archlinux-desktop" ]; then
  # stow package for desktop
  cd desktop
  stow * -t ~/
  cd ..
elif [ "$(hostname)" = "archlinux-laptop" ]; then
  # stow packages for laptop
  cd laptop
  stow * -t ~/
  cd ..
else
  echo "Unknown host: $(hostname)"
fi

# stow main second
cd main
stow * -t ~/
cd ..
