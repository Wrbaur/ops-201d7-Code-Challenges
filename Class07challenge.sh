#!/bin/bash

# Script Name:                  
# Author:                       Will Baur
# Date of latest revision:      10/31/2023
# Purpose:                    


if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please use 'sudo' or run as the root user."
  exit 1
fi

# Display information about the computer
echo "=== Computer Information ==="
lshw -short -C system #| grep -E "product:|vendor:|physical id:|bus info:|width:"
# the -short is for output comands and the -C is for class
# Display information about the CPU
echo "=== CPU Information ==="
lshw -short -C cpu #| grep -E "product:|vendor:|physical id:|bus info:|width:"

# Display information about RAM
echo "=== RAM Information ==="
lshw -short -C memory #| grep -E "description:|physical id:|size:"

# Display information about the Display adapter
echo "=== Display Adapter Information ==="
lshw -short -C display #| grep -E "description:|product:|vendor:|physical id:|bus info:|width:|clock:|capabilities:|configuration:|resources:"

# Display information about Network adapters
echo "=== Network Adapter Information ==="
lshw -short -C network #| grep -E "description:|product:|vendor:|physical id:|bus info:|logical name:|version:|serial:|size:|capacity:|width:|clock:|capabilities:|configuration:|resources:"