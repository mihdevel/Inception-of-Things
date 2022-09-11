#!/bin/bash
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

#echo "Установка net-tools"
#yum -y install net-tools

echo "Установка k3s"
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--bind-address=192.168.56.110 --node-ip 192.168.56.110 --tls-san 192.168.56.110" sh -

echo "Поиск kubectl"
which kubectl # Показывает где находится исполняемаю программа

echo "kubectl apply files"
/usr/local/bin/kubectl apply -f /vagrant/confs/app-one.yaml
/usr/local/bin/kubectl apply -f /vagrant/confs/app-two.yaml
/usr/local/bin/kubectl apply -f /vagrant/confs/app-three.yaml
/usr/local/bin/kubectl apply -f /vagrant/confs/ingress.yaml

echo "Статус кластера"
/usr/local/bin/kubectl get all
/usr/local/bin/kubectl get nodes -o wide
echo "End script"