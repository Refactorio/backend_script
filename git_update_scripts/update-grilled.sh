#!/usr/bin/env bash
#$1 = the branch

folder=grilled

if [ -z "$1" ]
then
      echo "Missing argument"
      exit 1
fi

git --git-dir=/factorio/scenarios/$folder/.git/ --work-tree=/factorio/scenarios/$folder/ fetch $folder
git --git-dir=/factorio/scenarios/$folder/.git/ --work-tree=/factorio/scenarios/$folder/ reset --hard $folder/"$1"

rm /factorio/scenarios/$folder/map_gen/data/.map_previews -rf
rm /factorio/scenarios/$folder/redmew_git_banner.png

touch /factorio/scenarios/$folder
echo '_DEBUG = true' > /factorio/scenarios/$folder/map_selection.lua
echo '_CHEATS = true' >> /factorio/scenarios/$folder/map_selection.lua
echo "return require 'map_gen.maps.default'" >> /factorio/scenarios/$folder/map_selection.lua
