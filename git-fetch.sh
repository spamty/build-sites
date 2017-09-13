#!/bin/sh

# GitHub repository
GIT_REPO=$1
# Lokal git repo
GIT_REPO_LOKAL=$2

# Fetch (http://stackoverflow.com/questions/3382679/git-how-do-i-update-my-bare-repo#comment15318906_3382703)
printf "Fetch from git repo \n"
cd $GIT_REPO_LOKAL
git fetch $GIT_REPO

# File permissions for new files
printf "Set new group \n"
# owner and group is spamty
# Permissions rwx rwx ---
chmod -R 770 $GIT_REPO_LOKAL

# Das Shell-Programm wird beendet
printf "Done git-fetch.sh \n"
exit
