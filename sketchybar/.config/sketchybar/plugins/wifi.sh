#!/bin/bash

IP_ADDRESS=$(ipconfig getifaddr en0 2>/dev/null)

if [ -z "$IP_ADDRESS" ]; then
  sketchybar --set $NAME label="Disconnected" icon=󰖪
else
  sketchybar --set $NAME label="$IP_ADDRESS" icon=󰖩
fi
