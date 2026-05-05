#!/bin/bash

CONFIG_FILES="$CONFIG_DIR_FLATPAK/*-$DISTRO_ID-$ARCH.flatpakconf"

for file in $CONFIG_FILES; do
	source "$file"

	flatpak remote-add --if-not-exists --user "$REMOTE_NAME" "$REMOTE_URL"
	flatpak install -y --user "$REMOTE_NAME" $INSTALL_ID

	unset REMOTE_NAME
	unset REMOTE_URL
	unset INSTALL_ID
done
