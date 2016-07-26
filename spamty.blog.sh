#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-blog.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/blog.git

# path to webroot
# PUBLIC_WWW=/var/www/blog.spamty.eu

# branch to deploy
# NOT required because hosted with GitHub Pages
# DEPLOY_BRANCH=master


# deploy website
# NOT required because hosted with GitHub Pages
# ./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL gh-pages:gh-pages


# Das Shell-Programm wird beendet
printf "End \n"
exit