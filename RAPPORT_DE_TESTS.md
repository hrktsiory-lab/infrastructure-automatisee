# Rapport de tests

## 1. Test d'idempotence
- **Action** : `ansible-playbook playbooks/site.yml`
- **Résultat** : `changed=0` sur les 4 serveurs.

## 2. Test de conformité
- **Action** : Modification manuelle de `PermitRootLogin yes` sur server-web.
- **Résultat** : Semaphore détecte l'écart, puis Ansible le corrige automatiquement.

## 3. Test de reconstruction
- **Action** : Suppression de Nginx sur server-web.
- **Résultat** : Ansible réinstalle Nginx et redéploie la page en moins de 2 minutes.

## 4. Audit Lynis
- Debian : Score 65 / Rocky : Score 68.
