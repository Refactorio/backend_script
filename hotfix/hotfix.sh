#!/bin/bash





show_help() {
	echo "help"
}

while getopts "h?:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    esac
done



[ "${1:-}" = "--" ] && shift


##Dont laugh at me bash isnt my strong suit :D
if [ -z "$1" ]
then
	echo "Missing parameter <factorio instance id>"
	exit 1
else
	if [ -z "$2" ]
	then
		echo "Missing parameter <save file>"
		exit 1
	else
		if [ -z "$3" ]
		then
			echo "Missing second paramter: <hotfix folder>"
			exit 1
		fi
	fi
fi


####

rm -rf ./hotfix
cp -rf RedMew hotfix
rm save.zip
rm -rf save/
cp old_save.zip save.zip

####
	


if [ ! -f "$2" ]
then
	echo "file $2 not found"
	exit 1
fi

if [ ! -d "$3" ]
then
	echo "file $3 not found"
	exit 1
fi

save="$2"
rel_save_dir=`dirname $2`
save_dir="`realpath $rel_save_dir`/"${save%.*}"/"
hotfix_dir="$3"

PID=$(top -cbn1 | grep "factorio/$1" | grep -v 'dotnet' | grep -v 'grep' | grep -o '^\s*[0-9]*' | sed -e 's/ //g' )

if [ -z "$PID" ]
then
	echo "Server is not running."
	exit 0
fi

top -cbn1 | grep "factorio/$1" | grep -v 'dotnet' | grep -v 'grep'


read -p "Do you really want to kill this process? with pid $PID (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
	exit 0
fi

echo

if kill -KILL $PID; then
	echo "Killed process"
else 
	echo "Killing process failed. Aborting";
	exit 1
fi

if unzip $save > /dev/null; then
	echo "unzipped $save";
else
	echo "Unzipping failed"
	exit 1
fi

if rsync -av --include="*.lua" --exclude="*" $hotfix_dir $save_dir; then
	echo "Copy successfully"
else
	exit "Failed copying files"
	exit 1
fi


if rm $save; then
	echo "Removed $save"
else 
	echo "Removing $save failed"
	exit 1
fi

if zip -r $save $save_dir > /dev/null; then
	echo "Zipped $save";
else
	echo "Zipping failed"
	exit 1
fi

if rm -rf $save_dir; then
	echo "Removed $save_dir"
else
	echo "Removing save dir successfull"
	exit
fi

wrapper_name=$"cat /var/aspnetcore/FactorioWebInterface/appsettings.json | jq -r '.FactorioWrapperNameKey'"

start_cmd="/usr/bin/dotnet /factorio/$wrapper_name/FactorioWrapper.dll $1 /factorio/$1/bin/x64/factorio --start-server-load-latest --server-settings /factorio/$1/server-settings.json --port 3420$1"
echo $start_cmd








