#!/usr/bin/env bash
#$1 = $folder = the folder folder
#$2 = the repository
#$3 = the branch
#$4 = the map to load
#$5 = debug + cheat

set -e

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]
then
    echo "Missing argument"
    exit 1
fi

### Below is generic

folder=$1
repository=$2
branch=$3
map=$4
debug=$5

git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ fetch "$repository"
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ reset --hard "$repository/$branch"

rm /factorio/scenarios/"$folder"/map_gen/data/.map_previews -rf
rm /factorio/scenarios/"$folder"/redmew_git_banner.png

if [ -z "$debug" ]
then
    echo "Setting up without debug"
    echo "return require 'map_gen.maps.$map'" >> /factorio/scenarios/"$folder"/map_selection.lua
else
    echo "Setting up with debug"
    echo '_DEBUG = true' > /factorio/scenarios/"$folder"/map_selection.lua
    echo '_CHEATS = true' >> /factorio/scenarios/"$folder"/map_selection.lua
    echo "return require 'map_gen.maps.$map'" >> /factorio/scenarios/"$folder"/map_selection.lua
fi

touch /factorio/scenarios/"$folder"
