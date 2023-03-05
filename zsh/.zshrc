#######################################
# Powerlevel10k instant prompt
#######################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######################################
# Plugin Manager : Antidote
#######################################

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# source zsh theme (powerlevel10k)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################################
# General Configuration
#######################################

# Command history config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#
setopt autocd extendedglob # typing a path to a directory will auto cd into it

#
unsetopt beep # disable beep when errors occur

# Keybinds : vi
bindkey -v

#######################################
# Aliases 
#######################################

alias la='ls -la'
alias vim='nvim'
alias nvim-conf='$HOME/.config/nvim'
alias hypr-conf='$HOME/.config/hypr'
alias git-conf='$HOME/.config/git'
alias alacritty-conf='$HOME/.config/alacritty'
alias nvim-conf='$HOME/.config/zsh'

#######################################
# Environment Variables 
#######################################

#
export PATH=/home/raphaelw/.local/bin:$PATH
