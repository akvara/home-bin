#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$1" == "" ]]; then
    echo usage: "$0" "{tracking-numbers-list}"
    exit 1
fi

python3 "$DIR"/tracker.py "$*"
