@echo off
setlocal
title Wii ISO Joiner

:START
echo Enter the directory containing the ISO parts:
set /p "sourceDir="
if not exist "%sourceDir%" (echo [ERROR] Directory not found! & goto START)
cd /d "%sourceDir%"

:ID
echo Enter Game ID (filename before .part0.iso):
set /p "gameID="
if not exist "%gameID%.part0.iso" (echo [ERROR] %gameID%.part0.iso not found! & goto ID)

:OUT
echo Enter full output path and filename (e.g. C:\Games\Game.iso):
set /p "outPath="

echo Joining all parts...
copy /b "%gameID%.part*.iso" "%outPath%"

if %errorlevel% neq 0 (
    echo [ERROR] Failed to join files. Ensure the target drive is not FAT32.
) else (
    echo Process finished successfully.
)

pause
