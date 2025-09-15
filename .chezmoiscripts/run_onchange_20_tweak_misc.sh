#!/bin/bash

which virt-manager > /dev/null
if [ $? -eq 0 ]; then
	# Give permission to /dev/kvm
	sudo usermod -aG kvm "$USER"
	# Disable polkit authorization
	sudo usermod -aG libvirt "$USER"
fi
