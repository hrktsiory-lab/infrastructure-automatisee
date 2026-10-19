# Rôle common

Applique le socle de sécurité commun à tous les serveurs (Debian 12 et Rocky Linux 9).

## Variables
- `common_timezone` : Fuseau horaire (défaut: Indian/Antananarivo)
- `common_ssh_port` : Port SSH (défaut: 22)
- `common_ssh_permit_root` : Autoriser root (défaut: no)
- `common_ssh_password_auth` : Auth par mot de passe (défaut: no)

## Tâches
1. Définir le fuseau horaire.
2. Installer chrony, UFW (Debian) / firewalld (Rocky).
3. Durcir SSH (root interdit, clé uniquement).
4. Activer le pare-feu.
