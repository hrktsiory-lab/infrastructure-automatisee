# Infrastructure Automatisée

Projet de stage L2 ASR (ENI Fianarantsoa) — Configuration automatisée de serveurs Linux avec Ansible.

## Objectif

Décrire la configuration des serveurs dans des fichiers versionnés, l'appliquer automatiquement par le réseau, et corriger les écarts.

## Environnement

- **Machine de gestion** : Kali Linux (Ansible)
- **Serveurs gérés** : 2 Debian 12 + 2 Rocky Linux 9
- **Interface web** : Semaphore UI
- **Versionnement** : Git

## Rôles Ansible

| Rôle | Cible | Contenu |
|------|-------|---------|
| `common` | Tous | SSH durci, pare-feu, chrony, fuseau horaire |
| `webserver` | server-web | Nginx + site d'exemple |
| `database` | server-db | MariaDB + base de données |
| `fileserver` | server-fs | Samba + partage |
| `lynis` | Tous | Audit de sécurité |

## Utilisation

Déployer toute l'infrastructure :

    ansible-playbook playbooks/site.yml

Vérifier la conformité sans modifier :

    ansible-playbook playbooks/site.yml --check

Auditer la sécurité :

    ansible-playbook playbooks/lynis.yml

## Structure

    ansible-project/
    ├── ansible.cfg
    ├── inventory/hosts.ini
    ├── playbooks/
    ├── roles/
    └── rapports/

## Sécurité appliquée

- Connexion SSH par clé uniquement
- Connexion root interdite
- Pare-feu actif (UFW sur Debian, firewalld sur Rocky)
- Mises à jour de sécurité automatiques

## Résultats

- 4 serveurs configurés en une commande
- Idempotence vérifiée
- Scores Lynis : 65 (Debian) / 68 (Rocky)

## Auteur

Tsiory — Stage à DOKODE, Fianarantsoa (2026)
