#!/usr/bin/env bash

cd ~/CCT
mkdir environments
cd environments
virtualenv -p python3 lrv_backend
virtualenv -p python3 lrv_adapters
virtualenv -p python3 lrv_core
virtualenv -p python3 lrv_organisation
cd ../layerv-ccb
echo ----- Backend: -----
echo copy dir: /home/andrius/CCT/environments/lrv_backend/bin/
echo Alt-F12, execute:  source ../../environments/lrv_backend/bin/activate
echo execute: pip3 install -r requirements.txt
echo ----- Adapters: -----
