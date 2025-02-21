#!/bin/bash

# entrypoint

set -e

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

if [ "$DEBUG" == "true" ]; then
  VEILID_EVAL="${VEILID_EVAL} --debug"
fi

if [ "$TRACE" == "true" ]; then
  VEILID_EVAL="${VEILID_EVAL} --trace"
fi


if [ "$DEBUG" == "true" ]; then
  ${VEILID_EVAL} --dump-config
fi

set -x

exec ${ENV_VARS} ${VEILID_EVAL} $@
