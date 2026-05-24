#!/bin/bash

################################################################################
# Install Docker Engine
# See https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
################################################################################
# Do not enable autostart in root mode
curl -fsSL https://get.docker.com | sudo sh -s -- --no-autostart

################################################################################
# Use rootless mode
# See https://docs.docker.com/engine/security/rootless/
################################################################################
dockerd-rootless-setuptool.sh install
