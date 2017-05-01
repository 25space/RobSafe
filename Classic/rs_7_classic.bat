@echo off
rem GPL v3 LIZENZ - Götz & Oberhauser IT GbR
rem www.mdct-group.com/robsafe
rem *****************************************************
rem ********************KONFIGURATION********************
rem *****************************************************

set name=Server01_Frankfurt
rem Name der Sicherung (Bsp. Server01).

set quelle=F:\test1
rem Quelle der Sicherung.

set ziel=F:\test2
rem Ziel der Sicherung.

set intro=ja
rem Bei "nein" wird sofort mit der Aufgabe gestartet.

rem *****************************************************
rem ********************KONFIGURATION********************
rem *****************************************************

color 1f
title mdct Group RobSafe Se7en Classic
if "%intro%"=="nein" goto start

cls
echo mdct Group RobSafe Se7en Classic (7) - Edition 090317
echo ######################################################################
echo.
echo CONFIGURED BACKUP TASK
echo.
echo ###############################################
echo ##   Sicherung:   ##   %name%
echo ###############################################
echo ##   Quelle:      ##   %quelle%
echo ###############################################
echo ##   Ziel:        ##   %ziel%
echo ###############################################
echo.
echo.
echo OTHER CONFIGURATIONS
echo.
echo ###############################################
echo ##   Intro:       ##   %intro%
echo ###############################################
echo ##   Sonstiges:   ##   -
echo ###############################################
echo.
echo.
echo ######################################################################
pause
:start
cls
title mdct Group RobSafe Se7en Classic - RUNNING
echo mdct Group RobSafe Se7en Classic (7) - Edition 090317
echo ######################################################################
echo.
echo.
robocopy %quelle% %ziel% /MIR >C:/%name%_%date%.txt
title mdct Group RobSafe Se7en Classic
echo.
echo.
echo ###############################################
echo ##   Task:        ##   %name%
echo ###############################################
echo ##   Status:      ##   Beendet
echo ###############################################
echo ##   Datum:       ##   %Date%
echo ###############################################
echo ##   Zeit:        ##   %Time%
echo ###############################################
echo.
echo.
echo.
echo.
echo.
echo.
echo www.mdct-group.com
echo ######################################################################

pause
exit
rem Made in Germany
