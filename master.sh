#!/bin/bash

echo "[TASK 1] Create K3S Kubernetes Cluster"
curl -sfL https://get.k3s.io | sh -


echo "[TASK 2] Generate and save cluster join command to /vagrant/joincluster.sh"

K3S_NODE_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)

JOIN_COMMAND="curl -sfL https://get.k3s.io | K3S_URL=https://master:6443 K3S_TOKEN=${K3S_NODE_TOKEN} sh -"
echo "$JOIN_COMMAND" > /vagrant/joincluster.sh