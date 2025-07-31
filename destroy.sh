#!/usr/bin/env bash

set -eu

echo "[Task 1] deleting joincluster file"
jc="./auxiliar_scripts/joincluster.sh"
if [ -f $jc ]; then
  rm ./auxiliar_scripts/joincluster.sh
fi

echo "[Task 2] vagrant destroy"
vagrant destroy -f

echo "[Task 3] remove config"
KUBECONFIG=~/.kube/config

if [ -f $KUBECONFIG ]; then
  rm $KUBECONFIG
fi

echo "[Task 4] remove registry.localhost from /etc/hosts"
sudo sed -i '/registry.localhost/d' /etc/hosts

echo "[Task 5] removing insecure registry from docker"

DOCKER_DAEMON=/run/docker/daemon.json

if [ -f $DOCKER_DAEMON ]; then
  sudo rm -f $DOCKER_DAEMON
  sudo systemctl restart docker
fi
