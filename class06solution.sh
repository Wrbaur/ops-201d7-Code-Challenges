#!/bin/bash

# Script Name:                  ops 201 class 6 solution 
# Author:                       Will Baur
# Date of latest revision:      10/31/2023
# Purpose:                     solution class 6

# Requirements
# Create a script that detects if a file or directory exists, then creates it if it does not exist. 
# your script must use at least one array, one loop, and one coniditonal. 

# Declare an array - Contains a list of files 
files=("file1.txt" "file2.txt" "file3.txt" "file4.txt")

# For loop - do some action for each file in the list 
for file in "${files[@]}"; do
    # Conditional - check if files exist 
    if [ -f "$file" ]; then

    # If files exist then print out a statement telling the user the file exists 
        echo "$file exists."
    # Else statement - catch all other situations
    else
        # Tell user the files doesn't exisit 
        echo "$file does not exisit."
        # Ask the user if they want to create it or create it. 
        touch $file
        echo "$file has been create"
    fi
# close out for loop
done