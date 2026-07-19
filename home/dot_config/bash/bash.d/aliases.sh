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

alias fbuild='flatpak-builder --user --install --force-clean builddir-fpk'
alias fbuild-aarch64='flatpak-builder --user --force-clean --arch=aarch64 --repo=flatpak-repo builddir-fpk-aarch64'
alias fbundle-aarch64='flatpak build-bundle --arch=aarch64 --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo flatpak-repo bundle.flatpak'
