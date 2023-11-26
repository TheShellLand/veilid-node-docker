#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-node 2>/dev/null || true
docker run --rm -it --name veilid-node --net veilid ghcr.io/theshellland/veilid-node:latest --set-config 'client_api.listen_address="0.0.0.0:5959"' $@
