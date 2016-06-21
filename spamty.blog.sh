#!/bin/sh

# GitHub repository to clone
GIT_REPO=https://github.com/Spamty/blog.git
# Clone destination
GIT_CLONE_DEST=/var/git/blog.git

# Fetch (http://stackoverflow.com/questions/3382679/git-how-do-i-update-my-bare-repo#comment15318906_3382703)
cd $GIT_CLONE_DEST
git fetch $GIT_REPO gh-pages:gh-pages

# File permissions for new files
printf "Set new owner and group \n"
# owner & group is git
chown git:git $GIT_CLONE_DEST -R

# Das Shell-Programm wird beendet
printf "Done \n"
exit
