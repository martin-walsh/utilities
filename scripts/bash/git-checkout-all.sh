#!/bin/bash

# SCRIPT TO CHEKOUT MASTER FOR ALL REPOS IN DIR.

eval baseDir=$PWD
eval repoDir=(`ls`)

branch="master"
if [ $# -eq 0 ]; then
	printf "Resetting all to master\n"
else
	branch=$1
fi

if [ -z ${#repoDir[@]} ]; then
	printf "Empty directory\n"
	exit 1
fi

for i in ${repoDir[@]}; do
	printf "Resetting $i to $branch: "
	cd $baseDir/$i
	git checkout $branch
done
