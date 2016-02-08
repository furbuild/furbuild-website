#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build project to ./public
hugo -t casper

# Go to public folder
cd public

# Add CNAME to repository
echo "furbuild.com" > ./CNAME

# Add all changes to git submodule
git add -A

# Commit changes to submodule
message="Publishing site `date`"
if [ $# -eq 1 ]
  then message="$1"
fi
git commit -m "$message"

# Push source to master on origin
git push origin master

# Go back to main project
cd ..
