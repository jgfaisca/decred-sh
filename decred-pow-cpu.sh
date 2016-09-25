#!/bin/bash
#
# decred POW CPU minning
#

#NET="--mainnet"
NET=""
DCR_BIN_PATH="$GOPATH/bin"
RPC_USER="rpcuser"
RPC_PASSWORD="c04cf25e0b694f3b25062d1dab05ec234e40b557"

$DCR_BIN_PATH/dcrctl $NET -u $RPC_USER -P $RPC_PASSWORD setgenerate true
$DCR_BIN_PATH/dcrctl $NET -u $RPC_USER -P $RPC_PASSWORD --miningaddr DsfPWGJMt78s7yAvLkQFaA8pTF5XgjwWNWo

$DCR_BIN_PATH/dcrctl $NET -u $RPC_USER -P $RPC_PASSWORD gethashespersec

