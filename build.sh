#!/bin/bash

cd $(dirname $0); set -xe
# build

docker build $@ -t veilid-node:latest .
