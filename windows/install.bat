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