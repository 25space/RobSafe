@echo off
color F0
title mdct Group RobSafe 6 Online
echo off
cls
echo Version: 6 Online / 210216
echo ###########################################
echo.
echo Fuer mdct \\File Cloud optimiert.
echo Infos unter www.mdct.cloud/filecloud
echo.
echo Um den Task zu starten,
pause
cls
setlocal
set ftpscript=ftp.dat
rem GPL v3 LIZENZ - Götz & Oberhauser IT GbR
rem ********************KONFIGURATION********************
set FTPSERVER=ftp.server.de
set USERNAME=
set PASSWORD=
set FTPFOLDER=test2
REM #### Bsp.: /ordner/unterordner (wird erstellt, wenn nicht vorhanden) ####
set LOCALFOLDER=c:\test
REM #### Bsp.: c:\ordner\unterordner ####
rem ********************KONFIGURATION********************

echo open %FTPSERVER%>>%ftpscript% 
echo %USERNAME%>>%ftpscript%
echo %PASSWORD%>>%ftpscript%
echo prompt>>%ftpscript%
echo bin>>%ftpscript% 
echo mkdir %FTPFOLDER%>>%ftpscript% 
echo cd %FTPFOLDER%>>%ftpscript%
echo mput "%LOCALFOLDER%\*.*">>%ftpscript% 
echo quit>>%ftpscript%

ftp -s:%ftpscript%

del /q %ftpscript%

echo.
echo Die Aufgabe wurde am %Date% um %Time% Uhr abgeschlossen.
echo.
echo mdct Group RobSafe 6 Online
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
