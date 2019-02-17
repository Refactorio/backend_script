#!/usr/bin/env bash

name=dev-testing

git --git-dir=/factorio/scenarios/$name/.git/ --work-tree=/factorio/scenarios/$name/ fetch origin
git --git-dir=/factorio/scenarios/$name/.git/ --work-tree=/factorio/scenarios/$name/ reset --hard origin/develop

rm /factorio/scenarios/$name/map_gen/data/.map_previews -rf
rm /factorio/scenarios/$name/redmew_git_banner.png

touch /factorio/scenarios/$name
echo '_DEBUG = true' > /factorio/scenarios/$name/map_selection.lua
echo '_CHEATS = true' >> /factorio/scenarios/$name/map_selection.lua
echo "return require 'map_gen.maps.default'" >> /factorio/scenarios/$name/map_selection.lua
echo "$name updated successfully"
