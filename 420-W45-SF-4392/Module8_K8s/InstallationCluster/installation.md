# Installation cluster

## Gabarit

```bash
apt update
apt upgrade
apt install docker.io
systemctl enable docker.service
systemctl start docker.service


apt install apt-transport-https
apt install curl
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
apt install bash-completion

apt install openssh-server
systemctl enable ssh.service
systemctl start ssh.service

# commenter ligne swap dans /etc/fstab
swapoff -a

```

## Sur le master

```bash
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml

```

### NFS

Fichier /etc/exports

```export
/srv/exports 10.100.1.0/24(rw,sync,all_squash,anonuid=1000,anongid=1000)
```


## Sur tous les noeuds

Éditer fichier /etc/host

modifier aussi le nom de l'hôte (ex.) :
```bash
hostnamectl set-hostname e2020-iv-k8s-c01-master
```

### Situation final (21 août 2021)


[10:23] Pierre-François Léon
    Le nfs est installé sur 10.100.2.90 (le master) dans /srv/exports
    j'ai autorisé 10.100.0.0/16 à y accéder
    pastebin.com/Gjt3CxgN

- Répertoire Perm_W44_IV_JP_k8s_c02
- 1 master 9 nodes