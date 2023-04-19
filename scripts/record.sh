#!/bin/bash

RECORDINGS_DIR="$HOME/Pictures/recordings"

if ! pkill -INT -P "$(pgrep -xo record.sh)" wf-recorder 2>/dev/null; then
  geometry="$(slurp -d)"
  if [ -n "$geometry" ]; then
      recording="$RECORDINGS_DIR/screen-record-$(date +%Y-%m-%d-%H-%M-%S).mp4"
      wf-recorder -f "$recording" -g "$geometry"
  fi
fi
