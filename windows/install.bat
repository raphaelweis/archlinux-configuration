@echo off

@REM Alacritty configuration
set "sourceFile=C:\Users\rapha\dotfiles\main\alacritty\alacritty.yml"
set "destinationDir=%APPDATA%\alacritty"
set "destinationFile=%APPDATA%\alacritty\alacritty.yml"
if exist "%destinationFile%" (
    del "%destinationFile%"
)
mkdir "%destinationDir%"
mklink "%destinationFile%" "%sourceFile%"

@REM Alacritty configuration
set "sourceFile=C:\Users\rapha\dotfiles\main\powershell\Microsoft.PowerShell_profile.ps1"
set "destinationDir=C:\Users\rapha\Documents\Powershell"
set "destinationFile=C:\Users\rapha\Documents\Powershell\Microsoft.PowerShell_profile.ps1"
if exist "%destinationFile%" (
    del "%destinationFile%"
)
mkdir "%destinationDir%"
mklink "%destinationFile%" "%sourceFile%"
