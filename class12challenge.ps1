# Function to retrieve the IPv4 address from network_report.txt
function Get-IPv4Address {
    # Execute ipconfig /all and save the output to network_report.txt
    ipconfig /all | Out-File -FilePath "network_report.txt"

    # Use Select-String to search for the IPv4 address in network_report.txt
    $ipv4Address = Get-Content "network_report.txt" | Select-String IPv4 
    # Remove network_report.txt when finished searching
    Remove-Item -Path "network_report.txt" -Force

    return $ipv4Address
}

# Invoke the function to get the IPv4 address
$ipv4 = Get-IPv4Address

# Output the IPv4 address
Write-Host "IPv4 Address: $IPv4"