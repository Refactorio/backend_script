#!/usr/bin/env bash

git --git-dir=/factorio/scenarios/develop/.git/ --work-tree=/factorio/scenarios/develop/ fetch origin
git --git-dir=/factorio/scenarios/develop/.git/ --work-tree=/factorio/scenarios/develop/ reset --hard origin/develop

cp /factorio/scenarios/develop/map_selection.lua.sample /factorio/scenarios/develop/map_selection.lua
touch /factorio/scenarios/develop
echo "Develop updated successfully"
