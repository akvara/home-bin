#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
    echo usage: "$0" commit-message
    exit 1
fi

youtube-dl -x --audio-format mp3 "$1"
