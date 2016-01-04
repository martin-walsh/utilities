#!/bin/bash

printf "Version: "

if [ -z ${#repoDir[@]} ]; then
	printf "Empty directory\n"
	exit 1
fi
if [[ -z `find . -type f -name 'Plugin*GrailsPlugin.groovy' -maxdepth 1` ]]; then
	grep 'app.version' application.properties | cut -d '=' -f 2
else
	grep 'def version' Plugin*GrailsPlugin.groovy | cut -d '=' -f 2 | cut -d '"' -f 2
fi


