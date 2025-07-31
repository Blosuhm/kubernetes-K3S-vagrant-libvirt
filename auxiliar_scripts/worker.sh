#!/bin/bash

set -eu

echo "[INFO] Waiting for joincluster.sh to become available..."
while [ ! -f /vagrant/auxiliar_scripts/joincluster.sh ]; do
  sleep 2
done

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Join node to Kubernetes Cluster"
bash /vagrant/auxiliar_scripts/joincluster.sh
