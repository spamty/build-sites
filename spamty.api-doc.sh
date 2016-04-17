#!/bin/sh
# Source: http://oldarticles.kahlil.co/2011/07/24/uberkyll/
# https://gist.github.com/philipp-r/a07009762dea99929784

# Die folgende Variable speichert den Pfad zum Repository um das es geht.
#GIT_REPO=https://spamtybot:uDgmVl57UnWtLNl@git.spamty.eu/spamty/blog.git
GIT_REPO=/home/philr/gogs-repositories/spamty/api-doc.git

# Die folgende Variable speichert den Pfad zum tmp Ordner in dem dann der Jekyll
# Befehl ausgeführt wird um die deine Seite in den Webroot zu befördern.
TMP_GIT_CLONE=/home/philr/tmp/build_spamtyapidoc

# Die folgende Variable speichert den Pfad zum Webroot
PUBLIC_WWW=/var/www/virtual/philr/dev.spamty.eu

# Mit "git clone" wird Dein Repository in das tmp-Verzeichnis geklont
git clone $GIT_REPO $TMP_GIT_CLONE

# Dein persönliches .bash_profile wird aktiviert damit der
# Jekyll-Befehl benutzt werden kann.
. /home/philr/.bash_profile

# Jekyll generiert die Seite aus dem tmp-Verzeichnis heraus
# in den Webroot hinein.
jekyll build --source $TMP_GIT_CLONE --destination $PUBLIC_WWW

# Das tmp-Verzeichnis wird gelöscht und das Shell-Programm beendet.
rm -Rf $TMP_GIT_CLONE

exit
