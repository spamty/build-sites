#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:Spamty/blog.wiki.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/blog.git

# GitHub wiki
GIT_REPO_WIKI=git@github.com:Spamty/blog.wiki.git
# Lokal git repo for wiki
GIT_REPO_WIKI_LOKAL=/var/git/blog.wiki.git


# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# fetch wiki
./git-fetch.sh $GIT_REPO_WIKI $GIT_REPO_WIKI_LOKAL


# Das Shell-Programm wird beendet
printf "End \n"
exit