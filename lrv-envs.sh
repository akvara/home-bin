#!/usr/bin/env bash

cd ~/CCT
mkdir environments
cd environments
virtualenv -p python3 lrv_backend
virtualenv -p python3 lrv_adapters
virtualenv -p python3 lrv_core
virtualenv -p python3 lrv_organisation
cd ../layerv-ccb
