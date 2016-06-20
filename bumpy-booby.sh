#!/bin/sh
# Source: http://oldarticles.kahlil.co/2011/07/24/uberkyll/
# https://gist.github.com/philipp-r/a07009762dea99929784

# Die folgende Variable speichert den Pfad zum Repository um das es geht.
#GIT_REPO=https://spamtybot:uDgmVl57UnWtLNl@git.spamty.eu/spamty/cdn.git
GIT_REPO=/var/git/Bumpy-Booby.git

# Die folgende Variable speichert den Pfad zum Webroot
PUBLIC_WWW=/var/www/bugtracker

# Die folgende Variable speichert den Pfad zum tmp Ordner für Backups
TMP_GIT_CLONE=/tmp/build_bumpy-booby
# make temporary directory (don't forget to delete it later)
mkdir $TMP_GIT_CLONE

# Backup /var/www/bugtracker/database
printf "Backup database, .htaccess, .htpasswd \n"
cp -R $PUBLIC_WWW/database $TMP_GIT_CLONE/database
# Backup /var/www/bugtracker/.htaccess and .htpasswd
cp $PUBLIC_WWW/.htaccess $TMP_GIT_CLONE/.htaccess
cp $PUBLIC_WWW/.htpasswd $TMP_GIT_CLONE/.htpasswd

# Webroot löschen
rm -rf $PUBLIC_WWW
printf "Delete %s \n" "$PUBLIC_WWW"

# Mit "git clone" wird Dein Repository in das Webroot geklont
git clone $GIT_REPO $PUBLIC_WWW
printf "Cloning files with git in webroot \n"

# Verzeichnis wechseln
cd $PUBLIC_WWW

# Nicht-benötigte Dateien löschen
# http://stackoverflow.com/questions/10149203/shell-command-script-to-delete-files-whose-names-are-in-a-text-file
# rm -rf $(<DELETE_LIST.txt)
xargs -a DELETE_LIST.txt -d'\n' rm -rf
printf "Delete files from DELETE_LIST.txt \n"



# Restore /var/www/bugtracker/database
printf "Restore database, .htaccess, .htpasswd \n"
cp -R $TMP_GIT_CLONE/database $PUBLIC_WWW/database
# Restore /var/www/bugtracker/.htaccess and .htpasswd
cp $TMP_GIT_CLONE/.htaccess $PUBLIC_WWW/.htaccess
cp $TMP_GIT_CLONE/.htpasswd $PUBLIC_WWW/.htpasswd


# File permissions for new files
printf "Set new file permissions \n"
# owner is git
# Group is web-dev
chgrp -R web-dev $PUBLIC_WWW
# Permissions rwx rwx r-x
chmod -R 775 $PUBLIC_WWW

# database has to be readable & writable for apache
chmod 777 -R $PUBLIC_WWW/database

# Das tmp-Verzeichnis wird gelöscht
rm -Rf $TMP_GIT_CLONE
printf "Deleting /tmp \n"


# Das Shell-Programm wird beendet
printf "Done \n"
exit
