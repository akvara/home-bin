#!/usr/bin/env bash

git co -b bump/bump
yarn bump --type patch
git-testpush.sh bump

