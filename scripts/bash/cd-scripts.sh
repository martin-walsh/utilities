#!/usr/bin/env bash

# Library for quick goto scripts.

function goto {
	eval slashCount=(`grep -c "/" <<< $2`)
	eval folderBase=(`echo $2 | cut -d '/' -f 1`)
	eval folderExtension=(`echo $2 | cut -s -d '/' -f 2-100`)

	if [ $slashCount -eq 1 ]; then
		folderBase="$folderBase/"
	fi

	eval cdDir=(`ls ~/$1/ | grep ^$folderBase`)
	if [ -z ${#cdDir[@]} -o ${#cdDir[@]} != 1 ]
		then
		printf "Found ${#cdDir[@]} results:\n"
		for i in ${cdDir[@]}
		do
			printf "$i\n"
		done
	else
	    cd ~/$1/${cdDir[0]}$folderExtension
	fi
}

#########################################################################
####                        PUBLIC FUNCTIONS                         ####
#########################################################################

function cdb {
	goto 'build' $1
}

function cdc {
	goto 'code' $1
}

function cdi {
	goto 'code' "integration-$1"
}

function cdo {
	goto 'code' "infrastructure-$1"
}

function cdp {
	goto 'code' "plugin-$1"
}
