#!/bin/bash

if [[ -z "$1" ]]; then
	SIZE="1024000"
else
	SIZE="$(( $1 * 2048 ))"
fi
DISK_ID=$(hdiutil attach -nomount ram://$SIZE)

diskutil erasevolume HFS+ 'ram_disk' $DISK_ID

printf "RAM Disk mounted at /Volumes/ram_disk\n"