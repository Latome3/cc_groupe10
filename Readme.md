# Script d'Installation Silencieuse et d'Envoi Git

Ce script PowerShell automatise l'installation silencieuse d'un logiciel (dans ce cas, Git) et l'envoi des modifications vers une branche spécifique d'un dépôt Git distant.

## Prérequis

Avant d'exécuter ce script, assure-toi que les éléments suivants sont en place :

* *PowerShell :* Un environnement PowerShell est nécessaire pour exécuter le script. Il est généralement installé par défaut sur les systèmes Windows récents.
* *Git :* Bien que le script installe Git, il est préférable de s'assurer qu'aucune version antérieure conflictuelle n'est présente. Si Git est déjà installé et que tu souhaites simplement l'utiliser, tu peux commenter la section d'installation.
* *Dépôt Git Local :* Le script suppose que tu te trouves dans un répertoire local qui est déjà initialisé comme un dépôt Git (git init a été exécuté).
* *Dépôt Git Distant :* Un dépôt Git distant doit exister sur une plateforme comme GitHub, GitLab ou Bitbucket, et la remote origin doit être configurée pour pointer vers ce dépôt.
* *Fichier d'Installation :* Le fichier d'installation du logiciel (ici, Git-2.49.0-64-bit.exe ou une version similaire) doit être disponible à l'emplacement spécifié dans la configuration du script.
* *Permissions :* Tu dois avoir les permissions nécessaires pour exécuter des scripts PowerShell sur ton système (voir la section "Résolution des problèmes" si tu rencontres des erreurs d'exécution). Tu dois également avoir les droits d'accès en écriture sur la branche distante du dépôt Git.

## Configuration

Avant d'exécuter le script, tu dois modifier les variables dans la section *** Configuration *** pour correspondre à ton environnement :

* $installerPath = "C:\Users\hp\Downloads\Git-2.49.0-64-bit.exe"
* $installArguments = "/s /v/qn"` : Ces arguments sont utilisés pour effectuer une installation silencieuse de Git. Ils peuvent varier en fonction de l'installeur. Consulte la documentation de l'installeur si nécessaire.
* $workingDirectory = "C:\Users\hp\Desktop\cc_groupe5"
* $commitMessage = "Installation silencieuse et mise à jour des fichiers" : Tu peux personnaliser le message de commit Git.
* $remoteName = "origin" : Le nom de la remote vers laquelle tu souhaites pousser (généralement origin). Modifie si nécessaire.
* $branchName = "feature" : Le nom de la branche distante vers laquelle tu souhaites pousser tes changements. Modifie si nécessaire.

## Utilisation

1.  *Enregistre le script :* Enregistre le code PowerShell dans un fichier avec l'extension .ps1 (par exemple, deploy-git.ps1).
2.  *Ouvre PowerShell :* Ouvre une fenêtre PowerShell.
3.  *Navigue vers le répertoire du script :* Utilise la commande cd pour te déplacer vers le dossier où tu as enregistré le fichier .ps1.
4.  *Exécute le script :* Exécute le script en tapant la commande suivante et en appuyant sur Entrée :
    powershell
    ./deploy-git.ps1
    
    Si tu rencontres des problèmes d'exécution, consulte la section "Résolution des problèmes" ci-dessous.

## Fonctionnement du Script

Le script effectue les étapes suivantes :

1.  *Installation Silencieuse :* Exécute l'installeur spécifié avec les arguments pour une installation silencieuse.
2.  *Navigation vers le répertoire du projet :* Se déplace vers le répertoire de travail Git configuré.
3.  *Ajout des fichiers modifiés :* Ajoute tous les fichiers modifiés et non suivis (git add .).
4.  *Commit des changements :* Crée un nouveau commit avec le message configuré (git commit -m "$commitMessage").
5.  *Vérification et changement de branche :* Vérifie la branche Git actuelle et change vers la branche spécifiée ($branchName) si nécessaire.
6.  *Envoi vers le dépôt distant :* Pousse les commits locaux vers la branche spécifiée du dépôt distant (git push $remoteName $branchName).

## Résolution des problèmes

* *Erreur d'exécution des scripts :* Si tu reçois une erreur indiquant que l'exécution des scripts est désactivée sur ton système, tu devras modifier la politique d'exécution de PowerShell. Ouvre PowerShell en tant qu'administrateur et exécute Set-ExecutionPolicy RemoteSigned. Sois conscient des implications de sécurité de cette action. Tu peux également essayer d'exécuter le script avec la commande PowerShell.exe -ExecutionPolicy Bypass -File "chemin\vers\ton\script.ps1".
* *Fichier d'installation introuvable :* Vérifie que le chemin vers le fichier d'installation ($installerPath) est correct.
* *Répertoire de travail incorrect :* Assure-toi que le chemin vers le répertoire de ton projet Git ($workingDirectory) est exact.
* *Erreurs Git :* Si tu rencontres des erreurs liées à Git (par exemple, dépôt distant non configuré, branche inexistante), vérifie la configuration de ton dépôt local.

## Auteur

[ Groupe5]

## Date

[07/05/2025]