#!/bin/sh

# GitHub repository
GIT_REPO=git@github.com:Spamty/Bumpy-Booby.git
# path to webroot
PUBLIC_WWW=/home/spamty/www/bumpybooby.oss.spamty.eu
# branch to deploy
DEPLOY_BRANCH="master"


# deploy website
./deploy-web.sh $GIT_REPO $PUBLIC_WWW $DEPLOY_BRANCH

# there is no database yet so we make $PUBLIC_WWW writable for apache
# owner is spamty, Group is www-data (apache)
# Permissions rwx rwx ---
printf "770 Permissions for $PUBLIC_WWW \n"
chmod 770 -R $PUBLIC_WWW

# generate password
bbpassword=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)
# generate username
bbusername=$(< /dev/urandom tr -dc _A-Z-a-z | head -c${1:-12};echo;)

# install
curl -d "user_username[]=$bbusername&user_password[]=$bbpassword&title=Bumpy%20Booby%20DEMO&url=http%3A%2F%2Fbumpybooby.oss.spamty.eu%2F&action=save&language=en" http://bumpybooby.oss.spamty.eu/

# normal permissions but not for database, www-data is owner so cannot change
# owner is spamty, Group is www-data (apache)
# Permissions rwx r-x --- (http://superuser.com/a/476309)
chmod 750 $PUBLIC_WWW
cd $PUBLIC_WWW
printf "750 Permissions for $PUBLIC_WWW \n"
chmod 750 -R  $(ls | awk '{if($1 != "database"){ print $1 }}')




# Das Shell-Programm wird beendet
printf "End \n"
exit
