#!/bin/bash

# test veilid

cd $(dirname $0); set -xe

docker run --rm -it --privileged $@ veilid-node:latest
