#!/bin/bash

MEMORY_STATS=$(vm_stat)
PAGE_SIZE=$(pagesize)

PAGES_FREE=$(echo "$MEMORY_STATS" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
PAGES_INACTIVE=$(echo "$MEMORY_STATS" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
PAGES_SPECULATIVE=$(echo "$MEMORY_STATS" | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
PAGES_WIRED=$(echo "$MEMORY_STATS" | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
PAGES_COMPRESSED=$(echo "$MEMORY_STATS" | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')
PAGES_ACTIVE=$(echo "$MEMORY_STATS" | grep "Pages active" | awk '{print $3}' | sed 's/\.//')

FREE_MEM=$((($PAGES_FREE + $PAGES_INACTIVE + $PAGES_SPECULATIVE) * $PAGE_SIZE / 1024 / 1024))
USED_MEM=$((($PAGES_WIRED + $PAGES_COMPRESSED + $PAGES_ACTIVE) * $PAGE_SIZE / 1024 / 1024))
TOTAL_MEM=$(($FREE_MEM + $USED_MEM))

MEMORY_PERCENT=$(echo "$USED_MEM $TOTAL_MEM" | awk '{printf "%.0f", ($1/$2)*100}')

sketchybar --set $NAME label="$MEMORY_PERCENT%"






