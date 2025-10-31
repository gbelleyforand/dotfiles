#!/bin/bash

ACTIVE_COLOR=0xff9d0006
INACTIVE_COLOR=0xff504945
WIDTH=11.0

killall borders 2>/dev/null
borders active_color=$ACTIVE_COLOR inactive_color=$INACTIVE_COLOR width=$WIDTH &
