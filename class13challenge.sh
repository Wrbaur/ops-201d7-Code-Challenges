#!/bin/bash

# Script Name:                  ops 201 class 13  
# Author:                       Will Baur
# Date of latest revision:      11/08/2023
# Purpose:                     ask a user to type a domain then displays info 

# Requirements
# Create a script that asks a user to type a domain, then displays information about the typed domain


# Function to gather domain information
gather_domain_info() {
    domain="$1"
    
    # Perform whois lookup
    whois_result=$(whois "$domain")

    # Perform dig query
    dig_result=$(dig "$domain")

    # Perform host lookup
    host_result=$(host "$domain")

    # Perform nslookup
    nslookup_result=$(nslookup "$domain")

    # Create a timestamp for the filename
    timestamp=$(date +"%Y%m%d%H%M%S")

    # Output the results to a .txt file
    output_file="domain_info_$timestamp.txt"
    echo "=== WHOIS ===" > "$output_file"
    echo "$whois_result" >> "$output_file"
    echo "=== DIG ===" >> "$output_file"
    echo "$dig_result" >> "$output_file"
    echo "=== HOST ===" >> "$output_file"
    echo "$host_result" >> "$output_file"
    echo "=== NSLOOKUP ===" >> "$output_file"
    echo "$nslookup_result" >> "$output_file"

    # Open the .txt file with the default text editor
    xdg-open "$output_file"
}

# Prompt the user to input a domain name
echo "Enter a domain name:"
read user_input_domain

# Call the function to gather and save domain information
gather_domain_info "$user_input_domain"
