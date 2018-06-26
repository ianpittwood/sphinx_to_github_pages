#!/usr/bin/env bash

# Change to <your_project>/docs directory
cd ..

# Enable extended globbing so we can use patterns
shopt -s extglob

# Delete everything in <your_project>/docs except for the src folder
rm -rf !(src)

# Go back to <your_project>/docs/src
cd src

# Use Sphinx's Makefile to build the Sphinx website
make html

# Return to <your_project>/docs
cd ..

# Enable recognition of hidden files for mv
shopt -s dotglob

# Move all files built by Sphinx into the <your_project>/docs/html/ folder into <your_project>/docs
# We do this step because the GitHub Pages configuration we use only supports HTML files being directly in
# <your_project>/docs and not in any subdirectories
mv html/* ./
rmdir html