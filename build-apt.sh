#!/bin/bash

cd $(dirname $0); set -xe
# build

docker build $@ -t ghcr.io/theshellland/veilid-node:latest -f Dockerfile-apt .
