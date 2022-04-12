# Exercice 14 - Kubernetes - Gestion

Dans les exercices qui le permettent, assurez-vous de toujours indiquer un espace de nom qui correspond à votre numéro de matricule. Pour vous aider, ne sautez pas l'exercice 2.

## Partie 1 - Amélioration de votre bash (bash seulement)

- Ouvrez un terminal avec bash et tapez la commande suivante et relancez un nouveau bash :

```bash
echo "source <(kubectl completion bash)" >> ~/.bashrc # ajoute l'auto-complétion de manière permanente à votre shell bash
```

(Source : https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/)

## Partie 2 - Ajout du cluster distant et modification du contexte

!!! Si vous êtes sous windows, ne passez pas par le Ubuntu de Windows mais par powershell !!!

- Faites une copie de sauvegarde de votre fichier .kube/config 
- Éditez le fichier et ajoutez une configuration dans propriété cluster avec le nom "kubernetes-distant" :

```yaml
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1EZ3lNVEV6TWpBMU1Gb1hEVE14TURneE9URXpNakExTUZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTVY1CndHNkkweitKVmVKcVVVZXJZNkJuWjF3VUdGbndObzlNTVZqSTBaQ21oWEtiKzhTUDNXR1h3Y09mVU10SngzY00KckFaUFJrZERRY3JWbjkrWDNoakwyRTlHcEg3a3FQeWhud3JKQlBzWWVLQld5dkUzYVhJdUcwZkw5TmovQzRERQpDVFZrQXV2TjZiZVViTFBoM2lZNjJBcjFKWVhtSTRDak13TmQyZ0lNemRTTUl1OGFwaXFTMkMrd0psL3kvRUNvCmtsL1dMMERuWmFRdkhlaWozU3JZQ3NpNTNnMEpTNUU2VFdXWG85MkJheTFRTVVSS01IQkJic1RYUGdqZ0U5ZVQKNVk2WE5lZnRQRlVKa1QxUnJIcnRRcW51Zy84STBUdm9YditMbHNXa1FpZ210UHVDcjBIV2JaVCtXeXdkL3ZBZQpOSG5NYWhMWHVYdEFCdEVEY3Q4Q0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZOb0RMd1NOajBWcG1VWHVLV0xrSWFmd3BaZWpNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBYXpaRGp5aHpNWTRlcEF6TDdCUzJzZndCcnNiQ2ZHVWhXTnZ4VXZWdkNzT29PeUJhKwpjeTJobFd1ZmtVMVAwNks5SUY3cW1jZ0NpdklVZmFkTHRmNEVEb3VuWW4vSFhLRGdHaVRsd0swYUhuUmZaNXU5CkFZcElocVUrMW9GWTUyRTNyR3ljc2pOQzJGd1R0ZVhSazN0OVNybEdhbXhrT09xTE1sVFVoV0dMSDNIbEZyM1AKb1hNaTlWRWQzUWZpQjVUbm5uY1BZeFEvTU0yWVpWRE9kWWgxaTRicUhDeVl5RWx6UmtmTU04U1lZbStmaVRTVgpQMjJEVVhPazg5bFl2MkpjZkRYWkdJQy9PdHR1eXFqdi9wbzV5ZVkzdFI2OHdIOVMySUp3WW5LK2ozc09IVnplCmxELzVWV2NlQ1VOeEkwSWZLZThMRmxlR0JTWGdRRGVKUGF2cAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://10.100.2.90:6443
  name: kubernetes-distant
```

- Ajoutez l'utilisateur "kubernetes-distant-admin" :

```yaml
- name: kubernetes-distant-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJSXdGa1RPVmRFL0V3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TVRBNE1qRXhNekl3TlRCYUZ3MHlNakE0TWpFeE16SXdOVE5hTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQW5oVnQvZXRNR0hoOFpnVHoKczliVjFlZlRsMExUSEFFZkkzVXV2YTdwNmpWa0dkSVliK3VzTEZZdWdsbDlCc2J5VWptODlWZFpGaFFpLzBldApFL2ludS80S2RTWFdDOWhSbzFNWnBqZ1JIRnFkL2dxY2lLUWVkajJGZnlIZ0FDWHZVQ0RmYlRteUFwNExEVzlCCllIaWFuanpkaTFSWHZWbFQzSm9objRzSUFvNktLRlpMT0d3Y3l2RDFwbmozQ2dTYVQ1aG9YMS9ldE12YkFLQnQKcHdQelhGWk92NWpCRmZzdE1mT1psU0Y0d0NhNW9GYXZPVkNRSmVhK2JNcGJUb2hvR1NoRndyUnh2Y1U4SGVlRwowaXZ2clZXclN4M011TVBnN0lwLzJaTzBSeHhSa2FyOWtWSW9FVXJTbCsvL3Q1RVVHTG1tVGRjSVNjc010eFhXCmJXeDlEd0lEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVUyZ012QkkyUFJXbVpSZTRwWXVRaHAvQ2xsNk13RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFJV1orVm5jcmt0YmwzVXk4eWZLWm9UOWVDV1R6clV5SkRJb1ZRWWM3MmxQMWFSRjF6MDB5bFJXCm1DN01YcGZBSGsvUHNGS3J3WVZZK3N6bm4yNWQ4L000Wk1takJkT214MnFIdjhDZ1AyMS9nMlpjVk52b1hzTkgKcm9jcmhla21OR3NSSGhDRGZGWWJHYTJadTNVVVdxTkFkZEI0NnpLaHZnUVpaUGhHWUlRc0d1TnMvZzNLSmdKbQpVeG4vR1haUFV5R2dHRnluM3dZeTFlWmxod05IaWNpQXc4MDhYcUZ2ZzBEM2JNY2JZOVNxY0JtNWVtZTdWSE4vCkR2Q0c1NHBhVEdycnZLeVM2KzZMVGZKSzA2MXdMMjNhNGpCdC9nZWZidUZlT2pnTVpiQkpUbjZTckdia3l4OFcKMkdYR3NoMEE0bTJsVWRMYlVqaGF3aEtSTzFXcVJERT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb2dJQkFBS0NBUUVBbmhWdC9ldE1HSGg4WmdUenM5YlYxZWZUbDBMVEhBRWZJM1V1dmE3cDZqVmtHZElZCmIrdXNMRll1Z2xsOUJzYnlVam04OVZkWkZoUWkvMGV0RS9pbnUvNEtkU1hXQzloUm8xTVpwamdSSEZxZC9ncWMKaUtRZWRqMkZmeUhnQUNYdlVDRGZiVG15QXA0TERXOUJZSGlhbmp6ZGkxUlh2VmxUM0pvaG40c0lBbzZLS0ZaTApPR3djeXZEMXBuajNDZ1NhVDVob1gxL2V0TXZiQUtCdHB3UHpYRlpPdjVqQkZmc3RNZk9abFNGNHdDYTVvRmF2Ck9WQ1FKZWErYk1wYlRvaG9HU2hGd3JSeHZjVThIZWVHMGl2dnJWV3JTeDNNdU1QZzdJcC8yWk8wUnh4UmthcjkKa1ZJb0VVclNsKy8vdDVFVUdMbW1UZGNJU2NzTXR4WFdiV3g5RHdJREFRQUJBb0lCQUZLc1htT25CSnJmbUI4NgpnOEVQbjdGSWxrM0s4dUQ0YlRKNy9EL1RGQjRhWWdsbTZNVFBlYkdPT0xDTzRHWUU4WUd6RkhFeWh6S1d3VjdFCk8yM3dZcmhjT1ZmZXU3eGlHdi9SVzk2ai83N1dYVDRZaXBpalRCTUdSYVNoTUthak1DNjFvbU5iQXc5L1c4UmcKNU0zeEJOdXdkU1NDcllnbkNVYWJqTzRGSmVFL20rWHpNK3Znd3pTMnc0K29wbHFOUXg2b05kQ2ZMRllzUXJrWgpoWW1DaDRIZ0hRSFZSWmhlemEwZlBrcXl2dUQzVUVTckNlRExxL2ZBSlFmWXFDK2daQzJTODZOYWVmTVlQUXVuCktPMXFIL2Q3L21oS3VTVERWL1Jsd09uWEg1dDJPbnJaMDZyaUU3Q0ZiTkV5Q0VPN1l6SzR6ZTVib2dSOHMrWVMKeWJrQUlKRUNnWUVBeloraXpkcFF5N05wOFhIUFNJR2ZZMnZENkQ4ZmphVHhmTElnRkxZTGIvVnNnTVRXSTdYbwoxTkhXR1lHNHgzeW9qQmMzVURDTVYvYjhCL1J2bEROTGliZlZHdk0xUnFiRXE2b3I4NGJ2R3QzM21CczB0aHVjCkhSOGJvUVRNbUo4Z1kxQnJRcS92bFU0VmR5VEYzMVVnaCtXTkhFRTB1OWRVcWQ1TVh0T3ZNQ1VDZ1lFQXhOQXMKWDF6M1hlWG04dkxiZ0ZsZlBkSnVpc2txN3IzMHZqT0ZUVjhKWXRrZTJDcitqVkd5cWdlTnBjUVQvcUhJYWFYbQpMc3ljM2F6em5Ea3VxaEJmaXRDWHhUb1U1c2VTdUl3elNhU2k1VE5PVU5JdHBTRmpBVjJlL2dhUk9xM1Bzc3ExCnpLNkZobU9ZRngzbmtKcVV0T2dFeUgrUEFxS3AxTXFhODA2c3lDTUNnWUJKWGlSZy92ekZNZ2NqTjFDV3RtbUEKdC9yMjYwNys0MU9uQW9lZjNEVEloZkZwSU5LbmUwalFadTdWdXd1TFlsZGhaUWMvZlpNVjcvS05oQklyOXdHRQo2aXNIcXEvZnZiRis3d0V2cTMyMVFHNFB2K1ZXOVJNRzhRcVNzWHV2R1ZnZEY1eXQ5c2l0cFdiVFZET21OR0dmCkc3RDEyKzVNOTlBbHJFUGpzZlJZWVFLQmdEVVNEV1VKcElwbFhBbFhBMmx3c0FYem9HczhJNStOQ1ZuZ2VxbUsKWHZXUXBvaVR6MkE4RDNsWjRCQTY5MGxLUnNoMk84T1MyUm5OY1VOSENCWkRvLy9DajZwWEp4dXo1UlJ1ZWNYNQo1eEwyNnI5UWJZNkJtampjRGV0aHlmZVF0dGozWUY1NUVQaFVFc2JwQVhBMHZyU3BlK0MweE5OcEdYS1B6NGljClJtc1JBb0dBZmJrSEcvMzBIYnFNQmRucmpsRGpqZ1Nsc0UyVC9nejhWMmxBTGJNbzhKU1BTN1ZTUTRwOHVFTTUKdkQxcitrYlV4TEJjdjFJcEFBY0FjTHVaVTdOWmRiSTdreWZSN2dGczF6QzhUZGd3Q0wzLzdUZTNsNW1mNnZNQQphS0laVGVKN3d2aklKQ3o4Z1d4RVo2WGFWck1lSmRibVdONG5nY2hIdmdzVkNKRVJLODg9Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==
```

- Créez vous un contexte avec la commande 'kubectl config set-context', spécifiez un nom de namespace qui correspond à votre numéro de matricule, le cluster et l'utilisateur que vous venez de spécifier.
- Définissez votre nouveau context comme étant le contexte courant (use-context)
- Affichez les noeuds et les pods du cluster (tous les namespaces) et de votre namespace pour valider que tout fonctionne

## Partie 3 - Création d'un Pod

Dans cet partie, vous allez créer une spécification pour lancer un premier Pod.

### 1. Création de la spécification

Créez un fichier yaml *whoami.yaml* définissant un Pod ayant les propriétés suivantes:

- nom du Pod: *whoami*
- image du container: *containous/whoami*
- nom du container: *whoami*

<details>
l'image *containous/whoami* est un petit serveur web qui imprime les informations sur les os et les requêtes HTTP en sortie. 
</details>

### 2. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*

### 3. Vérification

Listez les Pods lancés et assurez vous que le Pod *whoami* apparait bien dans cette liste.

### 4. Details du Pod

Observez les détails du Pod à l'aide de *kubectl* et retrouvez l'information de l'image utilisée par le container *whoami*.

### 5. Accès à l'application via un port-forward

Avec la commande *kubectl port-forward* envoyer une requête à l'application

### 6. Suppression du Pod

Supprimez le Pod.

---

## Correction

### 1. Création de la spécification

La spécification, définie dans le fichier *whoami.yml*, est la suivante:kube

```
apiVersion: v1             
kind: Pod                  
metadata:
  name: whoami
spec:
  containers:
  - name: whoami
    image: containous/whoami
```

### 2. Lancement du Pod

Le Pod peut être créé avec la commande suivante:

```
$ kubectl apply -f whoami.yaml
```

### 3. Vérification

La commande suivante permet de lister les Pods présent:

```
$ kubectl get pods
```

Note: il est aussi possible de précisez *pod* (au singulier) ou simplement *po*

```
$ kubectl get pod

$ kubectl get po
NAME      READY     STATUS    RESTARTS   AGE
whoami    1/1       Running   0          22s
```

### 4. Details du Pod

Les details d'un Pod peuvent être obtenus avec la commande suivante:

```
$ kubectl describe pod whoami
```

Note: les commandes suivantes peuvent également être utilisées:

- kubectl describe pods whoami
- kubectl describe po whoami
- kubectl describe pods/whoami
- kubectl describe pod/whoami
- kubectl describe po/whoami

Dans cette sortie, on peut voir la liste des containers du Pods et l'image utilisée pour le container *whoami*.

Il est également possible d'obtenir la spécification du Pod avec la commande suivante dans laquelle on spécifie via *-o yaml* le format de sortie.

```
$ kubectl get po/whoami -o yaml

  startTime: "2020-05-18T14:21:03Z"
```

### 5. Accès à l'application via un port-forward

Depuis un premier terminal lancez la commande suivante:

```
$ kubectl port-forward whoami 8888:80
```

Depuis un second terminal, vérifiez que l'application est accessible sur localhost depuis le port 8888:

```
$ curl localhost:8888
Hostname: whoami
IP: 127.0.0.1
IP: 192.168.33.3
RemoteAddr: 127.0.0.1:47334
GET / HTTP/1.1
Host: localhost:8888
User-Agent: curl/7.68.1
Accept: */*
```

### 6. Suppression du Pod

Le Pod peut etre supprimé avec la commande suivante:

```
$ kubectl delete po/whoami
```

## Partie 4 - Lancement de l'application wordpress

Dans cet partie vous allez créer un Pod contenant 2 containers permettant de lancer une application wordpress.

### 1. Création de la spécification

Créez un fichier yaml *wordpress_pod.yaml* définissant un Pod ayant les propriétés suivantes:

- nom du Pod: *wp*
- un premier container:
  - nommé *wordpress*
  - basé sur l'image *wordpress:4.9-apache*
  - définissant la variable d'environnement *WORDPRESS_DB_PASSWORD* avec pour valeur *mysqlpwd* (cf note)
  - définissant la variable d'environnement *WORDPRESS_DB_HOST* avec pour valeur *127.0.0.1* (cf note)
- un second container:
  - nommé *mysql*
  - basé sur l'image *mysql:5.7*
  - définissant la variable d'environnement *MYSQL_ROOT_PASSWORD* avec pour valeur *mysqlpwd* (cf note)

Note: chaque container peut définir une clé *env*, celle-ci contenant une liste de variables d'environnement sous la forme de paires clé / valeur

### 2. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*

### 3. Vérification du status du Pod

Utilisez *kubectl* pour vérifier l'état du Pod.

Au bout de quelques secondes, il devrait être dans l'état *Running* (le temps que les images des containers soient téléchargées depuis le DockerHub).

### 4. Accès à l'application

Forwardez le port *8080* de la machine hôte sur le port *80* du container *wordpress*.

Lancez un navigateur sur http://localhost:8080

En ouvrant un navigateur sur l'URL indiquée, vous obtiendrez l'interface web de setup de *Wordpress*.

### 5. Suppression du Pod

A l'aide de *kubectl* supprimez le Pod *wp*.

---

## Correction

### 1. Création de la spécification

La spécification, définie dans le fichier *wordpress_pod.yaml*, est la suivante:

```
apiVersion: v1
kind: Pod
metadata:
  name: wp
spec:
  containers:
  - image: wordpress:5.8.0-apache
    name: wordpress
    env:
    - name: WORDPRESS_DB_HOST
      value: 127.0.0.1
    - name: WORDPRESS_DB_PASSWORD
      value: mysqlpwd
    - name: WORDPRESS_USER
      value: wpuser

  - image: mysql:latest
    name: mysql
    env:
    - name: MYSQL_ROOT_PASSWORD
      value: mysqlpwd
```

Note: le Pod défini par la spécification ci-dessus ne permet pas de découpler les données gérées par le container *mysql* avec le cycle de vie de ce même container.
Comme nous le verrons un peu plus loin dans ce cours, nous pourrions définir un volume dans la spécification du Pod et le monter dans le container *mysql* comme cela est illustré dans la spécification ci-dessous.

```
apiVersion: v1
kind: Pod
metadata:
  name: wp
spec:
  containers:
  - image: wordpress:5.8.0-apache
    name: wordpress
    env:
    - name: WORDPRESS_DB_PASSWORD
      value: mysqlpwd
    - name: WORDPRESS_DB_HOST
      value: 127.0.0.1
  - image: mysql:latest
    name: mysql
    env:
    - name: MYSQL_ROOT_PASSWORD
      value: mysqlpwd
    volumeMounts:
    - name: data
      mountPath: /var/lib/mysql
  volumes:
  - name: data
    emptyDir: {}por
```

### 2. Lancement du Pod

Le Pod peut être lancé avec la commande suivante:

```
$ kubectl apply -f wordpress_pod.yaml
```

### 3. Vérification du status du Pod

La commande suivante permet de voir l'état du Pod *wp*

```
$ kubectl get po/wp
```

Vous dévriez obtenir un Pod dans l'état *ContainerCreating* pendant quelques secondes, le temps que les images des containers soient téléchargées du DockerHub.

```
$ kubectl get po/wp
NAME      READY     STATUS              RESTARTS   AGE
wp        0/2       ContainerCreating   0          49s
```

Rapidement, le Pod devrait apparaitre avec le status *Running*

```
$ kubectl get pod/wp
NAME      READY     STATUS    RESTARTS   AGE
wp        2/2       Running   0          2m
```

### 4. Accès à l'application

la commande suivante permet de forwarder le port *8080* de la machine hôte sur le port *80* du container *wordpress*. 

```
$ kubectl port-forward wp 8080:80
Forwarding from 127.0.0.1:8080 -> 80
```

### 5. Suppression du Pod

Le Pod peut être supprimé avec la commande suivante:

```
$ kubectl delete po/wp wp
```
