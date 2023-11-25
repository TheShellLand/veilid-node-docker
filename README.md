# veilid-node-docker

Run a Veilid Node in docker

<img width="1618" alt="image" src="https://github.com/TheShellLand/veilid-node-docker/assets/58240560/314913ec-653d-4ae5-a45c-9d79ebd7b397">

## Install and run a Veilid Node standalone

official: https://gitlab.com/veilid/veilid/-/blob/main/INSTALL.md

## Install and run on docker

```shell
/bin/bash build.sh
```

```shell
/bin/bash test.sh
```

```shell
/bin/bash run.sh
```

```shell
/bin/bash veilid-server
```

## Arguments

```shell
Veilid Server

Usage: veilid-server [OPTIONS]

Options:
  -d, --daemon                           Run in daemon mode in the background
  -f, --foreground                       Run in the foreground
  -c, --config-file <FILE>               Specify a configuration file to use [default: /etc/veilid-server/veilid-server.conf]
  -s, --set-config <CONFIG>              Specify configuration value to set (key in dot format, value in json format), eg: logging.api.enabled=true
  -p, --password <PASSWORD>              Specify password to use to protect the device encryption key
      --new-password <PASSWORD>          Change password used to protect the device encryption key. Device storage will be migrated
      --no-attach                        Do not automatically attach the server to the Veilid network
      --debug                            Turn on debug logging on the terminal
      --trace                            Turn on trace logging on the terminal
      --otlp <endpoint>                  Turn on OpenTelemetry tracing
      --subnode-index <SUBNODE_INDEX>    Run as an extra daemon on the same machine for testing purposes, specify a number greater than zero to offset the listening ports
      --generate-key-pair <crypto_kind>  Only generate a new keypair and print it
      --set-node-id <key_set>            Set the node ids and secret keys
      --delete-protected-store           Delete the entire contents of the protected store (DANGER, NO UNDO!)
      --delete-table-store               Delete the entire contents of the table store (DANGER, NO UNDO!)
      --delete-block-store               Delete the entire contents of the block store (DANGER, NO UNDO!)
      --dump-config                      Instead of running the server, print the configuration it would use to the console
      --dump-txt-record                  Prints the bootstrap TXT record for this node and then quits
      --emit-schema <schema_name>        Emits a JSON-Schema for a named type
      --bootstrap <BOOTSTRAP_LIST>       Specify a list of bootstrap hostnames to use
      --panic                            panic on ctrl-c instead of graceful shutdown
      --network-key <KEY>                password override to use for network isolation
      --console                          enable tokio console
  -h, --help                             Print help (see more with '--help')
  -V, --version                          Print version
```
