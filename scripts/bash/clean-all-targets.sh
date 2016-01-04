#!/bin/bash

eval baseDir=$PWD
eval repoDir=(`ls`)

if [ -z ${#repoDir[@]} ]; then
	printf "Empty directory\n"
	exit 1
fi

for i in ${repoDir[@]}; do
	printf "Cleaning $i/target...\n"
	cd $baseDir/$i/target
	rm -rf *
done