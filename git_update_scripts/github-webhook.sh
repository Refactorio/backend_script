#!/bin/bash
set -e #this forces an exit on any error
#folder=$1 repository=$2 branch=$3 map=$4 cleanup=$5 debug=$6

script_path='/home/factorio/backend_scripts/git_update_scripts/update-from-args.sh'
log_path='/home/factorio/backend_scripts/logs/github_webhook_output.txt'

{
    echo '------------------------------------------'
    date
    echo '-'
    "$script_path" develop origin develop default false false
    echo '-'
    "$script_path" dev-debug origin develop default false true
    echo '-'
    "$script_path" crashsite origin develop crash_site true false
    echo '-'
    "$script_path" diggy origin develop diggy true false
} >>"$log_path"
