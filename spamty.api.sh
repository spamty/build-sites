#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-api.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/api.git

# path to webroot
PUBLIC_WWW=/home/spamty/www/api.spamty.eu

# branch to deploy
DEPLOY_BRANCH="master"


# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL


# Das Shell-Programm wird beendet
printf "End \n"
exit
