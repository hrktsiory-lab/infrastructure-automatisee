
---

### 2. Le README du rôle `fileserver`
**Commande :** `nano ~/ansible-project/roles/fileserver/README.md`
**Copie-colle ceci :**
```markdown
# Rôle fileserver

Installe et configure un serveur de fichiers Samba sur les machines du groupe `fichiers`.

## Variables

| Variable | Défaut | Description |
|----------|--------|-------------|
| `samba_share_name` | `partage` | Nom du partage réseau |
| `samba_share_path` | `/srv/partage` | Chemin physique du dossier |
| `samba_group` | `partage` | Groupe autorisé à accéder au partage |

## Tâches principales

1. Installer Samba.
2. Créer le groupe `partage`.
3. Créer le dossier `/srv/partage` avec les droits `0770`.
4. Ajouter la configuration du partage dans `/etc/samba/smb.conf`.
5. Démarrer et activer le service.
6. Ouvrir les ports 139 et 445 dans le pare-feu.

## Utilisation

```yaml
- hosts: fichiers
  become: true
  roles:
    - fileserver
