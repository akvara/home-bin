#!/usr/bin/env bash

if [ "$1" == "" ]; then
    echo usage: $0 new-host-name
    exit 1
fi

host=$(hostname)
echo changing $host to $1
sudo sed -i "s/$host/$1/" /etc/hosts
sudo sed -i "s/$host/$1/" /etc/hostname
