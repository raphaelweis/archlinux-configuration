#!/bin/bash

mode=$1

if [[ -z $mode ]]; then
    mode="run"
fi

if pgrep -x "rofi" &> /dev/null; then
    # If rofi is running, close it
    pkill rofi
else
    # If rofi is not running, launch it in the specified mode
    rofi -show $mode &> /dev/null &
fi
