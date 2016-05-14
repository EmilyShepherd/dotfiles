#!/bin/bash

get()
{
    amixer sget $1 | grep -m1 "$2:" | awk -F'[][]' "/%/ {print \$$3}"
}

toggle()
{
    if test $(get $1 $2 6) == "on"
    then
        amixer sset $1 off
        notif VOL "Volume" "Muted $1"
    else
        amixer sset $1 on
        notif VOL "Volume" "Unmuted $1"
    fi
}

change_master()
{
    local level=$(get Master Mono 2)
    level=$(expr ${level:0:-1} $1 5)

    if test "$level" -gt 100
    then
        level=100
    fi

    amixer sset Master on $level%

    hashes=$(expr $level / 2)

    msg1=$(eval "printf '\\u2588%.0s' {1..$hashes}")

    if ! test $hashes -eq 50
    then
        msg2=$(eval "printf '\\u2591%.0s' {1..$(expr 50 - $hashes)}")
    fi
    
    notif VOL -h int:value:$level "Volume" "\n[${msg1}${msg2}]"
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

