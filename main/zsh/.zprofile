export GOPATH=$HOME/.go

# make sure dotfiles are up to date
cd $HOME/dotfiles
git pull
cd $HOME

$HOME/.config/hypr/starth.sh # Hyprland startup script
