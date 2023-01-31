# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \

# stow
stow git
stow zsh
stow nvim

# add zsh to validl login shells
command -v zsh | sudo tee -a /etc/shell

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# logout the user and kill processes (fix for fedora)
#pkill -KILL -u $USER
