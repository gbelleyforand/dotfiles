#!/bin/bash

sketchybar --add item weather right

sketchybar --set weather update_freq=600 script="$PLUGIN_DIR/weather.sh"






