#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-server 2>/dev/null || true

docker run --rm -it \
  --name veilid-server \
  --net veilid \
  --user root \
  --entrypoint bash \
  -p 8080:8080 \
  ghcr.io/theshellland/veilid-node:latest $@
