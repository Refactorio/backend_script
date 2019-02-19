#!/bin/bash
set -e #this forces an exit on any error
#folder=$1 repository=$2 branch=$3 map=$4 cleanup=$5 debug=$6

script_path='/home/factorio/backend_scripts/git_update_scripts/update-from-args.sh'

{
"$script_path" develop origin develop default false false
"$script_path" crashsite origin develop crash_site false false
"$script_path" dev-debug origin develop default false true
} >> '/home/factorio/backend_scripts/logs/github_webhook_output.txt'
