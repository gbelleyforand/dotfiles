#!/bin/bash

has_notch() {
  system_profiler SPDisplaysDataType | grep -q "Built-In Display"
  if [ $? -eq 0 ]; then
    RESOLUTION=$(system_profiler SPDisplaysDataType | grep Resolution | head -1)
    
    if echo "$RESOLUTION" | grep -q "3024 x 1964" || \
       echo "$RESOLUTION" | grep -q "3456 x 2234" || \
       echo "$RESOLUTION" | grep -q "3024 x 1890"; then
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

