@echo off
title Defcon WS background service and launcher []
:startup
setlocal EnableDelayedExpansion
rem Script created by SetLucas with ITCMD
rem https://github.com/ITCMD/defcon-level
rem we love you lookie-loos. Enjoy my code!
set level=5
set versionL=1.8
set refresh=600
rem ================================================================
rem Uncomment the following line to skip checking for missing files.
rem goto :skipchecks
rem ================================================================
set missing=no
if not exist "1.ini" (
	start "" "Defcon GUI.bat" missingfile "1.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "2.ini" (
	start "" "Defcon GUI.bat" missingfile "2.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "3.ini" (
	start "" "Defcon GUI.bat" missingfile "3.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "4.ini" (
	start "" "Defcon GUI.bat" missingfile "4.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "5.ini" (
	start "" "Defcon GUI.bat" missingfile "5.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "winhttpjs.bat" (
	start "" "Defcon GUI.bat" missingfile "Winhttpjs.bat" "is used to query the defcon and github webservers."
	set missing=yes
)
if not exist "CMDS.bat" (
	start "" "Defcon GUI.bat" missingfile "CMDS.bat" "is used to see whether the defcon GUI is running or not."
	set missing=yes
)
if not exist "3.ini" (
	start "" "Defcon GUI.bat" missingfile "3.ini" "is used to display ascii numbers."
	set missing=yes
)
if not exist "volumeup.bat" (
	start "" "Defcon GUI.bat" missingfile "volumeup.bat" "is used to turn up the volume of your computer for vital alerts."
	set missing=yes
)
if not exist "alert.wav" (
	start "" "Defcon GUI.bat" missingfile "alert.wav" "is the sound file played for alerts."
	set missing=yes
)
:skipchecks
rem checks internet connection
ping google.com -n 1 >nul
if "%errorlevel%"=="1" goto nonet
rem Checks for updates
call winhttpjs.bat "https://github.com/ITCMD/defcon-level/raw/master/version.dat" -saveto "%cd%\onlinelatest.dat" >nul
if not "%errorlevel%"=="200" (
	rem makes sure download was successful
	echo query of update level failed.
	echo report error on: https://github.com/ITCMD/defcon-level
	echo could not connect to github >> crash.log
	pause
	exit /b
)
find "[%versionL%]" "onlinelatest.dat" >nul 2>nul
if not "%errorlevel%"=="0" start "" "Defcon GUI.bat" update
if "%errorlevel%"=="0" del /f /q onlinelaest.dat
rem Launches and starts the gui on defcon 5 if the skip file doesn't exist.
if not exist "DontDisplayOnStartup.config" start "" "Defcon GUI.bat" defcon 5 %refresh% launch
rem checks if the VBScript in shell:startup is pointed to this file.
if exist "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs" (
	find "%~0" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs"
	if not "!errorlevel!"=="0" (
		if exist "stopasking.dude" goto continue
		start "" "Defcon GUI.bat" patherror
	)
)
:continue
rem tests connection
ping google.com -n 1 >nul
if "%errorlevel%"=="1" goto nocon
rem downloads defcon status
call winhttpjs.bat "https://defconwarningsystem.com/code.dat" -saveto "%cd%\defconlevel.dat" >nul
if not "%errorlevel%"=="200" (
	rem makes sure download was successful
	echo query of defcon level failed.
	echo visit www.defconwarningsystem.com
	echo report error on: https://github.com/ITCMD/defcon-level
	echo could not connect to defconwarningsystem.com error: %errorlevel% >> crash.log
	pause
	exit /b
)
rem epstein didnt kill himself.
set /p defconlevel=<"%cd%\defconlevel.dat"
rem =================================================================
rem To test defcon levels, put the command "set defconlevel=#" here!
rem =================================================================
rem makes sure the defcon value makes sense, and changes refresh time depending on the level
if "%defconlevel%"=="5" set refresh=600 & goto defcontest
if "%defconlevel%"=="4" set refresh=300 & goto defcontest
if "%defconlevel%"=="3" set refresh=100 & goto defcontest
if "%defconlevel%"=="2" set refresh=60 & goto defcontest
if "%defconlevel%"=="1" set refresh=10 & goto defcontest
echo An error has occured:
echo.
type "defconlevel.dat"
echo.
echo Please report this at https://github.com/ITCMD/defcon-level
pause
exit

:defcontest
rem compares level with expected level
if not "%defconlevel%"=="%level%" (
	echo change detected: %defconlevel%
	call cmds.bat /TS "Defcon Warning System Indicator []"
	rem checks if a defcon gui window is already open
	if not "!errorlevel!"=="1" (
		echo killing old window
		taskkill /f /pid !errorlevel!
		rem kills any open windows
	)
	rem starts a new window with current level
	rem Putting this comment here fixes an error.
	start "" "Defcon GUI.bat" defcon %defconlevel% %refresh% seconds.
	set level=%defconlevel%
)
rem waits 10 minutes
timeout /t %refresh%
goto :continue

:nonet
ping google.com -n 1 >nul
if %errorlevel%==1 (
	timeout /t %refresh%
	goto nonet
)
goto skipchecks

:nocon
ping google.com -n 1 >nul
if %errorlevel%==1 (
	timeout /t %refresh%
	goto nocon
)
goto continue
