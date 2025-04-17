# User specific aliases and functions
BASH_D="$HOME/.config/bash/bash.d"
if [ -d "$BASH_D" ]; then
	for rc in "$BASH_D"/*; do
		if [[ "${rc##*/}" = *.sh ]]; then
			source "$rc"
		fi
	done
	unset rc
fi
unset BASH_D
