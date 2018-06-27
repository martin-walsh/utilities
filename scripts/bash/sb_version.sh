#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	printf "Usage: sb_version <app_name> [app_version]...\n"
	exit 1
fi

app_name=$1
app_version=$2

find . -type f -name $1.yaml -exec sed -i "s/version.*/version: ${app_version}/" {} +
