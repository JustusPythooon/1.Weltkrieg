@echo off
setlocal
cd /d "%~dp0"
title Projekt ZEITRISS V7

echo ========================================
echo   PROJEKT ZEITRISS V7 WIRD GESTARTET
echo ========================================
echo.

where py >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8765/index.html"
    py -m http.server 8765 --bind 127.0.0.1
    goto :end
)

where python >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8765/index.html"
    python -m http.server 8765 --bind 127.0.0.1
    goto :end
)

echo Python wurde nicht gefunden.
echo Starte jetzt die PowerShell-Notfallversion.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0STARTEN_OHNE_PYTHON.ps1"

:end
endlocal
