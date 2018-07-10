#!/usr/bin/env bash

git co master
git pull
git remote update origin --prune
git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
