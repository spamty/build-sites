#!/bin/sh

# GitHub repository
GIT_REPO=git@bitbucket.org:spamty/api-docs.git
# Lokal git repo
GIT_REPO_LOKAL=/home/spamty/git/api-docs.git

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# Das Shell-Programm wird beendet
printf "End \n"
exit
