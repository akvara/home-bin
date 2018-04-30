#!/usr/bin/env bash

git co master
git remote update origin --prune
git branch | grep -v '^[ *]*master$' | grep -v '^[ *]*staging$'| grep -v '^[ *]*feature$' | xargs git branch -D
