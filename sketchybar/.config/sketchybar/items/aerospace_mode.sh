#!/bin/bash

sketchybar --add event aerospace_mode_change

sketchybar --add item aerospace_mode right \
  --subscribe aerospace_mode aerospace_mode_change \
  --set aerospace_mode \
  icon.padding_left=10 \
  icon.padding_right=4 \
  label.padding_left=4 \
  label.padding_right=10 \
  background.padding_left=2 \
  background.padding_right=2 \
  background.color=0x7a262626 \
  icon="" \
  label="" \
  drawing=off \
  script="$PLUGIN_DIR/aerospace_mode.sh"

