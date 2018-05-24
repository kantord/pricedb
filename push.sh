#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add --all
  git commit --message "Add new exchanges rates (travis#$TRAVIS_BUILD_NUMBER)"
}

upload_files() {
  git diff-index --quiet HEAD
  if [ "$?" -eq "0" ]; then
     echo "No changes to push";
     exit;
  fi
  git remote add origin_2 https://github.com/kantord/pricedb.git > /dev/null 2>&1
  git push origin_2 master
}

setup_git
commit_files
upload_files
