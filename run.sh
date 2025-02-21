#!/bin/bash

# run veilid

cd $(dirname $0); set -xe

docker network create veilid || true
docker rm -f veilid-server 2>/dev/null || true

docker run -d --name veilid-server --net veilid \
-v veilid-server-config:/config \
-v veilid-server-node:/root/.local/share/veilid/ \
-v veilid-server-logs:/logs \
-v veilid-server-data:/var/db/veilid-server \
-e DEBUG=false \
--restart always \
ghcr.io/theshellland/veilid-node:latest \
"$@"