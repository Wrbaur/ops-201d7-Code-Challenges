#!/bin/bash

# Script Name:                  variables 101
# Author:                       Will Baur
# Date of latest revision:      10/25/2023
# Purpose:                      To print something to the screen

# Declaration of variables


# Declaration of functions
print_login_history(){
   sudo grep 'login keyring' /var/log/auth.log
   echo "This is the login history"

}
   
# Call the function 
print_login_history

print_login_history

print_login_history

# Main



# End