#!/usr/bin/env bash

function sb_version {
	if [ $# -ne 2 ]; then
		printf "Usage: sb_version <app_name> [app_version]...\n"
		exit 1
	fi

	app_name=$1
	app_version=$2

	find . -type f -name $1.yaml -exec sed -i "s/version.*/version: ${app_version}/" {} +
}

function g_version {
	if [ $# -ne 2 ]; then
		printf "Usage: g_version <app_name> [app_version]...\n"
		exit 1
	fi

	app_name=$1
	app_version=$2

	find . -type f -name grails.yaml -exec sed -i "s/${app_name}:.*/${app_name}: ${app_version}/" {} +
	echo "$1: $2"
}

_complete_g_version () {
	opts=`grep : conf/apps/grails.yaml | cut -d : -f 1`
	_complete $opts
}
complete -o nospace -F _complete_g_version g_version

_complete_sb_version () {
	opts=`find conf/hosts -type f -name *.yaml -exec basename {} + | grep -v engine- | cut -d . -f 1`
	_complete $opts
}
complete -o nospace -F _complete_sb_version sb_version
