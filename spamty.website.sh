#!/bin/sh

# GitHub repository
GIT_REPO=git@bitbucket.org:spamty/website.git
# Lokal git repo
GIT_REPO_LOKAL=/home/spamty/git/website.git

# GitHub wiki
GIT_REPO_WIKI=git@bitbucket.org:spamty/website.git/wiki
# Lokal git repo for wiki
GIT_REPO_WIKI_LOKAL=/home/spamty/git/website.wiki.git

# path to webroot
PUBLIC_WWW=/home/spamty/www/spamty.eu

# branch to deploy
DEPLOY_BRANCH=master

# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# deploy translations (they are deleted from webroot)
./spamty.translate.sh

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# fetch wiki
./git-fetch.sh $GIT_REPO_WIKI $GIT_REPO_WIKI_LOKAL

# Das Shell-Programm wird beendet
printf "End \n"
exit
