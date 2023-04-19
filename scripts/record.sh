#!/bin/bash

RECORDINGS_DIR="$HOME/Pictures/recordings"

if ! pkill -INT -P "$(pgrep -xo record.sh)" wf-recorder 2>/dev/null; then

  geometry="$(slurp -d)"

  if [ -n "$geometry" ]; then

    pkill -USR1 -F "/tmp/record-widget.pid"

    notify-send "Recording started" "recording without audio - mp4 format" -i "$XDG_CONFIG_HOME/dunst/icons/recording-icon-color.png"
    recording="$RECORDINGS_DIR/screen-record-$(date +%Y-%m-%d-%H-%M-%S).mp4"
    wf-recorder -f "$recording" -g "$geometry"

    notify-send "Recording stopped" "the recording has been saved to<br>$recording" -i "$XDG_CONFIG_HOME/dunst/icons/new-video-icon-black.png"
    pkill -USR2 -F "/tmp/record-widget.pid"
  fi
else
  pkill -USR2 -F "/tmp/record-widget.pid"
fi
