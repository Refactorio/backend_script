#!/usr/bin/env bash
#$1 = the branch

if [ -z "$1" ]
then
      echo "Missing argument"
      exit 1
fi

folder=plague
repository=plague
branch=$1

if [ -z "$2" ]
then
    map_check=$2
else
    map_check=default
fi

### These need to be set by something

folder=plague
repository=plague
branch=$1
map=map_check
cleanup=$5
debug=$6

### Below is generic

if [ -z "$folder" ] || [ -z "$repository" ] || [ -z "$branch" ] || [ -z "$map" ]
then
    echo "Missing argument"
    exit 1
fi

git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ fetch "$repository"
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ reset --hard "$repository/$branch"

if [ -z "$cleanup" ]
then
    echo "Deleting "
    rm /factorio/scenarios/"$folder"/map_gen/data/.map_previews -rf
fi

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
