@echo off

rem ********************KONFIGURATION********************
set name=USB Stick Anna
rem Name der Sicherung (Bsp. USB-Stick Anna)

set ziel=C:\sicherung\usbstickanna
rem Geben Sie den Ziel Ordner an (Bsp. C:\sicherungen\usbstickanna)

rem ********************KONFIGURATION********************
rem *********BITTE AB HIER NICHT MEHR BEARBEITEN*********

color F0
title mdct Group RobSafe 6 Stick - %name%
cls
echo.
echo Version: 6 Stick / 040216
echo.
echo #########################################################################
echo.
echo Bitte geben Sie den Laufwerk-Buchstaben des Geraetes an. (Bsp. "G")
echo Bestaetigen Sie anschliessend mit der "Enter"-Taste.
echo.
echo Wo finde ich den Laufwerks-Buchstaben?
echo Oeffnen Sie den "Computer" hinter Ihrem Geraet finden Sie einen Buchstaben.
echo.
set quelle=
set /p quelle=Laufwerk:
cls
echo Stimmt alles so?
echo.
echo Sicherungsname: %name%
echo.
echo Welches Geraet wird gesichert?
echo Das Geraet auf Laufwerk "%quelle%".
echo.
echo Wo wird die Sicherung gespeichert?
echo Unter %ziel%.
echo.
echo.
pause
cls
robocopy %quelle%:\ %ziel% /MIR
cls
echo.
echo Die Aufgabe wurde am %Date% um %Time% Uhr abgeschlossen.
echo.
echo Wurde die Aufgabe fuer Sie zu schnell abgeschlossen?
echo Das kann daran liegen, dass nur kleine Aenderungen zwischen dem Geraet und der Sicherung vorhanden waren. Daher wird die Sicherung sehr schnell abgeschlossen.
echo.
echo mdct Group RobSafe 6 Stick
echo.
echo www.mdct-group.com
echo info@mdct-group.com
echo.
echo Support und Hilfe
echo www.mdct-group.com/support
echo.
echo Zum beenden
pause
exit
rem GNU GPL Lizenz // mdct Group
rem Made in Germany
