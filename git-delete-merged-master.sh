#!/usr/bin/env bash

git co master
git pull
git remote update origin --prune
BRANCHES="$(git branch --merged | egrep -v """(^\*|master|dev)""")"
if [ "$BRANCHES" != "" ]; then
    git branch -d $BRANCHES
fi
# git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
