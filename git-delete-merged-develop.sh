#!/usr/bin/env bash

git co develop
git pull
git remote update origin --prune
BRANCHES="$(git branch --merged | egrep -v """(^\*|master|develop)""")"
if [ "$BRANCHES" != "" ]; then
    git branch -d $BRANCHES
fi
git fetch --all --prune

