@echo off
rem GPL v3 LIZENZ - Götz & Oberhauser IT GbR
rem ********************KONFIGURATION********************

set name=Server01_Frankfurt
rem Name der Sicherung (Bsp. Server01)

set quelle=C:\data
rem Quelle der Sicherung

set ziel=F:\backup01
rem Ziel der Sicherung

set intro=ja
rem Bei "nein" wird sofort mit der Aufgabe gestartet.

rem ********************KONFIGURATION********************
color F0
title mdct Group RobSafe 6 Classic
if "%intro%"=="nein" goto start

cls
echo.
echo Version: 6 Classic / 210216
echo.
echo #########################################################################
echo.
echo Sicherung: %name%
echo Quelle: %quelle%
echo Ziel: %ziel%
echo.
echo Bestaetigen Sie anschliessend mit der "Enter"-Taste.
echo.
pause
:start
cls
title mdct Group RobSafe 6 Classic - RUNNING
robocopy %quelle% %ziel% /MIR >C:/%name%_%date%.txt
title mdct Group RobSafe 6 Classic

echo.
echo Die Aufgabe wurde am %Date% um %Time% Uhr abgeschlossen.
echo.
echo mdct Group RobSafe 6 Classic
echo.
echo www.mdct-group.com
echo info@mdct-group.com
echo.
echo Support
echo www.mdct-group.com/support
echo.
echo.
echo Zum Beenden
pause
exit
rem Made in Germany
