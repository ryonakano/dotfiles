#!/bin/bash

readonly CHROME_KEY_URL=https://dl-ssl.google.com/linux/linux_signing_key.pub
readonly CHROME_KEY_FILE=google.gpg
readonly CHROME_DEB_URL=http://dl.google.com/linux/chrome/deb/
# This file seems to be overwritten while installation.
# Changing this filename to anything else will cause apt errors, so keep it as it is.
readonly CHROME_LIST_FILE=google-chrome.list

import_apt_key $CHROME_KEY_URL $CHROME_KEY_FILE $CHROME_LIST_FILE $CHROME_DEB_URL stable main
sudo apt install -y google-chrome-stable
