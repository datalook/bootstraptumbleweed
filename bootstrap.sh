#!/bin/sh
zypper install -y cockpit cockpit-storaged cockpit-networkmanager cri-o cri-tools kubernetes-client

cat <<EOF | sudo tee /etc/modules-load.d/crio.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

sudo systemctl daemon-reload
sudo systemctl enable crio --now

cat <<EOF | sudo tee /etc/crio/crio.conf
[crio.runtime]
conmon_cgroup = "pod"
cgroup_manager = "cgroupfs"
EOF

sudo systemctl enable cockpit.socket
sudo systemctl start cockpit.socket
sudo systemctl enable kubelet

firewall-cmd --permanent --zone=public --add-service=cockpit
firewall-cmd --reload
