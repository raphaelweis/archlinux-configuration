#!/bin/bash

RECORDINGS_DIR="$HOME/Pictures/recordings"

if ! pkill -INT -P "$(pgrep -xo record.sh)" wf-recorder 2>/dev/null; then

  geometry="$(slurp -d)"

  if [ -n "$geometry" ]; then

    pkill -USR1 -F "/tmp/record-widget.pid"

    recording="$RECORDINGS_DIR/screen-record-$(date +%Y-%m-%d-%H-%M-%S).mp4"
    wf-recorder -f "$recording" -g "$geometry"

    pkill -USR2 -F "/tmp/record-widget.pid"
  fi
else
  pkill -USR2 -F "/tmp/record-widget.pid"
fi
