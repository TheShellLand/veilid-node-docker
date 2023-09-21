#!/bin/bash

# run veilid

cd $(dirnamr $0); set -xe

docker rm -f veilid-node || true
docker run -d --name veilid-node veilid-node:latest .
