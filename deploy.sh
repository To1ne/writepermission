#!/bin/sh

# Cleanup site
cd _site
git rm -r -- .
cd -

# Generate site
jekyll

# Go to _site data
cd _site

# Commit the changes to git and push them to the web
git add .
git commit -am 'Automatic commit for putting site live'
git push web master

# Go back to where we started
cd -
