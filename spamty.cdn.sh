#!/bin/sh
# Source: http://oldarticles.kahlil.co/2011/07/24/uberkyll/
# https://gist.github.com/philipp-r/a07009762dea99929784

# Die folgende Variable speichert den Pfad zum Repository um das es geht.
#GIT_REPO=https://spamtybot:uDgmVl57UnWtLNl@git.spamty.eu/spamty/cdn.git
#GIT_REPO=/home/philr/gogs-repositories/spamty/cdn.git
GIT_REPO=https://spamty-bot:AzzBqm49ms3NP9BB8@bitbucket.org/spamty/cdn.git

# Die folgende Variable speichert den Pfad zum Webroot
PUBLIC_WWW=/var/www/cdn.spamty.eu

# Webroot löschen
rm -rf $PUBLIC_WWW
printf "Delete %s \n" "$PUBLIC_WWW"

# Mit "git clone" wird Dein Repository in das Webroot geklont
git clone $GIT_REPO $PUBLIC_WWW

# Verzeichnis wechseln
cd $PUBLIC_WWW

# Nicht-benötigte Dateien löschen
# http://stackoverflow.com/questions/10149203/shell-command-script-to-delete-files-whose-names-are-in-a-text-file
# rm -rf $(<DELETE_LIST.txt)
xargs -a DELETE_LIST.txt -d'\n' rm -rf
printf "Delete files from DELETE_LIST.txt \n"

# Das Shell-Programm wird beendet
exit