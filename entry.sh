#!/bin/bash

# entrypoint

set -xe

id
cd
RUST_BACKTRACE=1 RUST_BACKTRACE=full COLORBT_SHOW_HIDDEN=1 veilid-server -s logging.system.enabled=false > veilid.log 2> veilid-errors.log &

jobs

tail -f veilid.log veilid-errors.log
