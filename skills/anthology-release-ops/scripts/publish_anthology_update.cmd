@echo off
setlocal
chcp 65001 >nul
set PYTHONUTF8=1

for %%I in ("%~dp0..\..\..") do set "ANTHOLOGY_WORKGIT_DIR=%%~fI"
if not defined ANTHOLOGY_RELEASE_LOCAL_CONFIG set "ANTHOLOGY_RELEASE_LOCAL_CONFIG=%ANTHOLOGY_WORKGIT_DIR%\release.local.json"

title Anthology Release Control
cd /d "%~dp0"
py -3 anthology_publish_wizard.py %*
if errorlevel 1 (
  echo.
  echo Publish failed. Check the error above.
  pause
)