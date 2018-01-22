#!/usr/bin/env bash

# SCRIPT TO PULL OUT DEPENDENCY VERSIONS FROM ALL GRAILS APPS IN REPO.
source $HOME/dotfiles/public/git/git-completion.bash

eval baseDir=$PWD
eval repoDir=(`ls`)

if [ $# -eq 0 ]; then
	printf "You must supply a dependency to search for...\n"
	exit 1
fi
if [ -z ${#repoDir[@]} ]
	then
	printf "Empty directory\n"
else
	printf "Searching apps for '$1' version\n"
	for i in ${repoDir[@]}
	do
		cd $baseDir/$i
		branch=$(__git_ps1 "%s")
		modelVersion="NOT A GRAILS APP"
		if [ -d "grails-app" ]; then
		 	modelVersion=$(grep $1 grails-app/conf/BuildConfig.groovy | cut -d ':' -f 3 | cut -d "'" -f 1 | cut -d '"' -f 1)
		 	printf "$branch - $i: $modelVersion\n"
		fi
	done
	cd $baseDir
fi
