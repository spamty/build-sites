#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:Spamty/api-docs.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/api-doc.git

# GitHub wiki
GIT_REPO_WIKI=git@github.com:Spamty/api-docs.wiki.git
# Lokal wiki
GIT_REPO_LOKAL_WIKI=/var/git/api-doc.wiki.git

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO_WIKI $GIT_REPO_LOKAL_WIKI

# Das Shell-Programm wird beendet
printf "End \n"
exit
