#!/usr/bin/env bash

git --git-dir=/factorio/scenarios/crashsite/.git/ --work-tree=/factorio/scenarios/crashsite/ fetch origin
git --git-dir=/factorio/scenarios/crashsite/.git/ --work-tree=/factorio/scenarios/crashsite/ reset --hard origin/develop

echo "return require 'map_gen.maps.crash_site'" > /factorio/scenarios/crashsite/map_selection.lua
rm /factorio/scenarios/crashsite/map_gen/data -rf
rm /factorio/scenarios/crashsite/redmew_git_banner.png
touch /factorio/scenarios/crashsite
echo "Crashsite updated successfully"
