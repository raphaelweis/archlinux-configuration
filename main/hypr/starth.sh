#!/bin/zsh

ps aux | grep Hyprland | grep -v grep &> /dev/null #check if Hyprland process is running then redirect stdout and stderr to null output
if ! [[ $? ]]
then
  exec Hyprland
else
  echo "Hyprland is already running !"
fi
