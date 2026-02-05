#!/bin/bash

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

# Install bashrc
BASH_INIT="$CONFIG_HOME/bash/init.sh"

# Install .bashrc only when it's not installed.
grep -wq "$BASH_INIT" ~/.bashrc
if [ $? -ne 0 ]; then
	echo -e "\nsource $BASH_INIT" >> ~/.bashrc
fi

# Install sheldon
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
	| bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
