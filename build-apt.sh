#!/bin/bash

set -xe
cd "$(dirname $0)"
# build

docker build $@ -t ghcr.io/theshellland/veilid-node:latest -f Dockerfile-apt .
