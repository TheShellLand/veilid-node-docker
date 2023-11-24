#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker run --rm -it ghcr.io/theshellland/veilid-node:latest $@
