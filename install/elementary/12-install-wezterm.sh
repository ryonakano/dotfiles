#!/bin/bash

readonly WEZTERM_KEY_URL=https://apt.fury.io/wez/gpg.key
readonly WEZTERM_KEY_FILE=wezterm-fury.gpg
readonly WEZTERM_DEB_URL=https://apt.fury.io/wez/
# This file seems to be overwritten while installation.
# Changing this filename to anything else will cause apt errors, so keep it as it is.
readonly WEZTERM_LIST_FILE=wezterm.list

import_apt_key $WEZTERM_KEY_URL $WEZTERM_KEY_FILE $WEZTERM_LIST_FILE $WEZTERM_DEB_URL '*' '*'
sudo apt install -y wezterm-nightly
