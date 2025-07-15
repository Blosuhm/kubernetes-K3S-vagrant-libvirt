#!/bin/bash

echo "[Task 1] starting vagrant"
vagrant up

echo "[Task 2] activate kubectl"

echo "[INFO] Copying kubeconfig from master VM..."
vagrant ssh master -c "sudo cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config

export KUBECONFIG=$HOME/.kube/config

echo "[INFO] changing permissions of kube config file"
sudo chown $(id -u):$(id -g) $HOME/.kube/config
chmod 600 $HOME/.kube/config

echo "[INFO] adding registry.localhost to /etc/hosts"

if ! grep -q "registry.localhost" /etc/hosts; then
  echo "192.168.10.100 registry.localhost" | sudo tee -a /etc/hosts
  echo "[INFO] Added registry.localhost to /etc/hosts"
else
  echo "[INFO] registry.localhost already exists in /etc/hosts"
fi

echo "[INFO] Done."

echo "==============================="
echo 'run command: kubectl get nodes'
echo "==============================="