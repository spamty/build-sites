#!/bin/sh
# Source: http://oldarticles.kahlil.co/2011/07/24/uberkyll/
# https://gist.github.com/philipp-r/a07009762dea99929784

# Die folgende Variable speichert den Pfad zum Repository um das es geht.
#GIT_REPO=https://spamtybot:uDgmVl57UnWtLNl@git.spamty.eu/spamty/blog.git
GIT_REPO=/var/git/blog.git

# Die folgende Variable speichert den Pfad zum tmp Ordner in dem dann der Jekyll
# Befehl ausgeführt wird um die deine Seite in den Webroot zu befördern.
TMP_GIT_CLONE=/tmp/build_spamtyblog

# Die folgende Variable speichert den Pfad zum Webroot
PUBLIC_WWW=/var/www/blog.spamty.eu

# Mit "git clone" wird Dein Repository in das tmp-Verzeichnis geklont
git clone $GIT_REPO $TMP_GIT_CLONE
printf "Cloning files with git in /tmp \n"

# Jekyll generiert die Seite aus dem tmp-Verzeichnis heraus
# in den Webroot hinein.
jekyll build --source $TMP_GIT_CLONE --destination $PUBLIC_WWW
printf "Jekyll build \n"

# Das tmp-Verzeichnis wird gelöscht
rm -Rf $TMP_GIT_CLONE
printf "Deleting /tmp \n"

# File permissions for new files
printf "Set new file permissions \n"
# owner is git
# Group is web-dev
chgrp -R web-dev $PUBLIC_WWW
# Permissions rwx rwx r-x
chmod -R 775 $PUBLIC_WWW

# Das Shell-Programm wird beendet
printf "Done \n"
exit
