#!/bin/bash

dir=$(basename $PWD)
branchName=`git branch | grep \* | cut -d ' ' -f 2`
open "https://buildkite.com/siteminder/${dir}/builds?branch=${branchName}"
