#!/usr/bin/env bash
set -e
user="plague"
#$1 = the branch
#$2 = the map

if [ -z "$1" ]; then
    echo "Missing argument: need to specify the branch."
    exit 1
fi

if [ -z "$2" ]; then
    map_check="default"
    echo "No map provided, using default."
else
    map_check=$2
fi

### These need to be set to pass them to the generic updater

folder=$user
repository=$user
branch=$1
map=$map_check
cleanup=true
debug=true

source /home/factorio/bin/generic-updater.sh

echo "$folder updated successfully with map: $map"

exit 0
