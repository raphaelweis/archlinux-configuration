@echo off

@REM Alacritty configuration
set "sourceFile=%USERPROFILE%\dotfiles\main\alacritty\alacritty.yml"
set "destinationDir=%APPDATA%\alacritty"
set "destinationFile=%APPDATA%\alacritty\alacritty.yml"
if exist "%destinationFile%" (
    del "%destinationFile%"
)
mkdir "%destinationDir%"
mklink "%destinationFile%" "%sourceFile%"

@REM Powershell Profile configuration
set "sourceFile=%USERPROFILE%\dotfiles\main\powershell\Microsoft.PowerShell_profile.ps1"
set "destinationDir=%USERPROFILE%\Documents\Powershell"
set "destinationFile=%USERPROFILE%\Documents\Powershell\Microsoft.PowerShell_profile.ps1"
if exist "%destinationFile%" (
    del "%destinationFile%"
)
mkdir "%destinationDir%"
mklink "%destinationFile%" "%sourceFile%"

@REM ideavimrc configuration
set "sourceFile=%USERPROFILE%\dotfiles\special\ideavimrc\.ideavimrc"  
set "destinationDir=%USERPROFILE%"
set "destinationFile=%USERPROFILE%\.ideavimrc
if exist "%destinationFile%" (
    del "%destinationFile%"
)
mklink "%destinationFile%" "%sourceFile%"
