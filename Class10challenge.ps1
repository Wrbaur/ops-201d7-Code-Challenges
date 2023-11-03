# Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object CPU -Descending

# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object Id

# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5

# Start a browser process (such as Google Chrome or MS Edge) and have it open https://owasp.org/www-project-top-ten/.
# You can replace 'chrome' with 'msedge' if you prefer Microsoft Edge.
Start-Process -FilePath 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList 'https://owasp.org/www-project-top-ten/'

# Start the process Notepad ten times using a for loop.
for ($i = 1; $i -le 10; $i++) {
    Start-Process -FilePath 'notepad.exe'
}

# Close all instances of Notepad.
Get-Process | Where-Object { $_.Name -eq 'notepad' } | ForEach-Object { Stop-Process -Id $_.Id }

# Kill a process by its Process Identification Number. Choose a process that won't destabilize the system.
# Replace 12345 with the actual PID of the process you want to terminate.
Stop-Process -Id 12345