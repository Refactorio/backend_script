#!/usr/bin/env bash

git --git-dir=/factorio/scenarios/PR/.git/ --work-tree=/factorio/scenarios/PR/ fetch origin
git --git-dir=/factorio/scenarios/PR/.git/ --work-tree=/factorio/scenarios/PR/ reset --hard origin/pr/"$1"

echo '_DEBUG = true' > /factorio/scenarios/PR/map_selection.lua
echo '_CHEATS = true' >> /factorio/scenarios/PR/map_selection.lua
echo "return require 'map_gen.maps.default'" >> /factorio/scenarios/PR/map_selection.lua