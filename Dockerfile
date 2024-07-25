FROM ghcr.io/theshellland/rust:latest

ENV RUST_BACKTRACE=1
ENV RUST_BACKTRACE=full
ENV COLORBT_SHOW_HIDDEN=1
ENV LOGGING_SYSTEM_ENABLED=false
ENV DEBUG=true
ENV TRACE=""

# install
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl git build-essential vim iputils-ping netcat-traditional
RUN git clone https://gitlab.com/veilid/veilid
RUN cd /veilid/veilid-server \
    && /root/.cargo/bin/cargo install --path .

COPY entry.sh /entry.sh
COPY config/veilid-server.conf /root/.config/veilid/veilid-server.conf

# config
VOLUME /root/.config/veilid/

# State holds the node ID etc. to persist between runs
VOLUME /root/.local/share/veilid/

# logs
VOLUME /logs

# data
VOLUME /var/db/veilid-server

# listen_address
# IPC is used by default
EXPOSE 5959

# I see this port used in logs
EXPOSE 5150

# grpc_endpoint
EXPOSE 4317

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "/entry.sh"]
