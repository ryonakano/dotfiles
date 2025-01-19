alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias grepn='grep -nr'

alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'
alias ls='ls --color=auto'

alias treea-nogit='tree -a -I ''.git/'''
alias tree='tree -C' # colored

alias vim='nvim'
alias view='nvim -R'

alias lazyssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias lazyscp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias fbld='flatpak-builder builddir-fpk --user --install --force-clean'
