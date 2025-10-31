#!/bin/bash

MODE_FILE="/tmp/aerospace_mode"

if [ -f "$MODE_FILE" ]; then
  CURRENT_MODE=$(cat "$MODE_FILE")
  
  if [ "$CURRENT_MODE" = "service" ]; then
    sketchybar --set "$NAME" \
      icon="󰒓" \
      label="SERVICE" \
      drawing=on \
      background.color=0x7a6a5a4a
  else
    sketchybar --set "$NAME" drawing=off
  fi
else
  sketchybar --set "$NAME" drawing=off
fi

