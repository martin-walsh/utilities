#!/bin/bash

# SCRIPT TO CHEKOUT PRODUCTION VERSIONS FROM ALL GRAILS APPS IN REPO.

eval baseDir=$PWD
eval repoDir=(`ls`)

if [ -z ${#repoDir[@]} ]; then
	printf "Empty directory\n"
	exit 1
fi

for i in ${repoDir[@]}; do
	printf "Resetting $i to master: "
	cd $baseDir/$i
	git checkout master
done

if [ $# -eq 0 ]; then
	printf "You must supply a config directory...\n"
	exit 1
fi

if [ ! -d "$baseDir/$1" ]; then
	printf "$baseDir/$1 does not exist..."
	exit 1
fi

while read app; do
	printf "Line '$app'\n"
	appName=$(echo $app | cut -d ':' -f 1 | tr -d ' ')
	appVersion=$(echo $app | cut -d ':' -f 2 | tr -d ' ')

	cd $baseDir/$appName
	git checkout master
	git pull
	git checkout "v$appVersion"
done < "$baseDir/$1/conf/apps/grails.yaml"
