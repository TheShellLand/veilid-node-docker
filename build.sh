#!/bin/bash

cd $(dirnamr $0); set -xe
# build

docker build -t veilid-node:latest .
