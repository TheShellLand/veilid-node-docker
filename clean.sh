#!/bin/bash

# clean veilid

cd $(dirname $0); set -xe

docker image rm ghcr.io/theshellland/veilid-node
