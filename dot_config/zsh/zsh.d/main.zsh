# History
HISTFILE=$HOME/.cache/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
# Add timestamp prefix to histories
setopt extended_history
alias history='history -t "%F %T"'

# Key binding (Emacs)
bindkey -e

# Navigation
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# User-installed binaries
PATH="${PATH}:$HOME/.local/bin/"
