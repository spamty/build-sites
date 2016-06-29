#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:Spamty/Bumpy-Booby.git
# Lokal git repo
GIT_REPO_LOKAL=/var/git/Bumpy-Booby.git

# path to webroot
PUBLIC_WWW=/var/www/bugtracker

# tmp directory for backups
TMP_GIT_CLONE=/tmp/build_bumpy-booby

# make temporary directory (don't forget to delete it later)
mkdir $TMP_GIT_CLONE
# Backup /var/www/bugtracker/database
printf "Backup database \n"
cp -R $PUBLIC_WWW/database $TMP_GIT_CLONE/database
# Backup /var/www/bugtracker/.htaccess and .htpasswd
printf "Backup .htaccess, .htpasswd \n"
cp $PUBLIC_WWW/.htaccess $TMP_GIT_CLONE/.htaccess
cp $PUBLIC_WWW/.htpasswd $TMP_GIT_CLONE/.htpasswd


# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW

# Restore /var/www/bugtracker/database
printf "Restore database \n"
cp -R $TMP_GIT_CLONE/database $PUBLIC_WWW/database
# Restore /var/www/bugtracker/.htaccess and .htpasswd
printf "Restore .htaccess, .htpasswd \n"
cp $TMP_GIT_CLONE/.htaccess $PUBLIC_WWW/.htaccess
cp $TMP_GIT_CLONE/.htpasswd $PUBLIC_WWW/.htpasswd

# database has to be readable & writable for apache
printf "Permissions for database directory \n"
chmod 777 -R $PUBLIC_WWW/database

# Sync with AWS S3
aws s3 sync $PUBLIC_WWW/public s3://bumpybooby/public --delete --acl public-read


# Das tmp-Verzeichnis wird gelöscht
rm -Rf $TMP_GIT_CLONE
printf "Deleting /tmp \n"


# fetch in lokal git repo
./git-fetch.sh $GIT_REPO $GIT_REPO_LOKAL


# Das Shell-Programm wird beendet
printf "End \n"
exit
