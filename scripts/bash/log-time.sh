#!/bin/bash

if [ $(date +%u) -ne 5 ]; then
	printf "Log time on a FRIDAY!!!\n"
	exit 1
fi

read -s -p "Password: " password
if [ -z ${password} ]; then
	printf "You must supply a password.\n"
	exit 1
fi


MONDAY=$(date -v -Mon "+%a,%_d %b %Y")
TUESDAY=$(date -v -Tues "+%a,%_d %b %Y")
WEDNESDAY=$(date -v -Wed "+%a,%_d %b %Y")
THURSDAY=$(date -v -Thurs "+%a,%_d %b %Y")
FRIDAY=$(date -v -Fri "+%a,%_d %b %Y")

WEEKDAYS=( "$MONDAY" "$TUESDAY" "$WEDNESDAY" "$THURSDAY" "$FRIDAY" )

IFS="" # <-- Need to stop space as delimeter
for day in ${WEEKDAYS[@]}; do
	XML="<?xml version=\"1.0\" encoding=\"UTF-8\"?><request><notes>Daily R&amp;D</notes><hours>8</hours><project_id type=\"integer\">4045959</project_id><task_id type=\"integer\">1943140</task_id><spent_at type=\"date\">$day</spent_at></request>"

	printf "\nLogging time for $day\n"
	curl -H 'Content-Type: application/xml' -H 'Accept: application/xml' -u "martin.walsh@siteminder.com:$password"  -d "$XML" https://siteminder.harvestapp.com/daily/add
done
