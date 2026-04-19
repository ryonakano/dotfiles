#!/bin/bash

sudo apt update
sudo apt install -y \
	openssh-server

sudo systemctl restart ssh.service
sudo systemctl enable ssh.service
