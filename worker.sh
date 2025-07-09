#!/bin/bash

echo "[INFO] Waiting for /vagrant/joincluster.sh to become available..."
while [ ! -f /vagrant/joincluster.sh ]; do
  sleep 2
done

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Join node to Kubernetes Cluster"
bash /vagrant/joincluster.sh

echo "===================================="
echo 'run command: vagrant ssh master -c "kubectl get nodes -o wide"'
echo "===================================="