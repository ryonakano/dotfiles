#!/bin/bash

################################################################################
# Setup prerequisites for rootless mode
# See https://docs.docker.com/engine/security/rootless/#prerequisites
################################################################################
sudo apt-get install -y uidmap
