#!/bin/bash

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
THEME_FILE="$CONFIG_DIR/.theme"

if [ -z "$1" ]; then
  echo "Usage: $0 <theme_name>"
  echo "Available themes:"
  ls -1 "$CONFIG_DIR/themes" | sed 's/.sh$//'
  exit 1
fi

THEME_NAME="$1"

if [ ! -f "$CONFIG_DIR/themes/$THEME_NAME.sh" ]; then
  echo "Theme '$THEME_NAME' not found"
  echo "Available themes:"
  ls -1 "$CONFIG_DIR/themes" | sed 's/.sh$//'
  exit 1
fi

echo "$THEME_NAME" >"$THEME_FILE"
sketchybar --reload
echo "Switched to $THEME_NAME theme"

