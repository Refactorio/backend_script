#!/usr/bin/env bash
set -e

### These need to be set to pass them to the generic updater

folder="develop"
repository="origin"
branch="develop"
map="default"
cleanup=false
debug=false

source /home/factorio/bin/generic-updater.sh

echo "$folder updated successfully."

exit 0
