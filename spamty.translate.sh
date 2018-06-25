#!/bin/sh

# GitHub repository
GIT_REPO=git@bitbucket.org:spamty/translate.git
# Lokal git repo
GIT_REPO_LOKAL=/home/spamty/git/translate.git

# path to webroot
PUBLIC_WWW=/home/spamty/www/spamty.eu/translate

# branch to deploy
DEPLOY_BRANCH=master

# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# Das Shell-Programm wird beendet
printf "End \n"
exit
