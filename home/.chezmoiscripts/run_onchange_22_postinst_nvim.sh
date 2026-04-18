#!/bin/bash

# Install npm (Node.js) that CocInstall requres
NVM_VERSION=v0.40.4
NODEJS_VERSION=24		# Latest LTS

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash

# in lieu of restarting the shell
. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install $NODEJS_VERSION
