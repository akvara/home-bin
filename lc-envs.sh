#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 lc_backend
cd ~/CCT/life-coach
echo /home/andrius/CCT/environments/lc_backend/bin/
