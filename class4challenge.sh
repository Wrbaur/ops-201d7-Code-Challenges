#!/bin/bash

# Script Name:                  Playing with arrays
# Author:                       Will Baur
# Date of latest revision:      10/25/2023
# Purpose:                      create 4 directories and 4 sub files

# Create four directories
mkdir dir1 dir2 dir3 dir4

# Put the directory names in an array
directories=("dir1" "dir2" "dir3" "dir4")

# create a .txt file in each directory
for dir in "${directories[@]}"; do
    touch "$dir/$dir.txt"
done

# List the contents of the directories to verify
ls dir*