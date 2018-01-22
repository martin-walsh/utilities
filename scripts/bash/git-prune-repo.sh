#!/usr/bin/env bash

git checkout master
git pull
git remote prune origin

# Grab local branch names:
lbs=($(git branch | grep -v 'master$'))
rbs=($(git branch -r | grep -v 'master$'))
safe_lb=''
found=0
for lb in ${lbs[@]}
do
	safe_lb=$lb
	safe_rb=''
	found=0
	for rb in "${rbs[@]}"
	do
		safe_rb=$rb
		if [[ "$safe_rb" == *"$safe_lb"* ]]
			then
			found=1
			break
		fi
	done
	if [ $found != 1 ]
		then
		git branch -d $safe_lb
	fi
done
