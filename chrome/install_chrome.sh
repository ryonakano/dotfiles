#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS="wget"

KEY_URL=https://dl-ssl.google.com/linux/linux_signing_key.pub
KEY_DIR=/etc/apt/keyrings
KEY_FILE=google.gpg

DEB_URL=http://dl.google.com/linux/chrome/deb/
APT_SRC_DIR=/etc/apt/sources.list.d
# This file seems to be overwritten while installation.
# Changing this filename to anything else will cause apt errors, so keep it as it is.
APT_SRC_FILE=google-chrome.list

# Google Chrome only supports amd64
ARCH=$(dpkg --print-architecture)
if [ $ARCH != "amd64" ]; then
	echo "[ERR] Google Chrome is not available on your architecture: $ARCH"
	exit 1
fi
# Google Chrome is already installed
which google-chrome > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "[INFO] Google Chrome is already installed, skipping…"
	exit 0
fi

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Get signature
WORK_DIR=$(mktemp -d)
wget -q -O - $KEY_URL | gpg --dearmor > $WORK_DIR/$KEY_FILE
sudo mkdir -p $KEY_DIR
sudo mv $WORK_DIR/$KEY_FILE $KEY_DIR
rmdir $WORK_DIR

# Create source list
sudo mkdir -p $APT_SRC_DIR
echo "deb [arch=amd64 signed-by=$KEY_DIR/$KEY_FILE] $DEB_URL stable main" | sudo tee $APT_SRC_DIR/$APT_SRC_FILE

# Install Google Chrome
sudo apt update
sudo apt install -y google-chrome-stable
