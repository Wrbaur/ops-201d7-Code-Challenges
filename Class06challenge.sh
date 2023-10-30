#!/bin/bash

# Script Name:                  Class 06 Challenge
# Author:                       Will Baur
# Date of latest revision:      10/03/2023
# Purpose:                      # Create a script that detects if a file or directory exists, then creates it if it does not exist.
                                # Your script must use at least one array, one loop, and one conditional


names=("file.txt" "directory" "dir")

# Ask the user for the name of the file or directory
read -p "Enter the name of the file or directory: " name

# Ask the user for the type (file or directory)
read -p "Is it a file or a directory? (file/directory): " type

# Check if the file or directory exists
if [ -e "$name" ]; then
    echo "$name exists."
else
    read -p "$name does not exist. Do you want to create it? (y/n): " response
    if [ "$response" == "y" ]; then
        read -p "Is it a file or a directory? (file/directory): " type
        if [ "$type" == "file" ]; then
            touch "$name"
            echo "File $name created."
        elif [ "$type" == "directory" ]; then
            mkdir "$name"
            echo "Directory $name created."
        else
            echo "Invalid type. Please enter 'file' or 'directory'."
        fi
    else
        echo "Operation aborted. $name was not created."
    fi
fi