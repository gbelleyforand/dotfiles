#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item "workspace.$sid" left \
    --subscribe "workspace.$sid" aerospace_workspace_change \
    --set "workspace.$sid" \
    icon="$sid" \
    label="" \
    icon.padding_left=10 \
    icon.padding_right=10 \
    label.padding_left=0 \
    label.padding_right=0 \
    background.padding_left=2 \
    background.padding_right=2 \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
done
