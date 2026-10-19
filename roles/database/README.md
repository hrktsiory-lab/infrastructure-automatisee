# Rôle database

Installe et configure une base de données MariaDB sur les machines du groupe `bdd`.

## Variables

| Variable | Défaut | Description |
|----------|--------|-------------|
| `db_name` | `stageIT` | Nom de la base de données à créer |
| `db_user` | `dracarys` | Nom de l'utilisateur de la base |
| `db_password` | `{{ vault_db_password }}` | Mot de passe (chiffré via Ansible Vault) |
| `db_allowed_host` | `192.168.3.%` | Réseau autorisé à se connecter |

## Tâches principales

1. Installer MariaDB et les dépendances Python.
2. Démarrer et activer le service MariaDB.
3. Créer la base de données spécifiée.
4. Créer l'utilisateur avec les droits sur la base, restreint au réseau interne.
5. Ouvrir le port 3306 dans le pare-feu.

## Sécurité

Le mot de passe est chargé depuis `group_vars/all/vault.yml` (Ansible Vault).

## Utilisation

```yaml
- hosts: bdd
  become: true
  vars_files:
    - ../group_vars/all/vault.yml
  roles:
    - database
