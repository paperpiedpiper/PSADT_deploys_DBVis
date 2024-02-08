@echo off
set "source=\\tsclient\C\AppPackaging\DBvis\Deploy-Application.ps1"
set "destination=C:\Users\stduser\Desktop\DBvis"

xcopy /y %source% %destination%

set "source2=\\tsclient\C\AppPackaging\DBvis\SupportFiles"
set "destination2=C:\Users\stduser\Desktop\DBvis\SupportFiles"

mkdir "%destination2%" 2>nul

xcopy "%source2%\*" "%destination2%\" /E /I /Y