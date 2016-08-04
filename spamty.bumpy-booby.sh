#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:Spamty/Bumpy-Booby.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/Bumpy-Booby.git

# path to webroot
PUBLIC_WWW=/home/spamty/www/bugs.spamty.eu

# tmp directory for backups
TMP_GIT_CLONE=/tmp/build_bumpy-booby

# branch to deploy
DEPLOY_BRANCH="spamty"

# make temporary directory (don't forget to delete it later)
mkdir $TMP_GIT_CLONE
# Backup /var/www/bugtracker/database
printf "Backup database \n"
cp -R $PUBLIC_WWW/database $TMP_GIT_CLONE/database

# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# Restore /var/www/bugtracker/database
printf "Restore database \n"
cp -R $TMP_GIT_CLONE/database $PUBLIC_WWW/database

# database has to be readable & writable for apache
# owner is spamty, Group is www-data (apache)
# Permissions rwx rwx ---
printf "Permissions for database directory \n"
chgrp www-data -R $PUBLIC_WWW/database
chmod 770 -R $PUBLIC_WWW/database

# Das tmp-Verzeichnis wird gelöscht
rm -Rf $TMP_GIT_CLONE
printf "Deleting /tmp \n"

# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL

# Das Shell-Programm wird beendet
printf "End \n"
exit
