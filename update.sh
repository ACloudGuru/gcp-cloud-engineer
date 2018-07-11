#!/bin/bash

# Be strict about exiting this script if we hit an error.
set -euo pipefail

# Start in the root repo directory.
cd `dirname "${BASH_SOURCE[0]}"`
echo
echo ==============================================================================
echo Updating `pwd` ...
echo ==============================================================================
#echo

#echo ------------------------------------------------------------------------------
#echo Making sure git is configured...
#echo ------------------------------------------------------------------------------

git_email=`git config --get user.email` || true
git_name=`git config --get user.name` || true
#echo git email: $git_email
#echo git name: $git_name

if [ -z "$git_email" ]
then
  echo Git user.email unset.  Setting to \"not@yet.com\"
  git config user.email "not@yet.com"
fi
if [ -z "$git_name" ]
then
  echo Git user.name unset.  Setting to \"Someone\"
  git config user.name "Someone"
fi
echo

echo ------------------------------------------------------------------------------
echo Local changes:
echo ------------------------------------------------------------------------------
git status
echo

echo ------------------------------------------------------------------------------
echo Stashing any changes...
echo ------------------------------------------------------------------------------
git stash
echo

echo ------------------------------------------------------------------------------
echo Pulling latest changes...
echo ------------------------------------------------------------------------------
git pull
echo

echo ------------------------------------------------------------------------------
echo Finished.
echo ------------------------------------------------------------------------------
echo To get back any stashed changes, run:
echo "  git stash apply"
echo from inside the repo directory.
echo
