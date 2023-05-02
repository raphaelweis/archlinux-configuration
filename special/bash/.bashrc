#############################
# Plugins
#############################

eval "$(starship init bash)"

#############################
# General configuration
#############################

set -o vi # use vi mode
bind '"jk":vi-movement-mode' # bind jk to exit insert mode

#######################################
# Aliases 
#######################################

alias vim='nvim'
alias bonjour='cowsay bonjour' # absolutely capital
alias bt='bluetuith' # bluetooth tui
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash && zsh'

# git aliases
alias gitc='git checkout'
alias gits='git status'

# use lsd as a replacement for la
alias ls='lsd'
alias la='lsd -la'

# use zoxide as a replacement for cd.
alias cd='z'

# directory up aliases
alias .2='../..'
alias .3='../../..'
alias .4='../../../..'
alias .5='../../../../..'

#############################
# Environnment Variables
#############################

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export PDFVIEWER="/usr/bin/firefox"
export VIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
export VIMCONFDIR="$XDG_CONFIG_HOME/nvim"
export WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
export SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

#######################################
# Functions
#######################################

### ARCHIVE EXTRACTION
# usage: ex <file>
ex () {
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
