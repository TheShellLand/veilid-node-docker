#!/bin/bash

# run veilid

cd $(dirname $0); set -xe

docker rm -f veilid-node || true
docker run -d --name veilid-node -p 5959:5959 -p 4317:4317 $@ veilid-node:latest
