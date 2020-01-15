@echo off
title Defcon Warning System Desktop Tester by ITCMD
Rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Rem  EDIT THESE PARAMETERS TO RUN CUSTOM COMMANDS ON DEFCON LEVELS
set def5action=rem
set def4action=rem
set def3action=rem
set def2action=rem
set def1action=rem
Rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem https://github.com/ITCMD/Defcon-Level
Rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set localdefcon=5
if not exist "winhttpjs.bat" (
	echo This script requires a tool called winhttpjs.bat which it uses to download the defcon level from the defconwarningsystem website.
	echo get it at https://github.com/ITCMD/defcon-level/winhttpjs.bat
)
if not exist "1.ini" (
	echo This script requires a file numbers.ini which has the ascii drawings of numbers the program uses to display the defcon level.
	echo get it at https://github.com/ITCMD/defcon-level/1.ini
)
if not exist "2.ini" (
	echo This script requires a file numbers.ini which has the ascii drawings of numbers the program uses to display the defcon level.
	echo get it at https://github.com/ITCMD/defcon-level/2.ini
)
if not exist "3.ini" (
	echo This script requires a file numbers.ini which has the ascii drawings of numbers the program uses to display the defcon level.
	echo get it at https://github.com/ITCMD/defcon-level/3.ini
)
if not exist "4.ini" (
	echo This script requires a file numbers.ini which has the ascii drawings of numbers the program uses to display the defcon level.
	echo get it at https://github.com/ITCMD/defcon-level/4.ini
)
if not exist "5.ini" (
	echo This script requires a file numbers.ini which has the ascii drawings of numbers the program uses to display the defcon level.
	echo get it at https://github.com/ITCMD/defcon-level/5.ini
)
:main
title Defcon Warning System Desktop Tester by ITCMD
call winhttpjs.bat "https://defconwarningsystem.com/code.dat" -saveto "%cd%\defconlevel.dat" >nul
if not "%errorlevel%"=="200" (
	echo query of defcon level failed.
	echo visit www.defconwarningsystem.com
	echo report error on: https://github.com/ITCMD/defcon-level
	pause
	exit /b
)
set /p defconlevel=<"%cd%\defconlevel.dat"
if "%defconlevel%"=="5" (
	cls
	if not "%localdefcon%"=="5" (
		set localdefcon=5
		%def5action%
		start /MIN "" "volumeup.bat"
		call :Alert
	)
	color a0
	echo Defcon level:
	type 5.ini
	echo Condition is Green. All clear signal active.
)
if "%defconlevel%"=="4" (
	cls
	if not "%localdefcon%"=="4" (
		set localdefcon=4
		%def4action%
		start /MIN "" "volumeup.bat"
	)
	color 1f
	echo Defcon level:
	type 4.ini
	echo.
	echo Condition is Blue. Non-Standard peactime. There is no imminent nuclear threat.
	echo Conditions will likely return to normal.
	
)
if "%defconlevel%"=="3" (
	cls
	if not "%localdefcon%"=="3" (
		set localdefcon=3
		%def3action%
		start /MIN "" "volumeup.bat"
	)
	color e0
	echo Defcon level:
	type 3.ini
	echo.
	echo Condition is Yellow. Events of concern are occuring in the world theatre. 
	echo There are no known immediate nuclear threats, however the situation is considered fluid.
	echo Please visit www.defconwarningsystem.com for more information.
	echo If you live in a city, make evacuation plans.
)
if "%defconlevel%"=="2" (
	cls
	if not "%localdefcon%"=="2" (
		set localdefcon=2
		%def3action%
		start /MIN "" "volumeup.bat"
		call :DefconTwoAlert
	)
	color 60
	echo Defcon level:
	type 2.ini
	echo.
	echo Condition is Orange. Hostilities have or are about to break out.
	echo THERE IS POSSIBILITY OF A NUCLEAR STRIKE.
	echo If you live in a city that may be a target and do not have a blast shelter,
	echo consider taking evacuation measures.
	echo Please visit www.defconwarningsystem.com for more information.
)
if "%defconlevel%"=="1" (
	cls
	goto defcon1
)
:loop
title Defcon Warning System Desktop Tester by ITCMD
timeout /t 600>nul
title Defcon Warning System Desktop Tester by ITCMD *
call winhttpjs.bat "https://defconwarningsystem.com/code.dat" -saveto "%cd%\defconlevel.dat" >nul
set /p newlevel=<"%cd%\defconlevel.dat"
if "%newlevel%"=="%defconlevel%" goto loop
if not "%newlevel%"=="2" call :Alert
timeout /t 2 >nul
goto main

:Alert
@echo off
set "file=Alert.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
exit /b



:DefconOneAlert
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

start /min speech.vbs
exit /b

:DefconTwoAlert
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
  echo speechobject.speak "This is the defcon warning system. Defcon Two. Orange. Defcon Two. Orange. Hostilities have or are about to break out. There is a possiblility of nuclear thread. If you live in a populated area and do not have a blast shelter, consider evacuating now. Defcon 2. Orange. Visit w w w dot defcon warning system dot com for more information." >>speech.vbs

start /min speech.vbs
exit /b


:defcon1
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
echo 
echo NUCLEAR WAR IS ONGOING OR IS EXPECTED TO BREAK OUT
echo NUCLEAR WAR IS DEEMED IMMINENT BY DFWS!
echo Get to nuclear shelter immediately!
rem start www.defconwarningsystem.com
:defcon1loop
color 40
call :DefconOneALERT
timeout /t 37>nul
color f4
call :DefconOneALERT
timeout /t 37>nul
goto defcon1loop