# Rôle webserver

Installe et configure le serveur web Nginx sur les machines du groupe `web`.

## Variables

| Variable | Défaut | Description |
|----------|--------|-------------|
| `webserver_port` | `80` | Port d'écoute HTTP |

## Tâches principales

1. Installer Nginx (via APT sur Debian, DNF sur Rocky).
2. Déployer une page d'accueil personnalisée (`index.html`) affichant le nom d'hôte et l'OS.
3. Démarrer et activer le service Nginx.
4. Ouvrir le port 80 dans le pare-feu local (UFW ou firewalld).

## Utilisation

```yaml
- hosts: web
  become: true
  roles:
    - webserver
