#!/bin/bash

mode=$1

if [[ -z $mode ]]; then
  mode="run"
fi

if pgrep -x "rofi"; then
  # If rofi is running, close it
  pkill -x "rofi"
else
  # If rofi is not running, launch it in the specified mode
  (rofi -show run &> /dev/null) &
fi
