@echo off
rem GPL v3 LIZENZ - Götz & Oberhauser IT GbR
rem www.mdct-group.com/robsafe
rem *****************************************************
rem ********************KONFIGURATION********************
rem *****************************************************

set name=Familien_Computer
rem Name der Sicherung (Bsp. Server01).

set ziel=F:\pcbackup
rem Ziel der Sicherung.

set user=Michael
rem Ziel der Sicherung.

rem *****************************************************
rem ********************KONFIGURATION********************
rem *****************************************************

color 1f
title mdct Group RobSafe Se7en Home


cls
echo mdct Group RobSafe Se7en Home (7) - Edition 090317
echo ######################################################################
echo.
echo CONFIGURED BACKUP TASK
echo.
echo ###############################################
echo ##   Sicherung:   ##   %name%
echo ###############################################
echo ##   Daten:       ##   Private Daten
echo ###############################################
echo ##   Ziel:        ##   %ziel%
echo ###############################################
echo ##   Benutzer:    ##   %user%
echo ###############################################
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
:start
cls
title mdct Group RobSafe Se7en Home - RUNNING
echo mdct Group RobSafe Se7en (7) - Edition 090317
echo ######################################################################
echo.
echo.
robocopy C:\Users\%user%\Pictures %ziel% /MIR >C:/pictures_%date%.txt
robocopy C:\Users\%user%\Desktop %ziel% /MIR >C:/desktop_%date%.txt
robocopy C:\Users\%user%\Documents %ziel% /MIR >C:/documents_%date%.txt
robocopy C:\Users\%user%\Downloads %ziel% /MIR >C:/downloads_%date%.txt
robocopy C:\Users\%user%\Music %ziel% /MIR >C:/music_%date%.txt
robocopy C:\Users\%user%\Videos %ziel% /MIR >C:/videos_%date%.txt
title mdct Group RobSafe Se7en Home
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
