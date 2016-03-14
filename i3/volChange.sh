#!/bin/bash

vol=$(amixer sget 'Master' | awk -F"[][]" '/dB/ {print $2}')
vol_nice=${vol:0:-1}

if test "$vol_nice" -gt 60
then
    level=high
elif test "$vol_nice" -gt 30
then
    level=medium
elif test "$vol_nice" -gt 0
then
    level=low
else
    level=muted
fi

notify-send " " -i audio-volume-$level -h int:value:$vol_nice -h string:synchronous:volume
