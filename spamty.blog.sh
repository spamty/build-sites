#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-blog.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/blog.git


# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL gh-pages:gh-pages


# Das Shell-Programm wird beendet
printf "End \n"
exit