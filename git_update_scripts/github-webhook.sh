#!/bin/bash
#parameters: $1=branch
set -e #this forces an exit on any error
if [ "$1" != "develop" ]; then
    exit 0
fi

#arguments to script: $1=folder $2=repository $3=branch $4=map $5=debug
script_path='/home/factorio/backend_scripts/git_update_scripts/generic-updater.sh'
log_path='/home/factorio/backend_scripts/logs/github_webhook_output.txt'

{
    echo '------------------------------------------'
    date
    echo '-'
    "$script_path" develop Refactorio develop default false
    echo '-'
    "$script_path" dev-debug Refactorio develop default true
    echo '-'
    "$script_path" crashsite Refactorio develop crash_site false
    echo '-'
    "$script_path" diggy Refactorio develop diggy false
} >>"$log_path"
