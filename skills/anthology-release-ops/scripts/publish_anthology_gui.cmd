@echo off
setlocal
chcp 65001 >nul
set PYTHONUTF8=1

set ANTHOLOGY_WORKGIT_DIR=X:\OpenAI\anomaly-codex-main\projects\Anthology-Work-Git
set ANTHOLOGY_LAUNCHER_DIR=X:\OpenAI\anomaly-codex-main\projects\Anthology-Work-Git\projects\AnthologyLauncher
set ANTHOLOGY_MODPACK_DIR=X:\S.T.A.L.K.E.R\A.N.T.H.O.L.O.G.Y\ANTHOLOGY\SYS_A.N.T.H.O.L.O.G.Y_mo2_CBT\mods
set ANTHOLOGY_LIVE_GAME_DIR=X:\S.T.A.L.K.E.R\A.N.T.H.O.L.O.G.Y\ANTHOLOGY

title Anthology Release Control GUI
cd /d "%~dp0"
py -3 anthology_release_control_gui.py
if errorlevel 1 (
  echo.
  echo GUI failed. Check the error above.
  pause
)
