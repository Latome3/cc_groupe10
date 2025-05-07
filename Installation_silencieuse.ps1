# *** Configuration ***
$installerPath = "C:\Users\hp\Downloads\Git-2.49.0-64-bit.exe" # Remplace par le chemin réel
$installArguments = "/s /v`/qn" # Arguments pour une installation silencieuse (varie selon l'installeur)
$workingDirectory = "C:\Users\hp\Desktop\Projet" # Remplace par le chemin de ton projet local
$commitMessage = "Installation silencieuse et mise à jour des fichiers"
$remoteName = "origin" # Nom de ton dépôt distant (généralement "origin")
$branchName = "feature" # Nom de la branche distante

# *** Installation Silencieuse ***
Write-Host "Démarrage de l'installation silencieuse..."
Start-Process -FilePath $installerPath -ArgumentList $installArguments -Wait -NoNewWindow
Write-Host "Installation terminée."

# *** Navigation vers le répertoire du projet ***
cd $workingDirectory

# *** Ajout de tous les fichiers modifiés ***
Write-Host "Ajout des fichiers modifiés..."
git add .

# *** Commit des changements ***
Write-Host "Commit des changements..."
git commit -m "$commitMessage"

# *** Vérification et changement de branche ***
Write-Host "Vérification de la branche actuelle..."
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Branche actuelle : $currentBranch"

if ($currentBranch -ne $branchName) {
    Write-Host "Changement vers la branche '$branchName'..."
    git checkout $branchName
} else {
    Write-Host "Déjà sur la branche '$branchName'."
}

# *** Envoi vers le dépôt distant ***
Write-Host "Envoi des changements vers le dépôt distant '$remoteName' sur la branche '$branchName'..."
git push $remoteName $branchName
Write-Host "Envoi terminé."

Write-Host "Tâche accomplie !"