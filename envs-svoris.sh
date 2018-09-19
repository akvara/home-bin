#!/usr/bin/env bash

cd ~/Projects/
mkdir environments
cd environments
virtualenv -p python3 svoris
cd ~/Projects/svoris
echo [copy] this: /home/andrius/Projects/environments/svoris/bin/
echo Settings, Project Interpreter, Add local, [paste]
echo Alt-F12,  source ../../environments/svoris/bin/activate
echo pip3 install -r requirements.txt
