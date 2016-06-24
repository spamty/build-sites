#!/bin/sh

# GitHub repository
GIT_REPO=$1
# Lokal git repo
GIT_REPO_LOKAL=$2


# Fetch (http://stackoverflow.com/questions/3382679/git-how-do-i-update-my-bare-repo#comment15318906_3382703)
printf "Fetch from git repo \n"
cd $GIT_REPO_LOKAL
git fetch $GIT_REPO master:master

# File permissions for new files
printf "Set new owner and group \n"
# owner & group is git
chown git:git $GIT_REPO_LOKAL -R

# Das Shell-Programm wird beendet
printf "Done git-fetch.sh \n"
exit
