#Purpose: Automate the configureing of a new system by running this set of commands 


### Main 


# This line enables file and printer sharing 
set-firewallprofile -profile domain,public,private -enable $false
Set-NetFirewallRule -Displaygroup "File and printer Sharing" -Eanble True

# This line enables ICMP (pring traffic)
netsh advfirewall firewall add rule name="Allow incoming pin requests IPv4" dir=in action=allow protocol=icmpv4

# This line enables remote management 
    # Options 1
        reg add "HKLM/System/CurrentControlSet/Control/Terminal Server" /v fDenyTSConnections /t REG_DWORD /D 0 F
    # Option 2
            Set-Service -Name "WinRM" -StartupType "Automatic" 
            Start-Service "WinRM" 
            Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP" -Enabled True

# This line removes bloatware 
iex ((New-Objectsystem.net.webclient).downloadstring('https://git.io/deblot'))


# This line enables HyperV
Get-WindowsOptionalFeature -online -FeatureName Microsoft-Hyper-V
Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -All

# This line disables SMBv1, and insecure protocol
# The below will allow you to check its status
# Get-SmbServerConfiguration
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force    