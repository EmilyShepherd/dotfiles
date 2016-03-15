#!/bin/bash

level=$(amixer -D pulse sget Master | grep Left | awk -F'[][]' '/%/ {print $2}' | grep .)
mode=$(amixer -D pulse sget Master | grep Left | awk -F'[][]' '/%/ {print $4}' | grep .)
level=${level:0:-1}

case $1 in
    up)
        level=$(expr $level + 5)
        amixer -D pulse sset Master on $level%
        ;;
    down)
        level=$(expr $level - 5)
        amixer -D pulse sset Master on $level%
        ;;
    mute)
        if test "$mode" == "on"
        then
            level=0
            amixer -D pulse sset Master off
        else
            amixer -D pulse sset Master on
        fi
        ;;
    default)
        echo $0 [up|down|mute]
        exit 1
esac

if test "$level" -gt 60
then
    icon=high
elif test "$level" -gt 30
then
    icon=medium
elif test "$level" -gt 0
then
    icon=low
else
    icon=muted
fi

notify-send " " -i audio-volume-$icon -h int:value:$level -h string:synchronous:volume
