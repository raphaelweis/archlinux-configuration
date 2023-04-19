#!/bin/bash

recordings=0

echo "$$" > "/tmp/record-widget.pid"

update() {
  if [ "$recordings" -gt 0 ]; then
    echo "雷"
  else
    echo
  fi
}

begin_record() {
  recordings=$((recordings + 1))
  update
}

end_record() {
  recordings=$((recordings - 1))
  update
}

cleanup() {
  rm "/tmp/record-widget.pid"
}

trap begin_record SIGUSR1
trap end_record SIGUSR2
trap cleanup EXIT

while true; do
  sleep 0.1
done
