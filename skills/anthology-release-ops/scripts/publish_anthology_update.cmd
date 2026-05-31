@echo off
setlocal
chcp 65001 >nul
set PYTHONUTF8=1
title Anthology Release Control
cd /d "%~dp0"
py -3 anthology_publish_wizard.py %*
if errorlevel 1 (
  echo.
  echo Publish failed. Check the error above.
  pause
)
