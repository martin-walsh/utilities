#!/bin/bash

if [[ -z "$1" ]]; then
	SIZE="1024000"
else
	SIZE="$(( $1 * 2048 ))"
fi

diskutil erasevolume HFS+ 'RAM Disk' `hdiutil attach -nomount ram://$SIZE`
