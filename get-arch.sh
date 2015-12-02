#!/bin/sh

arch="$(apk --print-arch)"

if [ "$arch" = "x86_64" ]; then
    echo "$1"
else
    echo "$2"
fi
