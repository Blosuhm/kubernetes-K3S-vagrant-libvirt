#!/bin/bash

set -eu

echo "[TASK 1] update hosts"
echo '192.168.10.100 master master' | tee -a /etc/hosts
echo '192.168.10.100 registry.localhost' | tee -a /etc/hosts
init=2
stop=$(($1 + 1))
for (( c=$init; c<=$stop; c++ ))
do
  worker="$(($c-1))"
  echo "192.168.10.$c worker$worker worker$worker" | tee -a /etc/hosts
done

echo "[TASK 2] Update System"
export DEBIAN_FRONTEND=noninteractive 
apt-get update -y

echo "[TASK 3 ] Configure registry mirror"

sudo mkdir -p /etc/rancher/k3s
sudo tee /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
  "registry.localhost":
    endpoint:
      - "http://registry.localhost"
EOF
