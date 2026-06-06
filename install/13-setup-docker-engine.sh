#!/bin/bash

# Install Docker Engine
# See https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
curl -fsSL https://get.docker.com | sudo sh

# Allow running docker command without sudo
sudo usermod -aG docker $USER
