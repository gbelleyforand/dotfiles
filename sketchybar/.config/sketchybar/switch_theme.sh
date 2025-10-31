#!/bin/bash

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
THEME_FILE="$CONFIG_DIR/.theme"
CURRENT_THEME=$(cat "$THEME_FILE" 2>/dev/null || echo "default")

if [ "$CURRENT_THEME" = "default" ]; then
  NEW_THEME="gruvbox"
else
  NEW_THEME="default"
fi

echo "$NEW_THEME" >"$THEME_FILE"

sketchybar --reload

echo "Switched to $NEW_THEME theme"

