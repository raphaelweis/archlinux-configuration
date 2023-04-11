#!/bin/zsh

 #check if Hyprland process is running then redirect stdout and stderr to null output
if ps aux | grep Hyprland | grep -v grep &> /dev/null
then
  echo "Hyprland is already running !"
else
  exec Hyprland
fi
