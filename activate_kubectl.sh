#!/bin/bash

echo "[INFO] Copying kubeconfig from master VM..."
vagrant ssh master -c "sudo cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config

export KUBECONFIG=$HOME/.kube/config

echo "[INFO] changing permissions"
sudo chown $(id -u):$(id -g) $HOME/.kube/config
chmod 600 $HOME/.kube/config

echo "[INFO] Testing connection with kubectl..."
kubectl get nodes -o wide

echo "[INFO] Done. You can now use kubectl and OpenLens with this config."