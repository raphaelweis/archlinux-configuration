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
# Plugins
#######################################

# source antidote
source $HOME/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# source zsh theme (powerlevel10k)
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# source zsh history substring search
source $ZDOTDIR/zsh-history-substring-search.zsh

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

# Keybinds: vi
bindkey -v

# Keybinds: zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#######################################
# Aliases 
#######################################

alias la='ls -la'
alias vim='nvim'
alias gc='git checkout' # for faster git navigation
alias bonjour='cowsay bonjour' # absolutely capital
alias ..="cd .."
alias .2="../.."
alias .3="../../.."
alias .4="../../../.."
alias .5="../../../../.."

#######################################
# Environment variables
#######################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"
export XDG_CACHE_HOME="$HOME/.cache"
export BROWSER="/usr/bin/firefox"
export PDFVIEWER="/usr/bin/firefox"
export VIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
export VIMCONFDIR="$XDG_CONFIG_HOME/nvim"

#######################################
# Functions
#######################################

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#######################################
# Else
#######################################

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # To work with nvm, see documentation at https://github.com/nvm-sh/nvm
