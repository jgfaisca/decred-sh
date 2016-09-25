#!/bin/bash
#
# decred terminal
#

#NET="--testnet"
NET=""
DCR_BIN_PATH="$GOPATH/bin"
RPC_USER="rpcuser"
RPC_PASSWORD="c04cf25e0b694f3b25062d1dab05ec234e40b557"
CMD="$DCR_BIN_PATH/dcrctl $NET -u $RPC_USER -P $RPC_PASSWORD --wallet getnewaddress"
eval $CMD
