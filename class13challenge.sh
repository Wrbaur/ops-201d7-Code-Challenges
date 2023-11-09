#!/bin/bash

# Script Name:                  ops 201 class 13  
# Author:                       Will Baur
# Date of latest revision:      11/08/2023
# Purpose:                     ask a user to type a domain then displays info 

# Requirements
# Create a script that asks a user to type a domain, then displays information about the typed domain

echo "Enter a domain name:"
read domain

# Perform whois lookup
whois_result=$(whois $domain)

# Perform dig query
dig_result=$(dig $domain)

# Perform host lookup
host_result=$(host $domain)

# Perform nslookup
nslookup_result=$(nslookup $domain)

# Display the results
echo "=== WHOIS ==="
echo "$whois_result"
echo "=== DIG ==="
echo "$dig_result"
echo "=== HOST ==="
echo "$host_result"
echo "=== NSLOOKUP ==="
echo "$nslookup_result"