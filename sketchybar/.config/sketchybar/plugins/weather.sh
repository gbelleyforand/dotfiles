#!/bin/bash

LOCATION="Gatineau,Quebec"
WEATHER_JSON=$(curl -s "https://wttr.in/${LOCATION}?format=j1")

if [ $? -eq 0 ]; then
  TEMPERATURE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C')
  WEATHER_CODE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].weatherCode')
  
  case $WEATHER_CODE in
    113) ICON="󰖙" ;;
    116) ICON="󰖕" ;;
    119) ICON="󰖐" ;;
    122) ICON="󰖐" ;;
    143|248|260) ICON="󰖑" ;;
    176|263|266|293|296|299|353) ICON="󰖗" ;;
    179|227|230|320|323|326|329|332|335|338|350|371|374|377) ICON="󰼶" ;;
    182|185|281|284|311|314|317|362|365|368|374) ICON="󰖒" ;;
    200|386|389) ICON="󰙾" ;;
    *) ICON="󰖐" ;;
  esac
  
  sketchybar --set "$NAME" icon="$ICON" label="${TEMPERATURE}°C"
else
  sketchybar --set "$NAME" icon="󰼱" label="N/A"
fi






