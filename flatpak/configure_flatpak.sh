#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS="flatpak"

FLATHUB_REPO_NAME=flathub
FLATHUB_REPO_URL=https://flathub.org/repo/flathub.flatpakrepo

# Apps to install from Flathub
FLATHUB_APPS="\
	com.slack.Slack \
	im.riot.Riot \
	net.poedit.Poedit \
"

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Add Flathub as a remote
flatpak remote-add --if-not-exists --user $FLATHUB_REPO_NAME $FLATHUB_REPO_URL

# Install selected apps
flatpak install -y $FLATHUB_APPS
