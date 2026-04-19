GIT_PROMPT="$HOME/.local/bin/git-prompt.sh"
if [ -f "$GIT_PROMPT" ]; then
	source "$GIT_PROMPT"
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUPSTREAM=auto

	PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[1;35m\]$(__git_ps1)\[\e[m\]\$ '
fi
unset GIT_PROMPT
