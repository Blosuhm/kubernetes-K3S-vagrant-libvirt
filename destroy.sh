#!/bin/bash

echo "[Task 1] deleting joincluster file"
rm ./auxiliar_scripts/joincluster.sh

echo "[Task 2] vagrant destroy"
vagrant destroy -f

echo "[Task 3] remove config"
rm ~/.kube/config

echo "[Task 4] remove registry.localhost to /etc/hosts"

sudo sed -i '/registry.localhost/d' /etc/hosts