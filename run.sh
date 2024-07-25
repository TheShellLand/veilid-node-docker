#!/bin/bash

# run veilid

cd $(dirname $0); set -xe

docker network create veilid || true

if [ "$@" == "--dump-config" ]; then
  docker run --rm --net veilid \
  -v veilid-server-config:/root/.config/veilid/ \
  -v veilid-server-node:/root/.local/share/veilid/ \
  -v veilid-server-logs:/logs \
  -v veilid-server-data:/var/db/veilid-server \
  ghcr.io/theshellland/veilid-node:latest \
    $@
elif [ -z "$@" ]; then
  docker rm -f veilid-server 2>/dev/null || true
  docker run -d --name veilid-server --net veilid \
  -v veilid-server-config:/root/.config/veilid/ \
  -v veilid-server-node:/root/.local/share/veilid/ \
  -v veilid-server-logs:/logs \
  -v veilid-server-data:/var/db/veilid-server \
  --restart always \
  ghcr.io/theshellland/veilid-node:latest \
    $@
else
  docker rm -f veilid-server 2>/dev/null || true
  docker run -d --name veilid-server --net veilid \
  -v veilid-server-config:/root/.config/veilid/ \
  -v veilid-server-node:/root/.local/share/veilid/ \
  -v veilid-server-logs:/logs \
  -v veilid-server-data:/var/db/veilid-server \
  -p 5959:5959 \
  -p 5150:5150 \
  --restart always \
  ghcr.io/theshellland/veilid-node:latest \
    $@
fi
