#!/bin/bash

get()
{
    amixer sget $1 | grep -m1 "$2:" | awk -F'[][]' "/%/ {print \$$3}"
}

toggle()
{
    local mode=on

    if test $(get $1 $2 6) == "on"
    then
        mode=off
    fi

    amixer sset $1 $mode

    notify-send Toggled $1
}

change_master()
{
    local level=$(get Master Mono 2)
    level=${level:0:-1}

    if test "$level" -gt 100
    then
        level=100
    fi

    level=$(expr $level $1 5)
    amixer sset Master on $level%
    
    notify-send "Volume" -h int:value:$level
}

case $1 in
    up)
        change_master + ;;
    down)
        change_master - ;;
    mute)
        toggle Master Mono ;;
    mute-spkr)
        toggle Speaker Left ;;
    default)
        echo $0 [up|down|mute|mute-spkr]
        exit 1
esac

