# Lecture et recherche sur Ansible

## Pourquoi 
- Gérer les mises à jour
- Installer les infrastructure
- Gérer les réseau
- Gérer le monitoring
- Sauvegarde

## Installation de depuis Python3 et PIP

```bash
sudo su -
apt search python3-pip
apt install python3-pip
pip3 install ansible
```

## Scruter la machine local
En mode Ad Hoc ?
```bash
ansible -m setup localhost
```
Pour limité l'information :
- 
```bash
ansible-doc setup
```
Voir ausi le site Web https://docs.ansible.com

```bash
ansible -m file -a "path=/tmp/test state=directory" localhost
```
Si je tape deux fois la commande, je vois la notion de idemPotant (Se dit d’un élément a d’un ensemble présentant une loi de composition interne telle que a.A = a ou encore Se dit d’un élément a d’un ensemble présentant une loi de composition interne telle que a.A = a)

```bash
ansible -m file -a "path=/tmp/test state=directory owner=root group=root" localhost
```
vas provoqué une erreur car nous n'avons pas les droits.

On doit faire une escalade de droit :
```bash
ansible -m file -a "path=/tmp/test state=directory owner=root group=root" localhost --become
```
Encore une erreur car on doit utliser le mécanisme de sudo automatique donc on doit saisir le mot de passe.
```bash
ansible -m file -a "path=/tmp/test state=directory owner=root group=root" localhost --become -K
```

Maitenant ça fonctionne.
```bash
ls -ld /tmp/test
```
```bash
ansible -m file -a "path=/tmp/test state=directory owner=root group=root" localhost --become 
```
Fonctionne car le mécanisme sudo se souvient du mot de passe.
De plus remarqué l'état idemPotant.
## Référence :
Vidéo Eni

[Ansible - Gérez la configuration de vos serveurs et le déploiement de vos applications (2e édition) ](https://www.eni-training.com/portal/client/mediabook/home)

[Github-Ansible](https://github.com/EditionsENI/ansible)

[group discussion](https://groups.google.com/g/ansible-project)