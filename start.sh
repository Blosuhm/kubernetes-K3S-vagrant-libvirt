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

echo "[INFO] Done."

echo "==============================="
echo 'run command: kubectl get nodes'
echo "==============================="