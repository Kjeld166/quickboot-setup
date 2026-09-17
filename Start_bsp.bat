@echo off
title LernSax & Workspace Start-Skript
setlocal


echo.
echo 1. LernSax Netzlaufwerk verbinden...
set /p auto="Soll dein Windows-Benutzername automatisch für LernSax genutzt werden? (y/n): "

if /i "%auto%"=="y" (
    set "lernsax_user=%USERNAME%"
    goto :connect
)

if /i "%auto%"=="n" (
    set /p "lernsax_user=Bitte gib deinen LernSax-Benutzernamen ein: "
    goto :connect
)

:: Fallback falls eine falsche Taste gedrückt wird
echo Ungültige Eingabe, breche LernSax-Verbindung ab.
goto :theme

:connect
:: Hinweis: Der WebClient-Dienst muss in Windows aktiv sein, damit WebDAV funktioniert.
net use Z: https://lernsax.de/ /user:%lernsax_user%

:theme
echo.
echo 2. Wende das Windows Theme Pack an...
start "" "pfad\zu\deiner\datei.deskthemepack"

echo 3. Oeffne die Ordner im Explorer...
:: Öffnet mehrere Pfade in einem einzigen Explorer-Fenster
start explorer "explorerordner1" "explorerordner2"

echo.
echo Fertig! Alle Aktionen wurden ausgeführt.
timeout /t 5
endlocal