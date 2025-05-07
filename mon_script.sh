#!/bin/bash

# Paramètres
logName="System"
exportPath="/c/Logs/system_logs.txt"
startDate=$(date --date="7 days ago" +"%Y-%m-%dT%H:%M:%SZ")

# Créer le dossier s’il n’existe pas
mkdir -p /c/Logs

# Exporter les logs en utilisant wevtutil via PowerShell
powershell.exe -Command "wevtutil qe $logName /q:\"*[System[TimeCreated[@SystemTime >= '$startDate']]]\" /f:text" > $exportPath

echo "✅ Logs exportés vers : $exportPath"
