#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS=""

if [ $# -ne 1 ]; then
	echo "usage: $0 [TARBALL]"
	exit 1
fi

EXTRA_TARBALL=$1

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Do nothing if extra tarball doesn't exist
if [ ! -e $EXTRA_TARBALL ]; then
	exit 0
fi

TMP_DIR=$(mktemp -d)
EXTRA_SCRIPT=$TMP_DIR/extra.sh
tar xvzf $EXTRA_TARBALL -C $TMP_DIR
# Execute extra script if exists and is executable
if [ -x $EXTRA_SCRIPT ]; then
	echo "Running extra configuration…"
	$EXTRA_SCRIPT
fi

rm -rf $TMP_DIR
