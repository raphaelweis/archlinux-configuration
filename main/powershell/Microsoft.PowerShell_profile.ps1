Invoke-Expression (&starship init powershell)
Write-Host -NoNewLine "`e[2 q"
$ENV:STARSHIP_CONFIG = "$HOME\dotfiles\main\starship.toml"
clear
