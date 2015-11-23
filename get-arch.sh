#!/bin/sh

arch="$(apk --print-arch)"

if [ "$arch" = "x86_64" ]; then
    echo "amd64"
else
    echo "$arch"
fi
