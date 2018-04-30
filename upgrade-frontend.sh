#!/usr/bin/env bash

localdir="$(basename $PWD)"
frontend="frontend"

if [ "$localdir" != "$frontend" ]
then
    echo "Must be in $frontend dir";
    exit 1;
fi

sudo chown -R andrius .
rm package-lock.json
npm run npminstall && npm run dev-server
