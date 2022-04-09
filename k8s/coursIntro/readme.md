# Commandes de base du K8S

## Voir l'architecture:
kubectl get <type> <ressource>[, type ressource]* :
```bash
kubectl get nodes # Ensemble des noeuds du cluster
kubectl get pods --all-namespaces
kubectl get pods # Namespace par défaut ou le miens si déclaré
Kubectl get namespaces # Voir les namespaces

```
### Démarrer ma session dans K8S

```bash
kubectl config set-context --current --namespace=jpd
```
### Commandes impératives 

```bash
kubectl run nginx --env="Dev" 
kubectl get pod
kubectl get pod -o wide
kubectl get pod -o yaml  
kubectl get pod -o yaml  > www.yaml
kubectl delete pods www
```
### Utilisation de fichier YAML
```bash
cd demo
kubectl get pods, services
kubectl apply -f ./
kubectl get pods
kubectl get pods -o wide   
kubectl run debug -it --image=alpine sh
kubectl delete -f ./p
kubectl get pods -o wide   
kubectl delete pod debug
