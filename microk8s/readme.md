# MicroK8s

- Date : 2022-04-08

Installaltion : 

```bash
sudo snap install microk8s --classic
sudo microk8s start
microk8s status
microk8s enable dns dashboard storage
microk8s disable dns dashboard storage
microk8s stop

microk8s kubectl get all --all-namespaces

# Création d'un alias
alias microkube="microk8s kubectl"


token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
```