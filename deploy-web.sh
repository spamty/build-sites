#!/bin/sh

# GitHub repository
GIT_REPO=$1
# path to webroot
PUBLIC_WWW=$2
# branch
DEPLOY_BRANCH=$3


# Webroot löschen
printf "Delete %s \n" "$PUBLIC_WWW"
rm -rf $PUBLIC_WWW

# Clone deploy branch in webroot (http://stackoverflow.com/a/9920956/5905273)
printf "Cloning files with git in webroot \n"
git clone $GIT_REPO --branch $DEPLOY_BRANCH --single-branch $PUBLIC_WWW

# Verzeichnis wechseln
cd $PUBLIC_WWW

# Nicht-benötigte Dateien löschen
# http://stackoverflow.com/questions/10149203/shell-command-script-to-delete-files-whose-names-are-in-a-text-file
# rm -rf $(<DELETE_LIST.txt)
printf "Delete files from DELETE_LIST.txt \n"
xargs -a DELETE_LIST.txt -d'\n' rm -rf

# File permissions for new files
printf "Set new file permissions \n"
# owner is spamty
# Group is www-data (apache)
chgrp -R www-data $PUBLIC_WWW
# Permissions rwx r-x ---
chmod -R 750 $PUBLIC_WWW

# Das Shell-Programm wird beendet
printf "Done deploy-web.sh \n"
exit
