# bootstraptumbleweed
bootstrap a fresh install of tumbleweed with kubernetes

> chmod +x /bootstraptumbleweed.sh

Then run the script with: ./bootstraptumbleweed.sh

Then on one of the Tumleweed installs use 'kubeadm init' to bootstrap a kubernetes master node. Then once kubernetes is loaded on the node use the 'kubeadm join' script pronted at the bottom on all other nodes to have them join the Kubernetes cluster
