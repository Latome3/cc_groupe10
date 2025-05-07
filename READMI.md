# Script Bash pour l'exportation des logs système Windows

## Description
Ce script permet d'exporter les événements du journal système (`System`) de Windows à partir de la ligne de commande **Git Bash** ou **WSL** (Windows Subsystem for Linux). Il utilise `wevtutil` via PowerShell pour extraire les événements et les exporter dans un fichier texte (`.txt`).

## Prérequis
- **Git Bash** ou **WSL** (Windows Subsystem for Linux) doivent être installés sur ton système Windows.
- **PowerShell** doit être accessible pour exécuter la commande `wevtutil`.

## Fonctionnement du Script

Le script effectue les étapes suivantes :
1. **Définition des paramètres :**
   - Le journal système à récupérer est spécifié par la variable `$logName`, qui est configurée sur `"System"`.
   - Le fichier de sortie est spécifié par la variable `$exportPath`, qui est définie sur `C:\Logs\system_logs.txt`.

2. **Création du dossier de sortie :**
   - Si le dossier `C:\Logs` n'existe pas, le script le crée avec la commande `mkdir`.

3. **Récupération des logs d'événements :**
   - Le script utilise **`wevtutil`** via PowerShell pour interroger les événements système à partir de la date actuelle moins 7 jours. Cela permet d'obtenir uniquement les événements récents.
   - Le format de date utilisé est **ISO 8601** (année-mois-jour heure:minute:seconde).

4. **Exportation des logs :**
   - Les logs sont exportés dans un fichier texte (`system_logs.txt`) situé dans le dossier `C:\Logs`.

## Code du Script

```bash
