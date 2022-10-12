#!/bin/bash

#install kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install k3d
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# install docker
# sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io
sudo service docker start
sudo gpasswd -a $USER docker
sudo chmod 777 /var/run/docker.sock

#create k3d cluster
k3d cluster create mycluster
# k3d cluster create k3s-demo-cluster --api-port 8080 --agents 1 --k3s-arg "--disable=traefik@server:0" --k3s-arg "--disable=servicelb@server:0" --no-lb --wait
# k3d cluster create mycluster -p 8080:80@loadbalancer --k3s-arg "--disable=traefik@server:0"
# k3d cluster create mycluster -p 8080:80@loadbalancer -p 8888:8888@loadbalancer --k3s-arg "--disable=traefik@server:0"

#Create argocd and dev namespaces
kubectl create namespace argocd
kubectl create namespace dev

# argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl apply -f ../confs/argocd.yaml

#playground
# kubectl apply -f ../confs/playground.yaml -n dev
