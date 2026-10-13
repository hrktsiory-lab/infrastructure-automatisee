#!/bin/bash
# =====================================================
# Contrôle de conformité nocturne
# Détecte les écarts SANS modifier les serveurs
# =====================================================

cd ~/ansible-project

DATE=$(date +%Y-%m-%d_%H-%M)
LOG_DIR="$HOME/ansible-project/rapports"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/check-$DATE.log"

echo "=== Contrôle de conformité du $(date) ===" > "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Exécution en mode --check (aucune modification)
ansible-playbook playbooks/site.yml --check --diff >> "$LOG_FILE" 2>&1

# Extraire le PLAY RECAP
echo "" >> "$LOG_FILE"
echo "=== Résumé ===" >> "$LOG_FILE"
grep -A 10 "PLAY RECAP" "$LOG_FILE" | tail -10 >> "$LOG_FILE"

echo "Rapport généré : $LOG_FILE"
