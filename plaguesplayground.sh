#!/bin/bash
set -e #this forces an exit on any error

# arguments to script: repository=$1 branch=$2 map=$3 debug=$4

if [ -z "$1" ]; then
    echo "Missing argument: need to specify the repository."
    exit 1
fi
repository=$1

if [ -z "$2" ]; then
    branch="develop"
    echo "No branch provided, using 'develop'."
else
    branch=$2
fi

# If branch is develop or a PR, force them to take the Refactorio username.
if [ "$branch" == "develop" ] || [[ $branch == pr/* ]]; then
    echo "Develop or PR branch selected, changing repository to Refactorio"
    repository="Refactorio"
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

#arguments to script: folder=$1 repository=$2 branch=$3 map=$4 debug=$5
script_path='/home/factorio/backend_scripts/git_update_scripts/update-from-args.sh'
log_path='/home/factorio/backend_scripts/logs/plaguesplayground_output.txt'

echo '------------------------------------------'
date
"$script_path" RedMew $repository "$branch" "$map" "$debug"
