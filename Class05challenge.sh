#!/bin/bash

# Script Name:                  Loops
# Author:                       Will Baur
# Date of latest revision:      10/26/2023
# Purpose:                      Write a script that displays running processes, asks the user for a PID, then kills the process with that PID

#Display running processes
    while true; do 
        echo "Running processes"
        ps aux

        read -p "Enter the PID of the process to kill (or Cltr + C to quit): " pid
# Check for quit 
        if [[ "$pid" == "q" ]]; then 
            break
        fi   
    Kill the process with the given PID
    kill -9 "$pid"
done