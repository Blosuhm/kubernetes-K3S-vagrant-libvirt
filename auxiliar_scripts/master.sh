#!/bin/bash

set -eu

echo "[TASK 1] Create K3S Kubernetes Cluster"
curl -sfL https://get.k3s.io | sh -

echo "[INFO] Wait for k3s server to be ready"
# Wait until the API server is responsive
until kubectl get nodes &>/dev/null; do
  echo "Waiting for Kubernetes API server to be ready..."
  sleep 5
done

echo "[TASK 2] Generate and save cluster join command to /vagrant/joincluster.sh"

K3S_NODE_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)

JOIN_COMMAND="curl -sfL https://get.k3s.io | K3S_URL=https://master:6443 K3S_TOKEN=${K3S_NODE_TOKEN} sh -"
echo "$JOIN_COMMAND" > /vagrant/auxiliar_scripts/joincluster.sh

echo "[TASK 3] Deploy local private Docker registry inside the cluster"

kubectl create namespace docker-registry

kubectl apply -n docker-registry -f /vagrant/auxiliar_scripts/registry.yaml
