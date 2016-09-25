#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:philipp-r/spamty-website.git
# path to webroot
PUBLIC_WWW=/home/spamty/www/tor.spamty.eu

# branch to deploy
DEPLOY_BRANCH=tor

# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# Das Shell-Programm wird beendet
printf "End \n"
exit
