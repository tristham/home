# Installation client Ubuntu VM


```bash

apt install apt-transport-https
apt install curl
apt update && apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update 
apt install -y kubectl=1.20.10-00
scp -r dev@10.100.2.90:/home/dev/.kube .

#Vérifier les nodes : 
kubectl get nodes