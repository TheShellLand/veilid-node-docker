#!/bin/bash

# entrypoint

set -xe

id

VEILID_EVAL="veilid-server"

if [ ! -z "$RUST_BACKTRACE" ]; then
  VEILID_EVAL="RUST_BACKTRACE=${RUST_BACKTRACE} ${VEILID_EVAL}"
fi

if [ ! -z "$RUST_BACKTRACE" ]; then
  VEILID_EVAL="RUST_BACKTRACE=${RUST_BACKTRACE} ${VEILID_EVAL}"
fi

if [ ! -z "$COLORBT_SHOW_HIDDEN" ]; then
  VEILID_EVAL="COLORBT_SHOW_HIDDEN=${COLORBT_SHOW_HIDDEN} ${VEILID_EVAL}"
fi

if [ ! -z "$LOGGING_SYSTEM_ENABLED" ]; then
  VEILID_EVAL="${VEILID_EVAL} -s logging.system.enabled=${LOGGING_SYSTEM_ENABLED}"
fi

if [ ! -z "$DEBUG" ]; then
  VEILID_EVAL="${VEILID_EVAL} --debug"
fi

if [ ! -z "$TRACE" ]; then
  VEILID_EVAL="${VEILID_EVAL} --trace"
fi

veilid-server --dump-config

eval ${VEILID_EVAL} $@
