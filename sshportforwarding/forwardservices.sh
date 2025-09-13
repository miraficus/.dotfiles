#!/bin/bash

# 25565 - Default Minecraft Java Port
# 8123 - Default Dynmap Minecraft Plugin Port
# 7777 - Default Terraia Server Port

while true
do
  ssh -i /root/.ssh/id_ed25519 \
    -R 0.0.0.0:25565:localhost:25565 \
    -R 0.0.0.0:8123:localhost:8123 \
    -R 0.0.0.0:25575:localhost:25575 \
    -R 0.0.0.0:8124:localhost:8124 \
    -R 0.0.0.0:7777:localhost:7777 \
    -o ExitOnForwardFailure=no \
    -o ConnectTimeout=120 \
    -o ServerAliveInterval=120 \
    root@ipadress -N

  sleep 10
done
