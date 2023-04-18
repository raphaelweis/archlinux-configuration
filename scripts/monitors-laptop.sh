#!/bin/bash

# Define monitor name
LAPTOP_MONITOR="eDP-1"

# Define the command to disable the monitor
DISABLE_COMMAND="hyprctl keyword monitor ${LAPTOP_MONITOR}, disable"

# Check if an external monitor is already connected
xrandr | grep " connected" | grep -v "${LAPTOP_MONITOR}" > /dev/null
if [ $? -eq 0 ]; then
  # An external monitor is already connected, disable the laptop's monitor
  eval $DISABLE_COMMAND
fi
