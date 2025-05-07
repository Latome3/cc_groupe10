#!/bin/bash

# Paramètres par défaut
logName="System"
exportPath="/c/Logs/system_logs.txt"
startDate=$(date --date="7 days ago" +"%Y-%m-%dT%H:%M:%SZ")
logsDir="/c/Logs"

# Fonction d'aide pour le script
usage() {
    echo "Usage: $0 [-l logName] [-p exportPath] [-d days]"
    echo "  -l logName    : Nom du log à exporter (par défaut: 'System')"
    echo "  -p exportPath : Chemin du fichier d'export (par défaut: '/c/Logs/system_logs.txt')"
    echo "  -d days       : Nombre de jours à partir duquel exporter les logs (par défaut: 7)"
    exit 1
}

# Traitement des arguments
while getopts "l:p:d:" opt; do
    case $opt in
        l) logName=$OPTARG ;;
        p) exportPath=$OPTARG ;;
        d) startDate=$(date --date="$OPTARG days ago" +"%Y-%m-%dT%H:%M:%SZ") ;;
        *) usage ;;
    esac
done

# Vérifier si PowerShell est installé
if ! command -v powershell.exe &>/dev/null; then
    echo "❌ PowerShell n'est pas installé ou accessible. Veuillez l'installer."
    exit 1
fi

# Créer le dossier d'export s’il n’existe pas
mkdir -p "$logsDir"

# Message de début
echo "✅ Exportation des logs à partir de : $startDate"
echo "✅ Log : $logName"
echo "✅ Fichier de sortie : $exportPath"

# Exporter les logs en utilisant wevtutil via PowerShell
echo "⏳ Récupération des logs..."
powershell.exe -Command "wevtutil qe $logName /q:\"*[System[TimeCreated[@SystemTime >= '$startDate']]]\" /f:text" > "$exportPath"

# Vérifier si la commande a échoué
if [ $? -ne 0 ]; then
    echo "❌ Échec de l'exportation des logs."
    exit 1
fi

# Confirmation de l'export
echo "✅ Logs exportés vers : $exportPath"
