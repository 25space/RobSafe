@echo off
color 1f
title mdct Group RobSafe 7 Online
echo off
cls
echo mdct Group RobSafe Se7en Online (7) - Edition 180317
echo ######################################################################
echo.
echo CONFIGURED BACKUP TASK
echo.
echo ###############################################
echo ##   Server:   ##   %FTPSERVER%
echo ###############################################
echo ##   User:     ##   %FTPUSERNAME%
echo ###############################################
echo ##   Folder:   ##   %FTPFOLDER%
echo ###############################################
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ######################################################################
pause
cls
setlocal
set ftpscript=ftp.dat
rem ********************KONFIGURATION********************
set FTPSERVER=ftp.yourserver.de
set FTPUSERNAME=yourusername
set PASSWORD=yourpassword
set FTPFOLDER=
REM #### Bsp.: /ordner/unterordner (wird erstellt, wenn nicht vorhanden) ####
set LOCALFOLDER=c:\test
REM #### Bsp.: c:\ordner\unterordner ####
rem ********************KONFIGURATION********************

echo open %FTPSERVER%>>%ftpscript% 
echo %FTPUSERNAME%>>%ftpscript%
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
echo mdct Group RobSafe 7 Online
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
