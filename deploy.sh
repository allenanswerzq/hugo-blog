#!/bin/bash

echo  "eploying updates to GitHub..."

# Build the project.
#hugo # if using a theme, replace by `hugo -t <yourtheme>`

hugo -t blackburn
# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="Rebuild site"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

echo "_________________________"
echo "Deploy successful....."
echo "_________________________"