#!/usr/bin/env bash

gns () {
	git status -s | awk '{print NR,$0}' | tr -s ' '
}

gn () {

	## Build regex for adding multiple at once
	str="["
	for i in "${@:2}"; do
		str="${str}${i}|"
	done
	str_len=${#str}
	str=${str: : $str_len -1}
	str="${str}]"

	gns | egrep "^$str .*" | cut -d ' ' -f 3 | xargs git $1
}
