#!/usr/bin/env bash
set -e
#$1 = the PR#
#$2 = the map

if [ -z "$1" ]; then
    echo "Missing argument: need to specify the PR#."
    exit 1
fi

if [ -z "$2" ]; then
    map_check="default"
    echo "No map provided, using default."
else
    map_check=$2
fi

### These need to be set to pass them to the generic updater

folder="PR"
repository="origin"
branch="pr/$1"
map=$map_check
cleanup=false
debug=true

source /home/factorio/bin/generic-updater.sh

echo "$folder updated successfully with PR:$1 and map: $map"
