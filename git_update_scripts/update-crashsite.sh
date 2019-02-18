#!/usr/bin/env bash
set -e

### These need to be set to pass them to the generic updater

folder="crashsite"
repository="origin"
branch="develop"
map="crash_site"
cleanup=true
debug=true

source /home/factorio/bin/generic-updater.sh

echo "$folder updated successfully."

exit 0
