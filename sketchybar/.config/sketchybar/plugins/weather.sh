#!/bin/bash

LOCATION="Gatineau"
CACHE_FILE="/tmp/sketchybar_weather_cache.txt"
CACHE_DURATION=600

if [ -f "$CACHE_FILE" ]; then
  CACHE_AGE=$(($(date +%s) - $(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0)))
  if [ $CACHE_AGE -lt $CACHE_DURATION ]; then
    WEATHER_DATA=$(cat "$CACHE_FILE")
  fi
fi

if [ -z "$WEATHER_DATA" ]; then
  TEMP=$(curl -s --max-time 10 "https://wttr.in/${LOCATION}?format=%t" | tr -d ' ')
  CONDITION=$(curl -s --max-time 10 "https://wttr.in/${LOCATION}?format=%C" | tr -d ' ')
  
  if [ -n "$TEMP" ] && [ "$TEMP" != "Unknown" ]; then
    WEATHER_DATA="${TEMP}|${CONDITION}"
    echo "$WEATHER_DATA" > "$CACHE_FILE"
  fi
fi

if [ -n "$WEATHER_DATA" ]; then
  TEMPERATURE=$(echo "$WEATHER_DATA" | cut -d'|' -f1)
  CONDITION=$(echo "$WEATHER_DATA" | cut -d'|' -f2)
  
  case $CONDITION in
    *Clear*|*Sunny*) ICON="󰖙" ;;
    *Partly*cloudy*) ICON="󰖕" ;;
    *Cloudy*|*Overcast*) ICON="󰖐" ;;
    *Mist*|*Fog*) ICON="󰖑" ;;
    *rain*|*drizzle*) ICON="󰖗" ;;
    *snow*|*sleet*|*ice*) ICON="󰼶" ;;
    *Freezing*) ICON="󰖒" ;;
    *thunder*) ICON="󰙾" ;;
    *) ICON="󰖐" ;;
  esac
  
  sketchybar --set "$NAME" icon="$ICON" label="${TEMPERATURE}"
else
  sketchybar --set "$NAME" icon="󰼱" label="N/A"
fi






