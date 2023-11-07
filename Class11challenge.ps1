# Enable File and Printer Sharing
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Allow ICMP traffic (Ping)
Set-NetFirewallRule -Name "FPS-ICMP4-ERQ-In" -Enabled True
Set-NetFirewallRule -Name "FPS-ICMP6-ERQ-In" -Enabled True

# Enable Remote Management (WinRM)
Enable-PSRemoting -Force

# Remove bloatware - You can customize the list of apps to remove
$BloatwareApps = @(
    "Microsoft.549981C3F5F10",
    "Microsoft.549981C3F5F10_2.2004.2.0_x64__8wekyb3d8bbwe",
    # Add more app package names to remove here
)

foreach ($App in $BloatwareApps) {
    Get-AppxPackage -allusers | Where-Object { $_.PackageFamilyName -eq $App } | Remove-AppxPackage
}

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Disable SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false
Set-SmbClientConfiguration -EnableSMB1Protocol $false
