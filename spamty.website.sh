#!/bin/sh

# GitHub repository
GIT_REPO=git@bitbucket.org:spamty/website.git
# Lokal git repo
GIT_REPO_LOKAL=/home/spamty/git/website.git


# path to webroot
PUBLIC_WWW=/home/spamty/www/spamty.eu

# branch to deploy
DEPLOY_BRANCH=master

# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# deploy translations (they are deleted from webroot)
./spamty.translate.sh



# Das Shell-Programm wird beendet
printf "End \n"
exit
