#!/bin/sh

git diff --exit-code --name-only ./price.db
if [ "$?" -eq "0" ]; then
 echo "No changes to push";
 exit;
fi
echo "Pushing changes"

setup_git() {
  git config --global user.email "github@daniel-kantor.com"
  git config --global user.name "Automation"
}

commit_files() {
  git add --all
  git commit --message "Add new exchanges rates"
}

upload_files() {
  git push origin master
}

setup_git
commit_files
upload_files
