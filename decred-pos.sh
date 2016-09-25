#!/bin/bash
#
# decred stake minning
#
# This tells the wallet to start with stake mining enabled, 
# to auto-purchase tickets but always keep a 1-conf balance of 
# MIN_BALANCE Coins and to pay MAX_TIKET Coins maximum for 
# any given ticket. 
#
# You will likely want to change the minimum balance and 
# maximum per ticket amounts based on your own preferences.


DCR_BIN_PATH="$GOPATH/bin"
RPC_USER="rpcuser"
RPC_PASSWORD="c04cf25e0b694f3b25062d1dab05ec234e40b557"

MIN_BALACE=200.0
MAX_TIKET=20

$DCR_BIN_PATH/dcrwallet -u $RPC_USER -P $RPC_PASSWORD --enablestakemining --balancetomaintain=$MIN_BALANCE --ticketmaxprice=$MAX_TIKET
