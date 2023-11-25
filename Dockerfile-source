FROM ghcr.io/theshellland/rust:latest

# install
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl git build-essential vim iputils-ping netcat
RUN git clone https://gitlab.com/veilid/veilid
RUN cd /veilid/veilid-server \
    && /root/.cargo/bin/cargo install --path .

COPY entry.sh /entry.sh

# config
VOLUME /config

# State holds the node ID etc. to persist between runs
VOLUME /root/.local/share/veilid/

# logs
VOLUME /logs

# data
VOLUME /var/db/veilid-server

# listen_address
EXPOSE 5959

# grpc_endpoint
EXPOSE 4317

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "/entry.sh"]
