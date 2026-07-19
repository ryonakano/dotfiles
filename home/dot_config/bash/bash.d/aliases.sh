alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias grepn='grep -nrI'

alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'
alias ls='ls --color=auto'

alias treea-nogit='tree -a -I ''.git'''
alias tree='tree -C' # colored

alias nview='nvim -R' # view in nvim

alias lazyssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias lazyscp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias fbuild='flatpak-builder --user --install --force-clean --repo=flatpak-repo builddir-fpk'
alias fbundle='flatpak build-bundle --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo flatpak-repo bundle.flatpak'
