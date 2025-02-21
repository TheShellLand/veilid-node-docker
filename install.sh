#!/bin/bash

# install

set -xe

apt update && \
apt upgrade -y && \
apt install -y curl git build-essential vim iputils-ping netcat-traditional cmake && \
apt clean && \
rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/*

git clone https://gitlab.com/veilid/veilid && \
cd /veilid/veilid-server && \
git pull && \
/root/.cargo/bin/cargo install --path . && \
rm -rf /veilid/veilid-server
