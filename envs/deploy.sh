#/usr/bin/env bash

if [ $# -eq 0 ]; then
	echo "Usage: deploy.sh uk01"
	exit 1
fi

echo "Deploying aliases & completion etc to $1"

script_dir=$(dirname "$0")

pushd $script_dir > /dev/null
scp .inputrc $1:~
scp .bash_aliases $1:~
popd > /dev/null
