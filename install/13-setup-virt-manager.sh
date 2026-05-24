#!/bin/bash

# Give permission to /dev/kvm
sudo usermod -aG kvm "$USER"
# Disable polkit authorization
sudo usermod -aG libvirt "$USER"

# Make it possible to use both virt-manager and Docker
# Originally from https://note.com/ample_arnica9775/n/n1df66fc6fa3e
sudo mkdir -p /usr/local/bin
sudo tee /usr/local/bin/libvirt-docker-forward.sh > /dev/null << EOF
#!/bin/bash
# Wait for Docker to create DOCKER-USER chain
#sleep 5

# Add rules if not already present
iptables -C DOCKER-USER -i virbr0 -j ACCEPT 2>/dev/null || iptables -I DOCKER-USER 1 -i virbr0 -j ACCEPT
iptables -C DOCKER-USER -o virbr0 -j ACCEPT 2>/dev/null || iptables -I DOCKER-USER 1 -o virbr0 -j ACCEPT
EOF
sudo chmod +x /usr/local/bin/libvirt-docker-forward.sh

sudo tee /etc/systemd/system/libvirt-docker-forward.service > /dev/null << EOF
[Unit]
Description=Setup libvirt forwarding through Docker
After=docker.service libvirtd.service
Requires=docker.service libvirtd.service

[Service]
Type=oneshot
ExecStart=/usr/local/bin/libvirt-docker-forward.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable libvirt-docker-forward.service
sudo systemctl start libvirt-docker-forward.service
