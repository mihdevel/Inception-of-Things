#!/bin/bash
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface en0" sh -s -
kubectl apply -f /vagrant/confs/app-one.yaml >/dev/null 2>&1
kubectl apply -f /vagrant/confs/app-two.yaml >/dev/null 2>&1
kubectl apply -f /vagrant/confs/app-three.yaml >/dev/null 2>&1
kubectl apply -f /vagrant/confs/ingress.yaml >/dev/null 2>&1