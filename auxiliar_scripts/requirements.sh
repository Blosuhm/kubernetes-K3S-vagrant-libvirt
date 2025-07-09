#!/bin/bash

echo "[TASK 1] update hosts"
echo '192.168.10.100 master master' | tee -a /etc/hosts
init=2
stop=$(($1 + 1))
for (( c=$init; c<=$stop; c++ ))
do
  worker="$(($c-1))"
  echo "192.168.10.$c worker$worker worker$worker" | tee -a /etc/hosts
done

echo "[TASK 2] Update System"
export DEBIAN_FRONTEND=noninteractive 
apt-get update -y
