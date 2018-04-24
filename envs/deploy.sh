#/usr/bin/env bash

if [ $# -eq 0 ]; then
	echo "Usage: deploy.sh uk01"
	exit 1
fi

script_dir=$(dirname "$0")

pushd $script_dir > /dev/null
for box in "$@"; do
	echo "Deploying aliases & completion etc to $box"

	scp .inputrc $box:~
	scp .bash_aliases $box:~
done
popd > /dev/null
