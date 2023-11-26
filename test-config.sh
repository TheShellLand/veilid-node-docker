#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-node 2>/dev/null || true
docker run --rm -it --name veilid-node -p 5959:5959 --net veilid -v "$(pwd)/config/veilid-server.conf":/veilid-server.conf ghcr.io/theshellland/veilid-node:latest --config-file /veilid-server.conf $@
