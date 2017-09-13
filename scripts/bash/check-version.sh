#!/bin/bash

printf "Version: "

if [ -z ${#repoDir[@]} ]; then
	printf "Empty directory\n"
	exit 1
fi
if [[ -z `find . -type f -name '*GrailsPlugin.groovy' -maxdepth 1` ]]; then
	if [[ -z `find . -type f -name 'build.gradle' -maxdepth 1` ]]; then
		grep 'app.version' application.properties | cut -d '=' -f 2
	else
		egrep -m 1 '^\s*version' build.gradle | egrep -o '[0-9.A-Z]+'
	fi
else
	grep 'def version' *GrailsPlugin.groovy | cut -d '=' -f 2 | cut -d '"' -f 2
fi


