#!/bin/bash
eval projectUrl=`fgrep -m 1 url .git/config | cut -d ' ' -f 3`

if [[ "$projectUrl" == *"git@"* ]]; then
	#Handle SSH format:
	projectUrl=${projectUrl/://};
	projectUrl=${projectUrl//git@/'https://'};
fi

projectUrl=${projectUrl/.git/};

branchName=`git branch | grep \* | cut -d ' ' -f 2`

param="tree/$branchName"

if [[ "$1" == "compare" ]]; then
	param="compare/$branchName"
elif [[ "$1" == "commits" ]]; then
	param="commits/$branchName"
elif [[ "$1" == "branches" ]]; then
	param="branches/all"
elif [[ "$1" == "releases" ]]; then
	param="releases"
fi

open "$projectUrl/$param"
