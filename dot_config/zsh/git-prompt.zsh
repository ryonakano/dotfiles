GIT_PROMPT=$HOME/bin/git-prompt.sh
if [ -f $GIT_PROMPT ]; then
	source $GIT_PROMPT
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUPSTREAM=auto
	
	# c.f. https://zenn.dev/sprout2000/articles/bd1fac2f3f83bc#5.-プロンプトへ色を付ける
	setopt PROMPT_SUBST; PS1='[%F{002}%n@%m%f %F{123}%~%f%F{212}$(__git_ps1 " (%s)")%f]\$ '
fi
