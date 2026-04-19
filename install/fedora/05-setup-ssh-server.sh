#!/bin/bash

sudo dnf install -y \
	openssh-server

sudo systemctl restart sshd.service
sudo systemctl enable sshd.service
