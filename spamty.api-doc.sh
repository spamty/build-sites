#!/bin/sh

# GitHub repository to clone
GIT_REPO=https://github.com/Spamty/api-doc.git
# Clone destination
GIT_CLONE_DEST=/var/git/api-doc.git

# Remove destination
printf "Deleting $GIT_CLONE_DEST \n"
rm -rf $GIT_CLONE_DEST

# Clone
printf "Cloning files with git in $GIT_CLONE_DEST \n"
git clone --bare $GIT_REPO $GIT_CLONE_DEST

# File permissions for new files
printf "Set new owner and group \n"
# owner & group is git
chown git:git $GIT_CLONE_DEST -R

# Das Shell-Programm wird beendet
printf "Done \n"
exit
