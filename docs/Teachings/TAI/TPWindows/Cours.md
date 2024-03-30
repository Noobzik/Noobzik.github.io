# Bases de Windows

## Architecture de base d'un système d'exploitation Windows

*gestionnaire de fichiers, gestionnaire de tâches, gestionnaire de mémoire, etc*

Un système d'exploitation (OS) est un logiciel qui gère les ressources d'un ordinateur et offre un interface pour que les utilisateurs puissent interagir avec ces ressources. Un système d'exploitation Windows est un type de système d'exploitation développé par Microsoft et utilisé sur de nombreux ordinateurs personnels et professionnels.

Voici les principaux éléments de base d'un système d'exploitation Windows :

*  **Gestionnaire de fichiers** : c'est l'outil qui permet de naviguer dans l'arborescence des fichiers et des dossiers sur le disque dur de l'ordinateur. Il permet également de créer, de copier, de déplacer et de supprimer des fichiers et des dossiers. On l'appelle plus couramment l'Explorateur Windows.

*  **Gestionnaire de tâches** : c'est l'outil qui permet de gérer les programmes et les processus en cours d'exécution sur l'ordinateur. Il permet de lancer de nouveaux programmes, de terminer ceux qui sont en cours d'exécution et de surveiller l'utilisation des ressources de l'ordinateur (processeur, mémoire, disque dur, etc.).

*  **Gestionnaire de mémoire** : c'est l'outil qui gère l'utilisation de la mémoire vive (RAM) de l'ordinateur. Il charge les programmes et les données nécessaires en mémoire lorsqu'ils sont utilisés et libère de la mémoire lorsqu'ils ne le sont plus. Il est totalement transparent pour l'utilisateur. Il est souvent connu pour les écrans bleus, et le diagnostique de mémoire au démarrage.

*  **Gestionnaire de périphériques** : c'est l'outil qui permet de gérer les périphériques connectés à l'ordinateur (imprimantes, scanner, disques durs externes, etc.). Il permet d'installer, de mettre à jour et de désinstaller les pilotes (logiciels de gestion des périphériques) nécessaires pour faire fonctionner ces périphériques.

*  **Gestionnaire de sécurité** : c'est l'outil qui permet de gérer les comptes d'utilisateurs et les stratégies de sécurité de l'ordinateur (mot de passe, pare-feu, etc.). Il permet également de protéger l'ordinateur contre les virus et les logiciels malveillants. On appelle plus couramment Windows Defender.

!!! note "Activity"
    Prenez une capture d'écran pour chacune des gestionnaire cités et envoyez les moi.

Ces éléments de base sont généralement accessibles via l'interface utilisateur du système d'exploitation, qui peut être différente selon les versions de Windows.

### Gestion des fichiers et des dossiers dans Windows

*(création, copie, déplacement, suppression, etc.)*

Dans un système d'exploitation Windows, les fichiers et les dossiers sont organisés en arborescence sur le disque dur de l'ordinateur. Chaque fichier et chaque dossier appartient à une structure hiérarchique qui commence à la racine (C:\ par exemple) et qui se développe en branches et en sous-branches.

Voici comment gérer les fichiers et les dossiers dans Windows :

*   **Création** : pour créer un nouveau fichier ou un nouveau dossier, il suffit de cliquer avec le bouton droit de la souris sur le dossier parent dans lequel on souhaite créer le nouveau fichier ou le nouveau dossier, puis de sélectionner "Nouveau" et "Fichier" ou "Dossier" dans le menu contextuel. On peut également utiliser les raccourcis clavier "Ctrl + Maj + N" pour créer un nouveau dossier.

*  **Copie** : pour copier un fichier ou un dossier, il suffit de sélectionner le fichier ou le dossier à copier, puis de cliquer avec le bouton droit de la souris et de sélectionner "Copier" dans le menu contextuel. On peut également utiliser le raccourci clavier "Ctrl + C" pour copier un fichier ou un dossier. Pour coller la copie dans un autre dossier, il suffit de sélectionner ce dossier, puis de cliquer avec le bouton droit de la souris et de sélectionner "Coller" dans le menu contextuel. On peut également utiliser le raccourci clavier "Ctrl + V" pour coller un fichier ou un dossier.

*  **Déplacement** : pour déplacer un fichier ou un dossier, il suffit de suivre les mêmes étapes que pour la copie, mais en sélectionnant "Couper" au lieu de "Copier" dans le menu contextuel. Le fichier ou le dossier sera alors supprimé de son emplacement d'origine et collé à l'emplacement cible. On peut également utiliser le raccourci clavier "Ctrl + X" pour couper, et "Ctrl + V" pour coller.

*  **Suppression** : pour supprimer définitivement un fichier ou un dossier, il suffit de sélectionner le fichier ou le dossier à supprimer, puis de cliquer avec le bouton droit de la souris et de sélectionner "Supprimer" dans le menu contextuel. On peut également utiliser le raccourci clavier "Suppr" pour supprimer un fichier ou un dossier. Les fichiers et dossiers supprimés sont généralement envoyés dans la corbeille avant d'être définitivement supprimés. Cela permet de récupérer des fichiers ou des dossiers supprimés par erreur en les restaurant depuis la corbeille. Pour vider définitivement la corbeille, il suffit de cliquer avec le bouton droit de la souris sur l'icône de la corbeille et de sélectionner "Vider la corbeille" dans le menu contextuel. Il est également possible de supprimer des fichiers ou des dossiers sans passer par la corbeille en utilisant la commande "Shift + Suppr" au lieu de "Suppr". Cette commande permet de supprimer directement et définitivement les fichiers et dossiers sélectionnés. Il est important de faire attention lors de la suppression de fichiers et de dossiers, car cette opération est irréversible et ne peut pas être annulée. Il est donc recommandé de faire une sauvegarde régulière de ses fichiers et de se assurer qu'on ne supprime pas par erreur des fichiers ou des dossiers importants.

*  **Renommer** : On peut renommer un fichier ou un dossier, il suffit de sélectionner le fichier ou le dossier, puis faire un clic droit de la souris et sélectionner "Renommer" dans le menu contextuel. On peut également utiliser un raccourci clavier en utilisant la commande "F2".


### Gestion des programmes et des processus dans Windows

*(lancement, terminaison, gestion des ressources, etc..)*

Un programme est un ensemble d'instructions exécutées par l'ordinateur pour réaliser une tâche spécifique. Un processus est l'instance d'un programme en cours d'exécution sur l'ordinateur.

Voici comment gérer les programmes et les processus dans Windows :

*    Lancement : il y a plusieurs manières de lancer un programme dans Windows :
    *    Double-cliquer sur l'icône du programme sur le bureau ou dans le menu Démarrer.
    *    Cliquer avec le bouton droit de la souris sur l'icône du programme et sélectionner "Ouvrir" dans le menu contextuel.
    *    Taper le nom du programme dans la barre de recherche du menu Démarrer et sélectionner le programme dans les résultats de recherche.
    *    Utiliser la commande "Exécuter" (Windows + R) et taper le chemin d'accès au programme dans la boîte de dialogue qui s'ouvre.

*    Terminaison : pour terminer un programme ou un processus en cours d'exécution, il suffit de le sélectionner dans la liste des programmes ouverts (en cliquant sur l'icône de la barre des tâches ou en utilisant les raccourcis clavier "Alt + Tab"), puis de cliquer sur le bouton "Fermer" ou sur le bouton "Croix rouge" de la fenêtre du programme. On peut également utiliser le gestionnaire de tâches (taper "gestionnaire de tâches" dans la barre de recherche du menu Démarrer) pour terminer un programme ou un processus en sélectionnant le programme ou le processus dans la liste des tâches et en cliquant sur le bouton "Fin de tâche".

*    Gestion des ressources : il est possible de surveiller l'utilisation des ressources de l'ordinateur (processeur, mémoire, disque dur, etc.) par les programmes et les processus en cours d'exécution en utilisant le gestionnaire de tâches. Cet outil permet de voir quels programmes et processus utilisent le plus de ressources et de terminer ceux qui sont trop gourmands en ressources pour améliorer les performances de l'ordinateur.

Il est important de faire attention lors de la terminaison de programmes et de processus, car cette opération peut entraîner la perte de données non enregistrées ou la corruption de fichiers. Il est donc recommandé de sauvegarder régulièrement ses fichiers et de ne pas terminer les programmes et les processus essentiels au fonctionnement de l'ordinateur.

### Gestion de la sécurité dans Windows

*(comptes d'utilisateurs, stratégies de groupe, pare-feu, etc)*

La sécurité de l'ordinateur est importante pour protéger les données et les programmes contre les logiciels malveillants et les intrusions non autorisées. Windows propose plusieurs outils pour gérer la sécurité de l'ordinateur.

Voici comment gérer la sécurité dans Windows :

    Comptes d'utilisateurs : Windows permet de créer plusieurs comptes d'utilisateurs avec des niveaux de privilèges différents. Un compte administrateur a accès à toutes les fonctionnalités et les paramètres de l'ordinateur, tandis qu'un compte standard ne peut accéder qu'à certaines fonctionnalités et paramètres. Il est recommandé de créer un compte standard pour effectuer la plupart des tâches courantes et de n'utiliser le compte administrateur que pour les tâches nécessitant des privilèges spéciaux.

    Les stratégies de groupe sont des paramètres de sécurité qui permettent de définir les règles et les restrictions appliquées à un groupe d'utilisateurs ou d'ordinateurs dans un domaine ou un travail de groupe. Elles sont généralement utilisées par les administrateurs réseau pour gérer de manière centralisée la sécurité de l'ensemble des ordinateurs de l'entreprise.


Les comptes d'utilisateurs permettent de protéger les données et les programmes de l'ordinateur en limitant l'accès aux fonctionnalités et aux paramètres de l'ordinateur. Il est recommandé de créer un compte d'utilisateur pour chaque personne utilisant l'ordinateur et de définir des mots de passe sécurisés pour chaque compte.

Voici comment gérer les comptes d'utilisateurs dans Windows :

*    Création : pour créer un nouveau compte d'utilisateur dans Windows, il faut suivre les étapes suivantes :
    *    Ouvrir le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer).
    *    Cliquer sur "Comptes d'utilisateurs" dans la section "Comptes utilisateurs et famille".
    *    Cliquer sur "Gérer les comptes d'utilisateurs" dans la section "Utilisateurs".
    *    Cliquer sur "Ajouter un compte d'utilisateur".
    *    Suivre les instructions de l'assistant d'installation qui s'ouvre pour créer le nouveau compte d'utilisateur.

*    Modification : pour modifier les paramètres d'un compte d'utilisateur existant dans Windows, il faut suivre les étapes suivantes :
    *    Ouvrir le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer).
    *    Cliquer sur "Comptes d'utilisateurs" dans la section "Comptes utilisateurs et famille".
    *    Cliquer sur "Gérer les comptes d'utilisateurs" dans la section "Utilisateurs".
    *    Sélectionner le compte d'utilisateur à modifier dans la liste des comptes.
    *    Cliquer sur "Modifier le compte" pour changer le nom, le mot de passe, l'image du compte, etc.
*    Suppression : pour supprimer un compte d'utilisateur inutilisé dans Windows, il faut suivre les étapes suivantes :
    *    Ouvrir le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer).
    *    Cliquer sur "Comptes d'utilisateurs" dans la section "Comptes utilisateurs et famille".
    *    Cliquer sur "Gérer les comptes d'utilisateurs" dans la section "Utilisateurs".
    *    Sélectionner le compte d'utilisateur à supprimer dans la liste des comptes.
    *    Cliquer sur "Supprimer le compte".
    *    Sélectionner "Supprimer les fichiers du compte" si l'on souhaite effacer tous les fichiers du compte d'utilisateur.
    *    Cliquer sur "Supprimer le compte" pour confirmer la suppression.

Il est important de faire attention lors de la suppression de comptes d'utilisateurs, car cette opération entraîne la perte de tous les fichiers et les paramètres associés au compte. Il est donc recommandé de sauvegarder les fichiers importants avant de supprimer un compte d'utilisateur.

Pour configurer les **stratégies de groupe** sur un ordinateur Windows, il faut ouvrir l'éditeur de stratégies de groupe (taper "stratégies de groupe" dans la barre de recherche du menu Démarrer) et suivre les étapes suivantes :

1.    Sélectionner le niveau de stratégies de groupe à configurer (ordinateur ou utilisateur).
2.    Créer un nouveau modèle de stratégies de groupe ou modifier un modèle existant.
3.    Définir les paramètres de sécurité souhaités dans les différentes catégories proposées (par exemple : comptes d'utilisateurs, pare-feu, etc.).
4.    Enregistrer et appliquer les modifications.

Les stratégies de groupe permettent de configurer de nombreux paramètres de sécurité de Windows, tels que :

*    Les comptes d'utilisateurs et les mots de passe (expiration, longueur minimale, etc.).
*    Les privilèges des utilisateurs (accès aux dossiers partagés, aux imprimantes, aux paramètres de l'ordinateur, etc.).
*    Les stratégies de mots de passe (historique, complexité, etc.).
*    Le pare-feu (règles d'accès entrant et sortant, protocoles autorisés, etc.).
*    La sécurité des données (chiffrement, verrouillage de l'écran, etc.).

Le pare-feu de Windows est un logiciel de sécurité qui protège l'ordinateur contre les attaques provenant de l'internet ou du réseau local. Il filtre les connexions entrantes et sortantes et bloque les connexions non autorisées.

Voici comment gérer le pare-feu de Windows :

*    Activation/désactivation : pour activer ou désactiver le pare-feu de Windows, il faut suivre les étapes suivantes :
    *    Ouvrir le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer).
    *    Cliquer sur "Pare-feu Windows" dans la section "Sécurité et maintenance".
    *    Cliquer sur "Activer ou désactiver le pare-feu Windows" dans la section "Pare-feu".
    *    Sélectionner "Activer le pare-feu Windows" ou "Désactiver le pare-feu Windows" selon les besoins.

*    Configuration : pour configurer les règles du pare-feu de Windows, il faut suivre les étapes suivantes :
    *    Ouvrir le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer).
    *    Cliquer sur "Pare-feu Windows" dans la section "Sécurité et maintenance".
    *    Cliquer sur "Modifier les paramètres avancés" dans la section "Pare-feu".
    *    Sélectionner les règles d'accès entrant et sortant souhaitées dans les différentes catégories proposées (par exemple : réseaux privés, réseaux publics, etc.).

Le pare-feu de Windows peut être configuré pour autoriser ou bloquer les connexions selon différents critères, tels que le protocole de communication, l'adresse IP, le port, etc. Il est recommandé de ne pas désactiver le pare-feu de Windows, sauf si cela est nécessaire pour des raisons précises et sous la surveillance d'un administrateur réseau compétent.

## Introduction aux fonctionnalités avancées de Windows : 

*(virtualisation, gestion de l'alimentation, outils de ligne de commande, etc.)*

Windows est un système d'exploitation complet qui propose de nombreuses fonctionnalités avancées pour les utilisateurs expérimentés. Voici quelques exemples de fonctionnalités avancées proposées par Windows :

*    **Virtualisation** : la virtualisation permet de créer des machines virtuelles sur l'ordinateur, c'est-à-dire des environnements logiciels indépendants qui fonctionnent comme des ordinateurs virtuels. Cette fonctionnalité est utile pour tester des systèmes d'exploitation différents, exécuter des applications incompatibles ou isoler des programmes dangereux. Windows propose un logiciel de virtualisation intégré appelé Hyper-V qui permet de créer et de gérer des machines virtuelles.

 *   **Gestion de l'alimentation** : la gestion de l'alimentation permet de contrôler l'économie d'énergie de l'ordinateur et de mettre en veille ou en hibernation l'ordinateur lorsqu'il n'est pas utilisé. Windows propose plusieurs paramètres de gestion de l'alimentation qui peuvent être configurés dans le panneau de configuration (taper "panneau de configuration" dans la barre de recherche du menu Démarrer, puis cliquer sur "Système" dans la section "Matériel et audio").

*    **Outils de ligne de commande** : la ligne de commande est un interface en mode texte qui permet de saisir des commandes pour exécuter des programmes et des tâches de manière plus rapide et plus précise. Windows propose plusieurs outils de ligne de commande intégrés, tels que CMD, PowerShell, WSL, etc. Ces outils sont particulièrement utiles pour les administrateurs système et les développeurs.

Beneficiary: Rakib Sheikh
IBAN: FR76 2823 3000 0101 7299 7687 685
BIC: REVOFRP2