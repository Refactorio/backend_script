#!/bin/bash
set -e #this forces an exit on any error
if [ "$1" != "develop" ]; then
    exit 0
fi

#arguments to script: folder=$1 repository=$2 branch=$3 map=$4 debug=$5
script_path='/home/factorio/backend_scripts/git_update_scripts/update-from-args.sh'
log_path='/home/factorio/backend_scripts/logs/github_webhook_output.txt'

{
    echo '------------------------------------------'
    date
    echo '-'
    "$script_path" develop origin develop default false
    echo '-'
    "$script_path" dev-debug origin develop default true
    echo '-'
    "$script_path" crashsite origin develop crash_site false
    echo '-'
    "$script_path" diggy origin develop diggy false
} >>"$log_path"
