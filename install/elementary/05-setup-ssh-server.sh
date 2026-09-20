#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
	openssh-server

sudo systemctl restart ssh.service
sudo systemctl enable ssh.service
