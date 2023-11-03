# Task 1: Output all events from the System event log in the last 24 hours to last_24.txt
Get-WinEvent -LogName 'System' -MaxEvents 100000 | Where-Object { $_.TimeCreated -ge (Get-Date).AddDays(-1) } | Out-File "$env:USERPROFILE\Desktop\last_24.txt"

# Task 2: Output all "error" type events from the System event log to errors.txt
Get-WinEvent -LogName 'System' -MaxEvents 100000 | Where-Object { $_.LevelDisplayName -eq 'Error' } | Out-File "$env:USERPROFILE\Desktop\errors.txt"

# Task 3: Print to the screen all events with ID 16 from the System event log
Get-WinEvent -LogName 'System' | Where-Object { $_.Id -eq 16 } | Format-Table -AutoSize

# Task 4: Print to the screen the most recent 20 entries from the System event log
Get-WinEvent -LogName 'System' -MaxEvents 20 | Format-Table -AutoSize

# Task 5: Print to the screen all sources of the 500 most recent entries in the System event log
Get-WinEvent -LogName 'System' -MaxEvents 500 | ForEach-Object { $_.ProviderName } | Select-Object -Unique
