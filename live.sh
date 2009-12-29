#!/bin/sh

jekyll

cd _site

git add .
git commit -am 'Automatic commit for putting site live'
git push web master

