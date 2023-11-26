#!/bin/bash

# run veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-node 2>/dev/null || true

if [ -z "$@" ]; then
  docker run -d --name veilid-node --net veilid ghcr.io/theshellland/veilid-node:latest --set-config "client_api.listen_address='0.0.0.0:5959'" $@
else
  docker run -d --name veilid-node --net veilid -p 5959:5959 ghcr.io/theshellland/veilid-node:latest $@
fi
