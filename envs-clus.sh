#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 clus_backend
cd ~/CCT/clusco
echo copy dir: /home/andrius/CCT/environments/clus_backend/bin/
echo Alt-F12, execute:  source ../../environments/clus_backend/bin/activate
echo execute: pip3 install -r requirements.txt
