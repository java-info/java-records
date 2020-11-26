#!/usr/bin/env bash

# local serve
# gitbook serve

gitbook build

cd "$HOME/git_repository/java_edit/_book"
rm -rf .idea
rm -rf package.json
rm -rf package-lock.json
rm -rf .DS_Store
rm -rf LICENSE
rm -rf zbuild.sh
rm -rf zpublish.sh
rm -rf zserver.sh
cd "$HOME/git_repository/java_edit"

cp -R "$HOME/git_repository/java_edit/_book/" "$HOME/git_repository/java/"

git add --all

git commit -am "$(date '+%Y-%m-%d %H:%M:%S') default commit message"

/usr/local/bin/git push

cd "$HOME/git_repository/java"

# git config user.name "stonej00" && git config user.email "stone000807@gmail.com"

rm -rf .idea
rm -rf package.json
rm -rf package-lock.json
rm -rf .DS_Store
rm -rf LICENSE
rm -rf zbuild.sh
rm -rf zpublish.sh
rm -rf zserver.sh

#rm gulpfile.js
#rm gulpfile.js
#rm gulpfile.js

git add --all

git commit -am "$(date '+%Y-%m-%d %H:%M:%S') default commit message"

/usr/local/bin/git push


#open "https://gitee.com/stonepark/java/pages"
#open "https://gitee.com/stonepark/java/pages"
#open "https://gitee.com/stonepark/java/pages"