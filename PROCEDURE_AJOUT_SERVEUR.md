# Procédure d'ajout d'un nouveau serveur

1. **Création de la VM** : Créer la VM dans VirtualBox (réseau en Accès par pont), installer l'OS (Debian ou Rocky) avec le serveur SSH.
2. **Configuration SSH** : Depuis Kali, copier la clé avec `ssh-copy-id -i ~/.ssh/ansible_key.pub user@IP`.
3. **Sudo** : Sur la VM, ajouter `user ALL=(ALL) NOPASSWD:ALL` dans `/etc/sudoers.d/user`.
4. **Inventaire** : Ajouter la nouvelle IP dans `inventory/hosts.ini` sous le bon groupe.
5. **Déploiement** : Lancer `ansible-playbook playbooks/site.yml --ask-vault-pass`.
