@echo off
REM this turns off the commands showing up on the screen as it runs

setlocal enabledelayedexpansion 
REM This part allows for varriables to to be used with ! instead of %
set /p sourcePath=Enter the source folder path:
REM this line promps the user to provide a source folder /p is the option with set to request input from user
set /p destinationPath=Enter the destination folder path:
REM same as above just destination folder 
if not exist "!sourcePath!\" (
    echo Error: Source folder does not exist.
    goto :eof
)
REM if the sourece path doesnt exist echo out the Error message and is END OF SCRIPT 
if not exist "!destinationPath!\" (
    echo Error: Destination folder does not exist.
    goto :eof
)
REM same as the above loop except dealing with the desitnation folder not exisiting 
robocopy "!sourcePath!" "!destinationPath!" /E
REM assuming both the soruce path and destination paths exist it will perform a robo copy with 
::
if errorlevel 8 (
    echo Error: ROBOCOPY encountered errors during the copy operation.
) else (
    echo Copy operation completed successfully.
)
REM this is saying if there is an error of level 8 or higher it will give out the error command if not print out its succesful 
:end
endlocal
REM End ends the scrips and EndLocla ends the Setlocal function above