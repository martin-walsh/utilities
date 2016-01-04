#!/bin/bash
eval baseDir=$PWD
eval repoDir=(`ls`)

if [ -z ${#repoDir[@]} ]
	then
	printf "Empty directory\n"
else
	for i in ${repoDir[@]}
	do
		cd $baseDir/$i
		printf "\nUpdating: $i\n"
		git-prune-repo 
	done
	cd $baseDir
fi
