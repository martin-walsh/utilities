#!/usr/bin/env bash

if [ $# -ne 1 ] || [[ "$1" == "2" ]]; then
	printf "Switching to Python 2.7...\n"

	ln -sf /usr/bin/python /usr/local/bin/python

elif [[ "$1" == "3" ]]; then
	printf "Switching to Python 3.6...\n"

	ln -sf /usr/local/bin/python3.6 /usr/local/bin/python

fi
