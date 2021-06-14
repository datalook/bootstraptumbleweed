#!/bin/sh
zypper install -y podman cockpit-podman buildah skopeo podman-docker

# zypper install -y cockpit
# sudo systemctl enable cockpit.socket
# sudo systemctl start cockpit.socket
# firewall-cmd --permanent --zone=public --add-service=cockpit
# firewall-cmd --reload

sudo systemctl enable podman
sudo systemctl start podman
