#!/bin/bash

MEDIA_EVENT="com.apple.Music.playerInfo"

POSITION=$($PLUGIN_DIR/detect_notch.sh)

sketchybar --add event media_change $MEDIA_EVENT

sketchybar --add item media $POSITION \
  --set media \
  script="$PLUGIN_DIR/media.sh" \
  icon.padding_left=8 \
  icon.padding_right=4 \
  label.padding_left=4 \
  label.padding_right=8 \
  label.max_chars=35 \
  scroll_texts=off \
  update_freq=2 \
  --subscribe media media_change

