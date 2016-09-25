#!/bin/bash
#
# Start POW GPU mining
#
# Output flags:
# --quiet 	Disable logging output, display status and errors
# --real-quiet 	Disable all output
# --debug	Enable debug output
#

BIN_PATH="$HOME/cgminer"
BIN="cgminer"
PIDFILE="/tmp/$BIN.pid"
#LOGFILE="/tmp/$BIN.log"
LOGFILE="/dev/null"

URL="http://dcr.suprnova.cc"
PORT="9110"
USER="djang00.superdcr"
PASSWORD="rqaV9FCtXxWEpQfP"
EXTRA_FLAGS="--no-submit-stale --scan-time 2 --queue 1 --real-quiet"

#solo mining
#URL="https://127.0.0.1"
#PORT="9109"
#USER="rpcuser"
#PASSWORD="c04cf25e0b694f3b25062d1dab05ec234e40b557"

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

function startDaemon(){
        nohup $BIN_PATH/$BIN --blake256 -o "$URL:$PORT" -u $USER -p $PASSWORD $EXTRA_FLAGS > $LOGFILE 2>&1 &
        sleep 4
}

function startConsole(){
        $BIN_PATH/$BIN --blake256 -o "$URL:$PORT" -u $USER -p $PASSWORD $EXTRA_FLAGS
}


function isRunning(){
        echo "$BIN start/running, $PID"
        echo $PID > $PIDFILE
        exit 0
}

getPid || startDaemon
getPid && isRunning || exit 1

exit 0
