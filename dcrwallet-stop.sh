#!/bin/bash
#
# Stop dcrwallet daemon
#

PID=0
BIN="dcrwallet"
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

function notRunning() {
        echo "$BIN stop/waiting"
	# remove pid file
	[ -f $PIDFILE ] && rm $PIDFILE
}

function stop() {
        kill $PID
	getPid || notRunning && exit 1
}

# kill process
getPid && stop || notRunning

exit 0
