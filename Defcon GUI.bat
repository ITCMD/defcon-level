@echo off
cls
mode con lines=25 cols=107
Setlocal EnableDelayedExpansion
title Defcon Warning System Indicator []
rem Script created by SetLucas with ITCMD!
rem https://github.com/ITCMD/defcon-level
rem =======================================================================
rem Add custom commands below to run commands when a defcon level occurs:
set defcon5action=rem
set defcon4action=rem
set defcon3action=rem
set defcon2action=rem
set defcon1action=rem
rem =======================================================================
rem handles parameters

if "%~1"=="defcon" goto :defcon%~2
if "%~1"=="patherror" goto :patherror
if "%~1"=="missingfile" goto missing
if "%~1"=="nonet" goto nonet
if "%~1"=="update" goto update

goto :LocalCheck


:update
cls
echo [4mDefcon Warning System by ITCMD[0m
echo.
echo This program is outdated. Please download the latest version from https://github.com/ITCMD/defcon-level.
echo Automatic updates are dissabled for this program for security reasons.
echo,
echo [4mUpdate features:[0m
echo.
type onlinelatest.dat
echo.
pause
start https://github.com/ITCMD/defcon-level
exit



:nonet
echo [101,30mERROR:[0m[91m No network connection found.[0m
echo script will continue to search for a connection.
goto end

:defcon5

color a0
echo Defcon level:
type 5.ini
echo.
echo Condition is Green. All clear signal active.
goto :end


:defcon4
cls
start /MIN "" "volumeup.bat"
call :Alert
color 1f
echo Defcon level:
type 4.ini
echo.
echo Condition is Blue. Non-Standard peactime. There is no imminent nuclear threat.
echo Conditions will likely return to normal.
goto :end

:defcon3
color e0
start /MIN "" "volumeup.bat"
echo Defcon level:
type 3.ini
echo.
echo Condition is Yellow. Events of concern are occuring in the world theatre. 
echo There are no known immediate nuclear threats, however the situation is considered fluid.
echo Please visit www.defconwarningsystem.com for more information.
echo If you live in or near a city, and do not have a blast shelter make evacuation plans.
echo If you do not have a fallout shelter, consider constructing one and begin collecting water.
echo.
echo Please visit www.defconwarningsystem.com for more information.
echo For shelter instructions visit https://www.defconwarningsystem.com/documents/
echo and select "What to do if Nuclear Disaster is Imminent".
call :Alert
goto :end


:defcon2
color 60
start /MIN "" "volumeup.bat"
start /MIN "" "volumeup.bat"
echo Defcon level:
type 2.ini
echo.
echo Condition is Orange. Hostilities have or are about to break out.
echo THERE IS STRONG POSSIBILITY OF A NUCLEAR STRIKE.
echo If you live in a city that may be a target and do not have a blast shelter,
echo consider executing evacuation measures immediately.
echo If you do not have a fallout shelter [4mBUILD ONE NOW![0m
echo.
echo Please visit www.defconwarningsystem.com for more information.
echo For shelter instructions visit https://www.defconwarningsystem.com/documents/
echo and select "What to do if Nuclear Disaster is Imminent".
call :DefconTwoAlert
goto end

:defcon1
color 40
start /MIN "" "volumeup.bat"
start /MIN "" "volumeup.bat"
start /MIN "" "volumeup.bat"
start /MIN "" "volumeup.bat"
start /MIN "" "volumeup.bat"
cls
echo DECON LEVEL IS:
type 1.ini
echo.
echo.
echo Condition is Red. A nuclear attack is in progress or is considered to be highly likely.
echo If you do not have a fallout shelter, begin constructing one immediately.
echo If you have shelter enter it now. Turn on an FM radio to recieve information.
echo.
echo [4mNUCLEAR WAR IS ONGOING OR IS EXPECTED TO BREAK OUT[0m
echo NUCLEAR WAR IS DEEMED IMMINENT BY DFWS!
echo GET TO NUCLEAR SHELTER IMMEDIATELY!
if not "!defcon%~2action!"=="" !defcon%~2action!
:defcon1loop
call :DefconOneALERT
timeout /t 38 /nobreak>nul
color f4
call :DefconOneALERT
timeout /t 38 /nobreak>nul
color 40
goto defcon1loop

:missing
cls
echo A required file: "%~2" was not found.
echo The file %~3
echo.
echo Please Download it from the main github page, located at [4mhttps://github.com/ITCMD/defcon-level[0m
echo.
echo Once you have the required files, restart your computer or run the vbs in shell:startup to start the script again.
pause
exit

:patherror
echo [4mDefcon Warning System by ITCMD[0m
echo.
echo It seems the automatic startup VBS file located in shell:startup is linked to a
echo different program than this one. Would you like to fix this?
echo.
echo Y] Yes
echo N] No
echo S] Stop asking me
echo.
choice /c yns
if "%errorlevel%"=="1" (
	rem creates a vbs file that launches to reader program hidden using the second and third parameters as location and file respectively.
	echo Set objShell = CreateObject("WScript.Shell"^) >"C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs"
	echo objShell.CurrentDirectory = "%cd%" >>"C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs"
	echo Set oShell = CreateObject("WScript.Shell"^) >>"C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs"
	echo oShell.Run """%cd%\Defcon Reader.bat""", 0 >>"C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DefconWarningSystemLauncher.vbs"
)
if "%errorlevel%"=="3" (
	rem creates a file that will tell the reader to stop checking
	echo Bruh just leave it alone>stopasking.dude
)
exit
:LocalCheck
cls
echo Running the Defcon checker . . .
call cmds.bat /ts "Defcon WS background service and launcher []"
if "%errorlevel%"==1 (
	echo The DWS service is [4mnot[0m running in the background!
	echo consider launching it so it may update you of changes!
) ELSE (
	echo [90mThe Defcon Warning System background service is running. It should update you of any issues.[0m
)
echo ============================================================================================
echo | set /p="Checking Defcon Level . "
call winhttpjs.bat "https://defconwarningsystem.com/code.dat" -saveto "%cd%\defconlevel.dat" >nul
if not "%errorlevel%"=="200" (
	rem makes sure download was successful
	echo query of defcon level failed.
	echo visit www.defconwarningsystem.com
	echo report error on: https://github.com/ITCMD/defcon-level
	pause
	exit /b
)
timeout /t 1 >nul
echo | set /p=". "
rem epstein didnt kill himself.
set /p defconlevel=<"%cd%\defconlevel.dat"
if "%defconlevel%"=="5" goto defcontest
if "%defconlevel%"=="4" goto defcontest
if "%defconlevel%"=="3" goto defcontest
if "%defconlevel%"=="2" goto defcontest
if "%defconlevel%"=="1" goto defcontest
echo.
echo An error has occured:
echo.
type "defconlevel.dat"
echo.
echo Please report this at https://github.com/ITCMD/defcon-level
pause
exit /b
:defcontest
timeout /t 1 >nul
echo | set /p=". "
echo.
echo ============================================================================================
echo Defcon Level:
if "%defconlevel%"=="5" (
	color 0a
	type 5.ini
	echo Condition is green. all clear.
)
if "%defconlevel%"=="4" (
	color 1f
	type 4.ini
	echo Condition is blue. Non-Peactime.
	echo visit www.defconwarningsystem.com for more information.
)
if "%defconlevellevel%"=="3" (
	color e0
	type %defconlevel%.ini
	echo Condition is Yellow. Events of concern are occuring in the world theatre.
	echo visit www.defconwarningsystem.com for more information.
)
if "%defconlevel%"=="2" (
	color 60
	type %defconlevel%.ini
	echo Condition is Orange. There is a strong possibility of nuclear attack.
	echo Prepare for a nuclear strike. Consider evacuation if you are close to
	echo a major city or military base.
	echo visit www.defconwarningsystem.com for more information.
)
if "%defconlevel%"=="1" (
	type %defconlevel%.ini
	color c0
	echo Condition is Red! Nuclear war has or is likely to occur!
	echo visit www.defconwarningsystem.com for more information.
)
echo ============================================================================================

echo Press any key to launch website . . .
pause >nul

start www.defconwarningsystem.com/
echo Press any key to close . . .
pause >nul
exit /b


:Alert
rem creates an alert sound using alert.wav and wscript
set "file=Alert.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /MIN sound.vbs
exit /b

:DefconOneAlert
rem creates an alert sound and speech using alert.wav and wscript
set "file=Alert.wav"
  echo Set Sound = CreateObject("WMPlayer.OCX.7") >speech.vbs
  echo Sound.URL = "Alert.wav" >>speech.vbs
  echo Sound.Controls.play >>speech.vbs
  echo do while Sound.currentmedia.duration = 0 >>speech.vbs
  echo wscript.sleep 40 >>speech.vbs
  echo loop >>speech.vbs
  echo wscript.sleep (int(Sound.currentmedia.duration)+1)*1000 >>speech.vbs
  echo Set Sound = CreateObject("WMPlayer.OCX.7") >>speech.vbs
  echo Sound.URL = "Alert.wav" >>speech.vbs
  echo Sound.Controls.play >>speech.vbs
  echo do while Sound.currentmedia.duration = 0 >>speech.vbs
  echo wscript.sleep 90 >>speech.vbs
  echo loop >>speech.vbs
  echo wscript.sleep (int(Sound.currentmedia.duration)+1)*1000 >>speech.vbs
  echo dim speechobject  >>speech.vbs
  echo set speechobject=createobject("sapi.spvoice")   >>speech.vbs 
  echo speechobject.speak "This is the defcon warning system. Defcon one. Red. Defcon One. Red. Nuclear War is imminent or has begun. Seek or construct immediate blast and fallout shelter. Defcon One. Red. Defcon One. Red. Visit w w w dot defcon warning system dot com for more information." >>speech.vbs
start /MIN speech.vbs
exit /b

:DefconTwoAlert
rem creates an alert sound and speech using alert.wav and wscript
set "file=Alert.wav"
  echo Set Sound = CreateObject("WMPlayer.OCX.7") >speech.vbs
  echo Sound.URL = "Alert.wav" >>speech.vbs
  echo Sound.Controls.play >>speech.vbs
  echo do while Sound.currentmedia.duration = 0 >>speech.vbs
  echo wscript.sleep 90 >>speech.vbs
  echo loop >>speech.vbs
  echo wscript.sleep (int(Sound.currentmedia.duration)+1)*1000 >>speech.vbs
  echo dim speechobject  >>speech.vbs
  echo set speechobject=createobject("sapi.spvoice")   >>speech.vbs
  echo speechobject.speak "This is the defcon warning system. Defcon Two. Orange. Defcon Two. Orange. Hostilities have or are about to break out. There is a possiblility of nuclear thread. If you live in a populated area and do not have a blast shelter, consider evacuating immediately. Defcon 2. Orange. Visit w w w dot defcon warning system dot com for more information. Defcon 2. Orange." >>speech.vbs
start /MIN speech.vbs
exit /b























:end
SetLocal EnableDelayedExpansion
if not "!defcon%~2action!"=="" !defcon%~2action!
echo.
echo [90mYou may close this window. The system will continue to refresh in the backgroud. Current refresh time: %~3[0m
:endloop
rem pauses without indication without end. Basically locks input and stops without closing.
pause >nul
goto :endloop
