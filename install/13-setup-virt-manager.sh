#!/bin/bash

# Give permission to /dev/kvm
sudo usermod -aG kvm "$USER"
# Disable polkit authorization
sudo usermod -aG libvirt "$USER"
