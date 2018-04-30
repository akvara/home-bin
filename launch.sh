#!/usr/bin/env bash

sudo sysctl -w vm.max_map_count=262144
slack &
webstorm.sh &
pycharm &
google-chrome &
cd ~/CCT/layerv-ccb/ && ./bin/develop.sh &
