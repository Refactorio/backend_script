#!/bin/bash
#parameters: $1=repository $2=branch $3=map $4=debug
set -e #this forces an exit on any error

if [ -z "$2" ]; then
    branch="develop"
    echo "No branch provided, using 'develop'."
else
    branch=$2
fi

# If branch is develop or a PR, force them to take the Refactorio repository.
if [ "$branch" == "develop" ] || [[ $branch == pr/* ]]; then
    echo "Develop or PR branch selected, changing repository to Refactorio"
    repository="Refactorio"
else
    repository=$1
fi

if [ -z "$3" ]; then
    map="default"
    echo "No map provided, using 'default'."
else
    map=$3
fi

if [ -z "$4" ]; then
    debug=false
    echo "Debug setting not provided, using 'false'."
else
    debug=$4
fi

# Custom section for discord names =/= github repository

#arguments to script: folder=$1 repository=$2 branch=$3 map=$4 debug=$5
script_path='/home/factorio/backend_scripts/git_update_scripts/generic-updater.sh'

echo '------------------------------------------'
echo $script_path RedMew $repository "$branch" "$map" "$debug"
date
$script_path RedMew $repository "$branch" "$map" "$debug"
