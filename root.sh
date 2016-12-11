#!/bin/bash

set -x

NEWUSER=$1

if [[ -z $NEWUSER ]]; then
  echo Usage...
  exit 1
fi

# remove default user
deluser --remove-home --remove-all-files user

adduser --disabled-password --gecos "" $NEWUSER
su -c 'mkdir ~/.ssh/; chmod 700 ~/.ssh/' $NEWUSER

# Password will be disabled in the next step
echo "$NEWUSER:qwer1234" | chpasswd

# Grant sudo access to the new user
adduser $NEWUSER sudo
echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo -k
