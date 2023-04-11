#!/bin/zsh

 #check if Hyprland process is running then redirect stdout and stderr to null output
if ps aux | grep Hyprland | grep -v grep &> /dev/null; then
  echo "status: Hyprland running"
else
  echo "status: Hyprland not running"
  echo "action: launching Hyprland"
  exec Hyprland
fi
