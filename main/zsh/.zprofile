export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# make sure dotfiles are up to date
cd $HOME/dotfiles
git pull
cd $HOME

$HOME/.config/hypr/starth.sh # Hyprland startup script
