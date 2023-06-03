#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS="wget"

KEY_URL=https://www.virtualbox.org/download/oracle_vbox_2016.asc
KEY_DIR=/etc/apt/keyrings
KEY_FILE=vbox.gpg

OS_RELEASE=/etc/os-release
CODENAME_TOKEN="UBUNTU_CODENAME="
DEB_URL=https://download.virtualbox.org/virtualbox/debian
APT_SRC_DIR=/etc/apt/sources.list.d
APT_SRC_FILE=vbox.list

ZATHURA_DESKTOP=/usr/share/applications/org.pwmt.zathura.desktop

# VirtualBox only supports amd64
ARCH=$(dpkg --print-architecture)
if [ $ARCH != "amd64" ]; then
	echo "[ERR] VirtualBox is not available on your architecture: $ARCH"
	exit 1
fi
# VirtualBox is already installed
which vboxmanage > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "[INFO] VirtualBox is already installed, skipping…"
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
CODE=$(grep "^$CODENAME_TOKEN" $OS_RELEASE)
CODE=${CODE#$CODENAME_TOKEN}
echo "deb [arch=amd64 signed-by=$KEY_DIR/$KEY_FILE] $DEB_URL $CODE contrib" | sudo tee $APT_SRC_DIR/$APT_SRC_FILE

# Install VirtualBox
sudo apt update
sudo apt install -y virtualbox-7.0 linux-headers-generic linux-headers-$(uname -r)
sudo usermod -aG vboxusers $USER
# Hide unnecessary desktop file from the launcher
echo "NoDisplay=true" | sudo tee -a $ZATHURA_DESKTOP
