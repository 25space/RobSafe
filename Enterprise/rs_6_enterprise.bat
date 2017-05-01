:A
@echo off
set maincolor=F0
cls
title mdct Group RobSafe 6 \\mdct Enterprise
color %maincolor%
cls

rem ++++++++++++++++++++++++++++++++++     KONFIGURATION     ++++++++++++++++++++++++++++++++++


set name=Server01Muenchen
rem Geben Sie bei Name den Namen der Sicherung ein. (Bsp. SicherungServer1)

set remark=Taeglich
rem Bemerkung (Wird in Report Datei angezeigt)

set datum=%date%
rem Derzeit wird das aktuelle Datum des Rechners benutzt. Wenn Sie ein anderes Datum verwenden wollen ersetzen Sie "%date%" mit dem jeweiligen Datum.

set quelle=C:\test
rem Geben Sie die Quelle und das Ziel ohne Lehrzeichen ein.

set ziel=C:\test2
rem Geben Sie die gewuenschten Parameter mit einem Lehrzeichen getrennt ein.

set parameter=/MIR
rem Geben Sie die gewuenschten Parameter mit einem Lehrzeichen getrennt ein.

set ipziel=192.168.200.10
rem Geben Sie die IP-Adresse des Ziel Servers/Laufwerkes an. Hier wird nur die Verbindung geprueft.

set ipquelle=localhost
rem Geben Sie die IP-Adresse des Quelle Servers/Laufwerkes an. Hier wird nur die Verbindun geprueft.

set reportfile=txt
rem Die Datei des Reports (ohne Punkt).

set timeout=10
rem Geben Sie die Zeit in Sekunden ein. Die RobSafe bis zur naechsten Sicherung warten soll.
rem 02 Stunden = 7200 Sekunden
rem 06 Stunden = 21600 Sekunden
rem 08 Stunden = 28800 Sekunden
rem 12 Stunden = 43200 Sekunden
rem 24 Stunden = 86400 Sekunden
rem 32 Stunden = 115200 Sekunden
rem 48 Stunden = 172800 Sekunden
rem 72 Stunden = 259200 Sekunden


rem ++++++++++++++++++++++++++++++++++     ENDE KONFIGURATION     ++++++++++++++++++++++++++++++++++
rem +
rem ++++++++++++++++++++++++++++++++++           WICHTIG          ++++++++++++++++++++++++++++++++++
rem Veraendern Sie den Bereich ab hier nicht mehr!
rem Not change the area from here!
rem ++++++++++++++++++++++++++++++++++           WICHTIG          ++++++++++++++++++++++++++++++++++
cls
echo.
echo Version: 6
echo Edition: ENTERPRISE 
echo Versionsnummer: 220416
echo.
echo Optimiert
echo Microsoft(R) Windows(R) 10 und Windows(R) Server 2016
echo.
echo ******************** MENUE ********************
echo.
echo (1) Starten (oder Enter)
echo.
echo (2) Aufgaben Verwaltung (Windows)
echo.
echo (3) Einstellungen anzeigen
echo.
echo (4) Neustart RobSafe (Einstellungen neu laden)
echo.
echo (5) Netzwerk Check
echo.
echo.
set robsafemenue=
set /p robsafemenue=Zahl + Enter:
echo.
if "%robsafemenue%"=="1" goto start
if "%robsafemenue%"=="2" goto task
if "%robsafemenue%"=="3" goto settings
if "%robsafemenue%"=="4" goto A
if "%robsafemenue%"=="error" goto error
cls

:enter
goto Start

:task
start C:\WINDOWS\system32\taskschd.msc
goto A

:settings
cls
echo Aktuelle Einstellungen
echo.
echo Name der Sicheurng:			%name%
echo Beschreibung:				%remark%
echo Datum fuer Sicherung:			%datum%
echo Parameter:				%parameter%
echo Timeout:				%timeout%
echo Reportfile				%Reportfile%
echo.
echo Netzkweradresse Quelle:			%ipquelle%%
echo Pfad der Quelle:			%quelle%
echo.
echo Netzkweradresse Ziel:			%ipziel%
echo Pfad der Quelle:			%ziel%
echo.
pause
goto A


:start
cls
echo Netzwerk Verbindungen werden geprueft.
ping %ipziel% -n 3 -w 1000 -l 2000 > C:\reports\RobsafeReport_%name%_%date%_NETWORK_DESTINATION
if %errorlevel%==1 goto noconnectionz
ping %ipquelle% -n 3 -w 1000 -l 2000 > C:\reports\RobsafeReport_%name%_%date%_NETWORK_SOURCE
if %errorlevel%==1 goto noconnectionq
color 1A
cls
echo.
echo Netzwerk Verbindungen vorhanden!
echo Destination %ipziel% - OK
echo Source %ipquelle% - OK
timeout /T 5
color %maincolor%
cls
title mdct Group RobSafe 5 Business Backup - RUNNING
robocopy %quelle% %ziel%\%date% %parameter% /LOG+:C:\reports\RobsafeReport_%name%_%date%_%remark%.%reportfile%
title mdct Group RobSafe 5 Business Backup - LAST RUNNING %Date% %Time%
echo
cls
echo.
echo Die Aufgabe wurde am %Date% um %Time% Uhr abgeschlossen.
echo.
echo mdct Group RobSafe 5 Business Backup
echo www.mdct-group.com










echo.
echo.
timeout /T %timeout%
goto start
echo.
echo Zum beenden
pause
exit

:error
color cf
title mdct Group RobSafe 5 Business Backup - ERROR
cls
echo.
echo Ein Systemfehler ist eingetreten.
echo CODE #rs0001
echo RobSafe startet neu.
echo.
echo Weitere Informationen: www.mdct-group.com/support
echo %date% - %Time%
echo.
pause
color %maincolor%
goto A
cls
goto error


:noconnectionq
color 1c
title mdct Group RobSafe 5 Business Backup - ERROR
cls
echo.
echo RobSafe kann keine Verbindung zur Quelle aufbauen.
echo CODE #rs0002
echo Aktuelle Quelle ist: %ipquelle%
echo RobSafe startet neu.
echo.
echo Weitere Informationen: www.mdct-group.com/support
echo %date% - %Time%
pause
color %maincolor%
goto A
cls
goto error


:noconnectionz
color 1c
title mdct Group RobSafe 5 Business Backup - ERROR
cls
echo.
echo RobSafe kann keine Verbindung zum Ziel aufbauen.
echo CODE #rs0003
echo Aktuelles Ziel ist: %ipziel%
echo RobSafe startet neu.
echo.
echo Weitere Informationen: www.mdct-group.com/support
echo %date% - %Time%
pause
color %maincolor%
goto A
cls
goto error




goto error


rem (c) mdct Group www.mdct-group.com
rem Made in Germany
