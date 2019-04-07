#!/bin/bash
#parameters: $1=folder $2=username $3=branch $4=map $5=debug
##parameters: $1=username $2=branch $3=map $4=debug
set -e #this forces an exit on any error

if [ -z "$2" ]; then
    branch="develop"
    echo "No branch provided, using 'develop'."
else
    branch=$2
fi

# If branch is develop or a PR, force them to take the Refactorio username.
if [ "$branch" == "develop" ] || [[ $branch == pr/* ]]; then
    echo "Develop or PR branch selected, changing username to Refactorio"
    username="Refactorio"
fi

if [ -z "$3" ]; then
    map="default"
    echo "No map provided, using 'default'."
else
    map=$2
fi

if [ -z "$4" ]; then
    debug=false
    echo "Debug setting not provided, using 'false'."
else
    debug=$4
fi

# Custom section for discord names =/= github usernames

#arguments to script: folder=$1 username=$2 branch=$3 map=$4 debug=$5
script_path='/home/factorio/backend_scripts/git_update_scripts/generic-updater.sh'

echo '------------------------------------------'
date
$script_path RedMew $username "$branch" "$map" "$debug"
