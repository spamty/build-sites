#!/bin/sh


# GitHub repository
GIT_REPO=$1

# path to webroot
PUBLIC_WWW=$2


# Webroot löschen
printf "Delete %s \n" "$PUBLIC_WWW"
rm -rf $PUBLIC_WWW

# Mit "git clone" wird Dein Repository in das Webroot geklont
printf "Cloning files with git in webroot \n"
git clone $GIT_REPO $PUBLIC_WWW

# Verzeichnis wechseln
cd $PUBLIC_WWW

# Nicht-benötigte Dateien löschen
# http://stackoverflow.com/questions/10149203/shell-command-script-to-delete-files-whose-names-are-in-a-text-file
# rm -rf $(<DELETE_LIST.txt)
printf "Delete files from DELETE_LIST.txt \n"
xargs -a DELETE_LIST.txt -d'\n' rm -rf

# File permissions for new files
printf "Set new file permissions \n"
# owner is git
# Group is web-dev
chgrp -R web-dev $PUBLIC_WWW
# Permissions rwx rwx r-x
chmod -R 775 $PUBLIC_WWW

# Das Shell-Programm wird beendet
printf "Done deploy-web.sh \n"
exit
