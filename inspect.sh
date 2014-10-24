#!/bin/bash
path=$1
cd $path
#todo check that it is a GIT repository
filename=$2
for sha in $(git log --pretty=format:%h); do 
	git checkout $sha; 
	echo $sha $(wc -l $filename) >> /tmp/file-history.txt; 
done

#git log --abbrev-commit --pretty=oneline --merges | cut -f 1 -d" " | xargs git checkout
