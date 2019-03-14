#!/usr/bin/env bash
set -e
repo_name="RedMew"

if [ -z "$folder" ]; then
    echo "Missing argument: folder."
    exit 1
fi
if [ -z "$repository" ]; then
    echo "Missing argument: repository."
    exit 1
fi
if [ -z "$branch" ]; then
    echo "Missing argument: branch."
    exit 1
fi
if [ -z "$map" ]; then
    echo "Missing argument: map."
    exit 1
fi

repository="https://github.com/$repository/$repo_name.git"

git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ fetch "$repository" "$branch" > /dev/null
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ reset --hard "FETCH_HEAD" > /dev/null
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ rev-parse --short HEAD
git --git-dir=/factorio/scenarios/"$folder"/.git/ --work-tree=/factorio/scenarios/"$folder"/ log -1 --pretty=%B

echo "Deleting the banner."
rm /factorio/scenarios/"$folder"/redmew_git_banner.png -f

file=/factorio/scenarios/"$folder"/map_gen/maps/"$map".lua

if grep -q "data.presets" "$file"; then
    echo "Deleting preset map data."
    rm /factorio/scenarios/"$folder"/map_gen/data/ -rf
fi

if [ "$debug" = true ]; then
    echo "Setting _DEBUG and _CHEATS on."
    echo "_DEBUG = true" >/factorio/scenarios/"$folder"/map_selection.lua
    echo "_CHEATS = true" >>/factorio/scenarios/"$folder"/map_selection.lua
    echo "return require 'map_gen.maps.$map'" >>/factorio/scenarios/"$folder"/map_selection.lua
else
    echo "Setting _DEBUG and _CHEATS off."
    echo "return require 'map_gen.maps.$map'" >/factorio/scenarios/"$folder"/map_selection.lua
fi

touch /factorio/scenarios/"$folder"
