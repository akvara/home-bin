#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 id_backend
cd ~/CCT/inform-debtor
echo /home/andrius/CCT/environments/id_backend/bin/
