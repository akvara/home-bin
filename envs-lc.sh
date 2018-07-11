#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 lc_backend
cd ~/CCT/life-coach
echo copy dir: /home/andrius/CCT/environments/lc_backend/bin/
echo Alt-F12, execute:  source ../../environments/lc_backend/bin/activate
echo execute: pip3 install -r requirements.txt
