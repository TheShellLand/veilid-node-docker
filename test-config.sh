#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker run --rm -it -p 5959:5959 -v "$(pwd)/config/veilid-server.conf":/veilid-server.conf ghcr.io/theshellland/veilid-node:latest --config-file /veilid-server.conf $@
