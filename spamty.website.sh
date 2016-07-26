#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-website.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/website.git

# path to webroot
PUBLIC_WWW=/var/www/spamty.eu

# branch to deploy
DEPLOY_BRANCH=master


# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# sync premium images with amazon S3
aws s3 sync $PUBLIC_WWW/premium s3://spamty-premium --delete --acl public-read

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL master:master


# Das Shell-Programm wird beendet
printf "End \n"
exit
