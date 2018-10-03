#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 clusco
cd ~/CCT/clusco
echo copy dir: /home/andrius/CCT/environments/clusco/bin/
echo Alt-F12, execute:  source ../../environments/clusco/bin/activate
echo execute: pip3 install -r requirements.txt
