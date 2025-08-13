#!/usr/bin/env bash

set -eu

echo "[Task 1] starting vagrant"
vagrant up --no-parallel

echo "[Task 2] activate kubectl"

export KUBECONFIG=$HOME/.kube/config

echo "[INFO] Copying kubeconfig from master VM..."
vagrant ssh master -c "sudo cat /etc/rancher/k3s/k3s.yaml" > $KUBECONFIG

echo "[INFO] changing permissions of kube config file"
sudo chown $(id -u):$(id -g) $KUBECONFIG
chmod 600 $KUBECONFIG

echo "[INFO] adding registry.localhost to /etc/hosts"

if ! grep -q "registry.localhost" /etc/hosts; then
  echo "192.168.10.100 registry.localhost" | sudo tee -a /etc/hosts
  echo "[INFO] Added registry.localhost to /etc/hosts"
else
  echo "[INFO] registry.localhost already exists in /etc/hosts"
fi

echo "[INFO] adding insecure registry to docker"

echo '{ "insecure-registries" : ["registry.localhost"] }' | sudo tee /run/docker/daemon.json
sudo systemctl restart docker

echo "[INFO] Done."

echo "==============================="
echo 'run command: kubectl get nodes'
echo "==============================="
