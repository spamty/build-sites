#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-api-doc.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/api-doc.git

# path to webroot
# PUBLIC_WWW=/var/www/dev.spamty.eu


# deploy website
# NOT required because hosted with GitHub Pages
# ./deploy-web.sh $GIT_REPO $PUBLIC_WWW

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL


# Das Shell-Programm wird beendet
printf "End \n"
exit