#!/bin/bash

level=$(amixer -D default sget Master | grep Mono | awk -F'[][]' '/%/ {print $2}' | grep .)
mode=$(amixer -D default sget Master | grep Mono | awk -F'[][]' '/%/ {print $6}' | grep .)
level=${level:0:-1}

case $1 in
    up)
        level=$(expr $level + 5)
        amixer -D default sset Master on $level%
        ;;
    down)
        level=$(expr $level - 5)
        amixer -D default sset Master on $level%
        ;;
    mute)
        if test "$mode" == "on"
        then
            level=0
            amixer -D default sset Master off
        else
            amixer -D default sset Master on
        fi
        ;;
    default)
        echo $0 [up|down|mute]
        exit 1
esac

if ! grep -q '0x40: OUT$' "/proc/asound/card0/codec#0"
then
    icon=
elif test "$level" -gt 70
then
    icon=
elif test "$level" -gt 40
then
    icon=
else
    icon=
fi

if test "$level" -gt 100
then
    level=100
fi

notify-send "Volume" -h int:value:$level
