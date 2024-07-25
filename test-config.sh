#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-server 2>/dev/null || true
docker run --rm -it --name veilid-server --net veilid ghcr.io/theshellland/veilid-node:latest $@
