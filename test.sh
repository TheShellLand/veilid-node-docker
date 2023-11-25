#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker run --rm -it -p 5959:5959 ghcr.io/theshellland/veilid-node:latest $@
