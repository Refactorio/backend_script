#!/usr/bin/env bash
set -e

if [ -z "$folder" ]; then
    echo "Missing argument: folder, this is plague's fault."
    exit 1
fi
if [ -z "$repository" ]; then
    echo "Missing argument: repository, this is plague's fault."
    exit 1
fi
if [ -z "$branch" ]; then
    echo "Missing argument: branch, this is plague's fault."
    exit 1
fi
if [ -z "$map" ]; then
    echo "Missing argument: map, this is plague's fault."
    exit 1
fi

git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ fetch "$repository" >/dev/null
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ reset --hard "$repository/$branch" >/dev/null
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ rev-parse --short HEAD

if [ "$cleanup" = true ]; then
    echo "Deleting all map data."
    rm /factorio/scenarios/"$folder"/map_gen/data/ -rf
else
    echo "Not deleting map data."
fi

echo "Deleting map previews and the banner."
rm /factorio/scenarios/"$folder"/map_gen/data/.map_previews -rf
rm /factorio/scenarios/"$folder"/redmew_git_banner.png

if [ "$debug" = true ]; then
    echo "Setting _DEBUG and _CHEATS on."
    echo '_DEBUG = true' >/factorio/scenarios/"$folder"/map_selection.lua
    echo '_CHEATS = true' >>/factorio/scenarios/"$folder"/map_selection.lua
    echo "return require 'map_gen.maps.$map'" >>/factorio/scenarios/"$folder"/map_selection.lua
else
    echo "Setting _DEBUG and _CHEATS off."
    echo "return require 'map_gen.maps.$map'" >/factorio/scenarios/"$folder"/map_selection.lua
fi

touch /factorio/scenarios/"$folder"
