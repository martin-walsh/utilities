#!/bin/bash
branchName=$1
if [ $# -eq 0 ]
	then
		branchName=`git branch | grep \* | cut -d ' ' -f 2`
fi
open https://jira.siteminder.com/browse/$branchName
