#!/bin/bash

echo "[Task 1] deleting joincluster file"
rm ./auxiliar_scripts/joincluster.sh

echo "[Task 2] vagrant destroy"
vagrant destroy -f