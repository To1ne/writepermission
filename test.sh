#!/bin/sh

# Use -s for silent
if [ "$1" == "-s" ]
then
   # Run the server with auto update
   jekyll --server --auto &>/dev/null &
else
   # Run the server with auto update
   jekyll --server --auto &
fi
