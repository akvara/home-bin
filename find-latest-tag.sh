#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

git fetch origin develop --tags

git tag | node $DIR/find-latest-tag.js $DIR
