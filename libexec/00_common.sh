#!/bin/bash

APT_SRC_DIR=/etc/apt/sources.list.d
APT_KEY_DIR=/etc/apt/keyrings

################################
# Import apt key and add list file
#
# $1		URL of the keyfile to import
# $2		Name of the keyfile to import
# $3		Name of the .list file
# $4..$6	Paramaters in the .list file, see the following figure:
#
#           deb [ option1=value1 option2=value2 ] uri suite [component1] [component2] [...]
#                                                 ~~~ ~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~
#                                                 $4  $5    $6
################################
import_apt_key() {
	local key_url=$1
	local key_file=$2
	local list_file=$3
	local uri=$4
	local suite=$5
	local components=$6

	# Get signature
	local tmpdir=$(mktemp -d)
	wget -q -O - "$key_url" | gpg --dearmor > $tmpdir/$key_file
	sudo mkdir -p $APT_KEY_DIR
	sudo mv $tmpdir/$key_file $APT_KEY_DIR
	rmdir $tmpdir

	# Create source list
	sudo mkdir -p $APT_SRC_DIR
	echo "deb [signed-by=$APT_KEY_DIR/$key_file] $uri $suite $components" | sudo tee $APT_SRC_DIR/$list_file

	sudo apt update
}
