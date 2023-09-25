#!/bin/bash

# entrypoint

set -xe

id

RUST_BACKTRACE=1 RUST_BACKTRACE=full COLORBT_SHOW_HIDDEN=1 veilid-server
