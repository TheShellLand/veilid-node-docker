#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-node 2>/dev/null || true
docker run --rm -it --name veilid-node --net veilid --entrypoint bash ghcr.io/theshellland/veilid-node:latest $@
