#!/bin/bash
#
# Start decred dcrd daemon
#
# Available log levels:
# trace, debug, info, warn, error, critical
#

BIN_PATH="$GOPATH/bin"
BIN="dcrd"
LOGDIR="/tmp"
OUTFILE="/dev/null"
PIDFILE="/tmp/$BIN.pid"
PID=0
DEBUG_LEVEL="warn"
#NOTLS="--notls"
#TESTNET="--testnet"

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
	nohup $BIN_PATH/$BIN $TESTNET $NOTLS --debuglevel=$DEBUG_LEVEL --logdir=$LOGDIR > $OUTFILE 2>&1 &
	sleep 4
}

function isRunning(){
	echo "$BIN start/running, $PID"
        echo $PID > $PIDFILE
	exit 0
}

getPid || startDaemon
getPid && isRunning || exit 1


