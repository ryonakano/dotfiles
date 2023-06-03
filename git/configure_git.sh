#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS="git wget gpg pass"

GIT_CONFIG_DIR=~/.config/git

# bashrc
BASHRC=~/.bashrc
BASHRC_GIT=$CWD/bashrc_git

# gitignore
GITIGNORE_GLOBAL=$GIT_CONFIG_DIR/ignore

# git-prompt
GIT_PROMPT=git-prompt.sh
GIT_PROMPT_SRC=https://raw.github.com/git/git/main/contrib/completion/$GIT_PROMPT
GIT_PROMPT_DEST=$GIT_CONFIG_DIR/$GIT_PROMPT

# git-credential-manager
GCM_VER=2.1.2
GCM_URL=https://github.com/GitCredentialManager/git-credential-manager/releases/download/v$GCM_VER/gcm-linux_amd64.$GCM_VER.tar.gz
GCM_DEST=/usr/local/share/gcm-core

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

mkdir -p $GIT_CONFIG_DIR

# Install bashrc
grep -wq $BASHRC_GIT $BASHRC
if [ $? -ne 0 ]; then
	echo "source $BASHRC_GIT" >> $BASHRC
fi

# Install global gitignore
ln -svf $CWD/ignore $GITIGNORE_GLOBAL

# Install gitconfig
git config --get-regexp include.path | grep -qw $CWD/gitconfig
if [ $? -ne 0 ]; then
	git config --global --add include.path $CWD/gitconfig
fi

# Install git prompt
wget $GIT_PROMPT_SRC -O $GIT_PROMPT_DEST

# Install git-credential-manager
TMP_TAR=$(mktemp)
wget -O $TMP_TAR $GCM_URL
sudo mkdir -p $GCM_DEST
sudo tar xvf $TMP_TAR -C $GCM_DEST
rm -r $TMP_TAR

# Setup credential store
GPG_UID=""
while true; do
	GPG_UID=$(gpg --list-key | grep uid | sed -r 's/^uid.*] (.*).*$/\1/')
	if [ "$GPG_UID" != "" ]; then
		break
	fi

	gpg --gen-key
done
pass ls > /dev/null
if [ $? -ne 0 ]; then
	pass init "$GPG_UID"
fi
