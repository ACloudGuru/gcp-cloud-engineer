#!/bin/bash

# Be strict about exiting this script if we hit an error.
set -euo pipefail

# Start in the root repo directory.
cd `dirname "${BASH_SOURCE[0]}"`
echo
echo ==============================================================================
echo Updating `pwd` ...
echo ==============================================================================
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
