#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-cdn.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/cdn.git

# path to webroot
PUBLIC_WWW=/var/www/cdn.spamty.eu


# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW

# Sync with AWS S3
aws s3 sync $PUBLIC_WWW s3://spamty-cdn --delete --acl public-read

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL


# Das Shell-Programm wird beendet
printf "End \n"
exit
