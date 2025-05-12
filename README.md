# cc_groupe10

##  Description

`cc_groupe10` est un projet Shell développé dans le cadre d’un projet de classe à KEYCE INFORMATIQUE. Il a pour objectif d’automatiser plusieurs tâches courantes de gestion et de maintenance d’un système Windows à l’aide de scripts Shell. Le projet est divisé en trois modules principaux :

- **Installation silencieuse de logiciels**
- **Audit du système (CPU, RAM, etc.)**
- **Exportation des logs d'événements**

##  Objectif pédagogique

Ce projet a été réalisé à des fins d’apprentissage dans le cadre d’un cours sur l'outils git. Il est destiné à être évalué par l’enseignant, mais peut aussi servir de base pour des outils d’automatisation plus poussés.

##  Structure du projet

Le projet contient trois scripts principaux :

| Fichier                        | Fonctionalité                                |
|-------------------------------|----------------------------------------------|
| `install_silencieux.sh`       | Installe des logiciels en mode silencieux    |
| `audit_systeme.sh`            | Collecte et enregistre des informations sur le système     |
| `export_logs.sh`              | Exporte les logs d’événements système        |

>  **Note** : Tous les scripts sont indépendants et peuvent être exécutés séparément.

## 🛠️ Prérequis

-  **Système** : Windows avec une couche de compatibilité Shell (ex : Git Bash, Cygwin, WSL)
-  **Outils Shell** : `bash`, `powershell`, ou outils compatibles selon le contexte
-  **Droits administrateur** : Recommandé pour certaines opérations (logs, audit, installation)

##  Utilisation

Ouvrez un terminal compatible et exécutez les scripts de la manière suivante :

```bash
./install_silencieux.sh
./audit_systeme.sh
./export_logs.sh

