#!/bin/bash
path=$1
cd $path
#todo check that it is a GIT repository
filename=$2
for sha in $(git log --pretty=format:%h); do 
	git checkout $sha; 
	echo $sha $(wc -c $filename) >> /tmp/file-history.txt; 
done
echo "Back to master branch for repository at $path"
git checkout master
#git log --abbrev-commit --pretty=oneline --merges | cut -f 1 -d" " | xargs git checkout
