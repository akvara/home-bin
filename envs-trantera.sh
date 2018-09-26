#!/usr/bin/env bash

cd ~/CCT/
mkdir environments
cd environments
virtualenv -p python3 trantera-bms
cd ~/CCT/trantera-bms
echo Now:
echo {copy} this:
echo /home/andrius/CCT/environments/trantera-bms/bin/
echo Settings, Project Interpreter, Add local, {paste}
echo Alt-F12,  {copy} this:
echo source ../../environments/trantera-bms/bin/activate
echo {Shift-Insert},  {copy} this:
echo pip3 install -r requirements.txt
echo {Shift-Insert}, done.
