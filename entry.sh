#!/bin/bash

# entrypoint

set -e

if [ ! -f "$VEILID_CONFIG" ]; then
  cp -v /veilid-server.conf "$VEILID_CONFIG"
fi

VEILID_EVAL="/root/.cargo/bin/veilid-server"

if which veilid-server; then
  VEILID_EVAL="$(which veilid-server)"
fi

ENV_VARS=""

if [ ! -z "$RUST_BACKTRACE" ]; then
  ENV_VARS="env RUST_BACKTRACE=${RUST_BACKTRACE}"
fi

if [ ! -z "$COLORBT_SHOW_HIDDEN" ]; then
  ENV_VARS="env COLORBT_SHOW_HIDDEN=${COLORBT_SHOW_HIDDEN} ${ENV_VARS}"
fi

if [ ! -z "$LOGGING_SYSTEM_ENABLED" ]; then
  VEILID_EVAL="${VEILID_EVAL} -s logging.system.enabled=${LOGGING_SYSTEM_ENABLED}"
fi

if [ "$DEBUG" == "true" ]; then
  VEILID_EVAL="${VEILID_EVAL} --debug"
fi

if [ "$TRACE" == "true" ]; then
  VEILID_EVAL="${VEILID_EVAL} --trace"
fi

#${VEILID_EVAL} --dump-config

set -x

exec ${ENV_VARS} ${VEILID_EVAL} $@
