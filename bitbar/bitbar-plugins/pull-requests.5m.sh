#!/usr/bin/env bash

MY_LOC=$(dirname $0)
PATH=${NVM_DIR}/versions/node/v8.16.0/bin/node:$PATH
$(which node) $(dirname $0)/pull-requests.5m/pull-requests.5m.js

