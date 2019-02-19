#!/bin/bash
set -e #this forces an exit on any error
#log location - /home/factorio/backend_scripts/github_webhook_output.txt
#folder=$1 repository=$2 branch=$3 map=$4 cleanup=$5 debug=$6

/home/factorio/backend_scripts/update-from-args.sh develop origin develop default false false >> "/home/factorio/backend_scripts/github_webhook_output.txt"
/home/factorio/backend_scripts/update-from-args.sh crashsite origin develop crash_site false false >> "/home/factorio/backend_scripts/github_webhook_output.txt"
/home/factorio/backend_scripts/update-from-args.sh dev-debug origin develop default false true >> "/home/factorio/backend_scripts/github_webhook_output.txt"
