#!/bin/bash

has_notch() {
  system_profiler SPDisplaysDataType | grep -q "Built-in"
  if [ $? -eq 0 ]; then
    RESOLUTION=$(system_profiler SPDisplaysDataType | grep Resolution | head -1)
    
    if echo "$RESOLUTION" | grep -qE "3024 x 1964|3456 x 2234|3024 x 1890"; then
      return 0
    fi
  fi
  return 1
}

if has_notch; then
  echo "left"
else
  echo "center"
fi

