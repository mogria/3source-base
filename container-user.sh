#!/bin/sh
uid="$RUN_AS"

if [ "$uid" -eq 0 ]; then
    echo "warning: no UID specified with -e RUN_AS=\$UID, using default 0, running as root"
    user=root
else
    user=generic-user
    addgroup -g "$uid" "$user"
    adduser -h "$HOME" -D -S -u "$uid" -G "$user" "$user"
fi

if [ -z "$1" ]; then
    gosu "$user" /bin/sh
else
    gosu "$user" "$@"
fi
