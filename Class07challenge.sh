#!/bin/bash

# Script Name:                  
# Author:                       Will Baur
# Date of latest revision:      10/31/2023
# Purpose:                    


if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please use 'sudo' or run as the root user."
  exit 1
fi

# Function to display information for a given component
display_info() {
  component=$1
  echo "=== $component Information ==="
  lshw -C "$component" | grep -A1 'description' | grep -E 'description|product|vendor|physical id|bus info|width|clock|capabilities|configuration|resources|logical name|version|serial|size|capacity' | cut -d ':' -f 2
}

# Display information for the computer
display_info system

# Display information for the CPU
display_info cpu

# Display information for RAM
display_info memory

# Display information for the Display adapter
display_info display

# Display information for Network adapters
display_info network