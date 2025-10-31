#!/bin/bash

MEDIA_INFO=""

if command -v nowplaying-cli &> /dev/null; then
  TITLE=$(nowplaying-cli get title 2>/dev/null)
  ARTIST=$(nowplaying-cli get artist 2>/dev/null)
  
  if [ -n "$TITLE" ] && [ "$TITLE" != "null" ]; then
    if [ -n "$ARTIST" ] && [ "$ARTIST" != "null" ]; then
      MEDIA_INFO="$TITLE – $ARTIST"
    else
      MEDIA_INFO="$TITLE"
    fi
  fi
fi

if [ -z "$MEDIA_INFO" ]; then
  MUSIC_STATE=$(osascript -e 'tell application "Music" to get player state as string' 2>/dev/null)
  if [ "$MUSIC_STATE" = "playing" ]; then
    MEDIA_INFO=$(osascript -e 'tell application "Music" to return (get name of current track) & " – " & (get artist of current track)' 2>/dev/null)
  fi
fi

if [ -z "$MEDIA_INFO" ]; then
  SPOTIFY_STATE=$(osascript -e 'tell application "Spotify" to get player state as string' 2>/dev/null)
  if [ "$SPOTIFY_STATE" = "playing" ]; then
    MEDIA_INFO=$(osascript -e 'tell application "Spotify" to return (get name of current track) & " – " & (get artist of current track)' 2>/dev/null)
  fi
fi

if [ -z "$MEDIA_INFO" ]; then
  YOUTUBE_INFO=$(osascript -e '
    tell application "Arc"
      repeat with w in windows
        repeat with t in tabs of w
          if URL of t contains "music.youtube.com" then
            set js to "
              try {
                const bar = document.querySelector(\"ytmusic-player-bar\");
                if (!bar) { \"\"; }
                const lines = bar.innerText.split(\"\\n\").map(l => l.trim()).filter(l => l && !l.includes(\"/\") && !l.includes(\":\") && l !== \"•\" && !l.match(/^\\d{4}$/));
                if (lines.length >= 2) {
                  lines[0] + \" – \" + lines[1];
                } else if (lines.length === 1) {
                  lines[0];
                } else {
                  \"\";
                }
              } catch(e) { \"\"; }
            "
            set result to execute t javascript js
            if result is not "" and result is not "null" then
              return result
            end if
          end if
        end repeat
      end repeat
    end tell
    return ""
  ' 2>/dev/null)
  
  if [ -n "$YOUTUBE_INFO" ] && [ "$YOUTUBE_INFO" != "" ] && [ "$YOUTUBE_INFO" != "null" ]; then
    MEDIA_INFO="$YOUTUBE_INFO"
  fi
fi

if [ -z "$MEDIA_INFO" ] || [ "$MEDIA_INFO" = " – " ] || [ "$MEDIA_INFO" = "null – null" ]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" icon="󰎆" label="$MEDIA_INFO" drawing=on
fi

