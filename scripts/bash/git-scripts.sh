#!/bin/bash

gns () {
	git status -s | awk '{print NR,$0}' | tr -s ' '
}

gn () {
	gns | egrep "^$2 .*" | cut -d ' ' -f 3 | xargs git $1
}
