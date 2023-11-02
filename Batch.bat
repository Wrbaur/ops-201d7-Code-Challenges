@echo off
REM this turns off the commands showing up on the screen as it runs

setlocal enabledelayedexpansion 
REM This part allows for varriables to to be used with ! instead of %
set /p sourcePath=Enter the source folder path:
REM this line promps the user to provide a source folder /p 
set /p destinationPath=Enter the destination folder path:

if not exist "!sourcePath!\" (
    echo Error: Source folder does not exist.
    goto :eof
)

if not exist "!destinationPath!\" (
    echo Error: Destination folder does not exist.
    goto :eof
)

robocopy "!sourcePath!" "!destinationPath!" /E

if errorlevel 8 (
    echo Error: ROBOCOPY encountered errors during the copy operation.
) else (
    echo Copy operation completed successfully.
)

:end
endlocal