# Kubernetes
Principales commandes 

## Voir l'architecture:
```bash
kubectl get nodes # Ensemble des noeuds du cluster
kubectl get pods --all-namespaces
```
## Démarrer ma session dans K8S
```bash
kubectl config set-context --current --namespace=jpd
```
##
```bash
cd exer16
kubectl get pods
```
##
```bash
kubectl get services
```
## Démarrez un service
```bash
kubectl apply -f ./dir
kubectl get pods
kubectl get service
kubectl get pv 
kubectl get pods -o wide   
kubectl delete -f ./

```
Accéder au Dashboard : 

```bash
kubectl proxy
# Dans le navigateur :
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```