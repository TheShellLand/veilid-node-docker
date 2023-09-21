#!/bin/bash

# test veilid

cd $(dirnamr $0); set -xe

docker run --rm -it veilid-node:latest
