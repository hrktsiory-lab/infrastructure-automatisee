
---

### 3. Le README du rôle `lynis`
**Commande :** `nano ~/ansible-project/roles/lynis/README.md`
**Copie-colle ceci :**
```markdown
# Rôle lynis

Installe l'outil d'audit de sécurité Lynis et génère un rapport de conformité.

## Variables

Aucune variable spécifique. Le nom du rapport utilise `{{ inventory_hostname }}`.

## Tâches principales

1. Installer Lynis (APT sur Debian, EPEL + DNF sur Rocky).
2. Exécuter l'audit système (`lynis audit system --quick`).
3. Afficher le score "Hardening index" dans la sortie Ansible.
4. Sauvegarder le rapport complet dans `/tmp/lynis-report-<hostname>.txt`.

## Utilisation

```yaml
- hosts: all
  become: true
  roles:
    - lynis
