#!/usr/bin/env bash
set -e
#$1 = folder
#$2 = repository
#$3 = branch
#$4 = map
#$5 = cleanup (delete the map_gen/data folder)
#$6 = debug

if [ -z "$1" ]; then
    echo "Missing argument: folder."
    exit 1
fi
if [ -z "$2" ]; then
    echo "Missing argument: repository."
    exit 1
fi
if [ -z "$3" ]; then
    echo "Missing argument: branch."
    exit 1
fi
if [ -z "$4" ]; then
    echo "Missing argument: map."
    exit 1
fi
if [ -z "$5" ]; then
    echo "Missing argument: cleanup."
    exit 1
elif [ "$5" == 'true' ]; then
    cleanup=true
else
    cleanup=$5
fi
if [ -z "$6" ]; then
    echo "Missing argument: debug."
    exit 1
elif [ "$6" == 'true' ]; then
    debug=true
else
    debug=$6
fi

### These need to be set to pass them to the generic updater

folder=$1
repository=$2
branch=$3
map=$4

source /home/factorio/bin/generic-updater.sh

echo "$folder updated from $repository/$branch successfully with map: $map"
