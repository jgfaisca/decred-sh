#!/bin/bash
#
# Decred dcrd daemon status
#

BIN="dcrd"
PIDFILE="/tmp/$BIN.pid"

function getPid(){
        B0=$(echo $BIN | awk '{print substr($0,1,length-1)}')
        B1=$(echo $BIN | awk '{print substr($0,length,1)}')
        CMD="ps aux --sort pid | grep '$B0[$B1]'| grep -v '/bin/bash'"
        OUT=$(eval $CMD)
        PID=$(echo $OUT | awk 'NR==1 {print $2}')
        if [ "$PID" = 0 ] || [ -z "$PID" ] ; then
                return 1
        else
                return 0
        fi
}

function notRunning(){
        echo "$BIN stop/waiting"
        exit 1
}

function isRunning(){
        echo "$BIN start/running, $PID"
        echo $PID > $PIDFILE
        exit 0
}

getPid && isRunning || notRunning


