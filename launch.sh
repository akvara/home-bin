#!/usr/bin/env bash
sudo sysctl -w vm.max_map_count=262144
webstorm.sh &
pycharm &
cd ~/CCT/layerv-ccb/ && ./bin/develop.sh &
google-chrome &
