# Prise en main de powershell 

Étant donnée que Windows est principalement sur interface graphique, il est possible que vous êtes confronté à du débogage à distance. Si jamais vous n'avez pas assez de bande passante, il est possible de passer en interface contextuel comme nous l'avons vu sur les TP de prise en main Linux.

Windows a connu deux types de terminal :

*    L'invite de commande (qui est un ancêtre)
*    PowerShell, le nouveau terminal que nous allons utiliser.

!!! warning "Attention"
     Il est important de noter que PowerShell n'est pas installé par défaut. Il faut l'installer séparément ! Ceci est du à la lenteur de Microsoft à réaliser la transition.

## 1. Premiers pas

### 1.0.1. Présentation de l'environnement de PowerShell :


L'environnement de PowerShell est une interface utilisateur de ligne de commande qui vous permet d'exécuter des commandes et de gérer des objets dans votre système d'exploitation. Il comprend plusieurs éléments importants qui vous aideront à naviguer et à utiliser efficacement l'environnement.

La fenêtre de commande est l'endroit où vous saisissez et exécutez des commandes PowerShell. Il affiche également les résultats de vos commandes et les messages d'erreur. La fenêtre de commande peut être redimensionnée et déplacée à votre convenance.

La barre d'outils contient des boutons pour les tâches courantes, comme ouvrir une nouvelle fenêtre de commande, enregistrer un script ou imprimer les résultats de la commande. La barre d'outils peut également être personnalisée pour ajouter des boutons pour des commandes spécifiques.

Le menu contextuel est accessible en cliquant avec le bouton droit de la souris sur la fenêtre de commande. Il contient des options pour les tâches courantes, comme copier, coller et annuler. Il contient également des options pour personnaliser l'interface utilisateur de PowerShell.

Les onglets permettent de naviguer entre plusieurs fenêtres de commande ouvertes. Cela permet de travailler sur plusieurs commandes ou projets simultanément sans avoir à ouvrir plusieurs fenêtres de commande. Il est également possible de déplacer les onglets dans l'ordre qui convient le mieux pour votre travail.

En résumé, l'environnement de PowerShell comprend la fenêtre de commande pour saisir et exécuter des commandes, une barre d'outils pour les tâches courantes, un menu contextuel pour les options courantes et les onglets pour naviguer entre plusieurs fenêtres de commande. Ces éléments de l'interface utilisateur de PowerShell vous permettront de naviguer et de travailler efficacement dans l'environnement.


### 1.0.2. L'historique des commandes :

L'historique des commandes dans PowerShell est une fonctionnalité qui permet de conserver l'historique des commandes saisies dans la fenêtre de commande. Cela permet de faciliter la saisie de commandes répétitives ou de naviguer facilement dans les commandes que vous avez saisies précédemment.

Pour naviguer dans l'historique des commandes, vous pouvez utiliser les touches fléchées haut et bas. Cela vous permettra de parcourir les commandes que vous avez saisies précédemment, dans l'ordre chronologique inverse. Vous pouvez également utiliser la touche Ctrl + R pour rechercher dans l'historique des commandes en saisissant un mot clé ou une partie d'une commande.

Pour réexécuter une commande de l'historique, il suffit de naviguer jusqu'à cette commande à l'aide des touches fléchées haut et bas et de la sélectionner en appuyant sur Entrée. Il est également possible de réexécuter une commande en utilisant la touche flèche vers le haut pour naviguer jusqu'à la commande dans l'historique, puis en appuyant sur Entrée pour l'exécuter.

Il est important de noter que l'historique des commandes est sauvegardé uniquement pour la session en cours. Si vous fermez la fenêtre de commande ou si vous vous déconnectez de votre ordinateur, l'historique des commandes sera perdu. Il existe des méthodes pour sauvegarder l'historique des commandes pour une utilisation ultérieure, mais cela dépasse le cadre de cette introduction.


### 1.0.3. La saisie semi-automatique

La saisie semi-automatique des commandes dans PowerShell est une fonctionnalité qui vous aide à saisir des commandes en vous suggérant des options de complétion pour les mots clés et les paramètres. Cela peut vous faire économiser du temps et réduire les erreurs de saisie.

Pour utiliser la saisie semi-automatique des commandes, il suffit de commencer à saisir une commande dans la fenêtre de commande. Lorsque vous tapez un mot clé ou un paramètre, PowerShell vous proposera des options de complétion en fonction des commandes disponibles. Vous pouvez utiliser la touche Tab pour naviguer dans les options de complétion et sélectionner l'option souhaitée.

Il est également possible de naviguer dans les options de complétion en utilisant les touches fléchées haut et bas. Cela vous permettra de parcourir les options disponibles et de sélectionner l'option souhaitée en appuyant sur Entrée.

Il est important de noter que la saisie semi-automatique des commandes ne fonctionne pas uniquement pour les commandes, mais aussi pour les chemins de fichiers, les noms d'utilisateur, les noms d'ordinateurs, etc. Cela permet de faciliter la saisie des informations nécessaires pour exécuter une commande.

Il est également possible de personnaliser les options de complétion en utilisant les paramètres de saisie semi-automatique de PowerShell. Cela vous permet de définir les options de complétion par défaut pour les commandes spécifiques ou de créer des options de complétion personnalisées pour les commandes que vous utilisez fréquemment.

En résumé, la saisie semi-automatique des commandes dans PowerShell est une fonctionnalité qui vous aide à saisir des commandes en vous suggérant des options de complétion pour les mots clés et les paramètres. Elle permet de naviguer dans les commandes disponibles, d'afficher les options de complétion et de sélectionner une option de complétion. Il est également possible de personnaliser les options de complétion pour les commandes spécifiques ou pour les commandes fréquemment utilisées.

### 1.0.4. La coloration syntaxique

La coloration syntaxique dans PowerShell est une fonctionnalité qui permet de mettre en surbrillance les différents éléments d'une commande ou d'un script, tels que les mots clés, les variables, les commentaires, etc. Cela permet de rendre le code plus lisible et de faciliter la détection des erreurs.

Pour personnaliser les couleurs et les styles utilisés pour la coloration syntaxique, vous pouvez utiliser les paramètres de l'interface utilisateur de PowerShell. Il est possible de changer la couleur et le style des différents éléments, comme les mots clés, les variables, les commentaires, etc. Il est également possible de créer des thèmes de coloration syntaxique personnalisés pour s'adapter à vos préférences.

Il est possible de créer des modèles de coloration syntaxique pour des scripts ou des languages spécifiques en utilisant les fonctionnalités de PowerShell. Cela permet de créer des modèles de coloration syntaxique pour des scripts en Python, en Java, etc. Il est également possible de créer des modèles de coloration syntaxique pour des scripts de configuration de réseau, de serveur, etc.

Pour appliquer un modèle de coloration syntaxique à un script, il suffit de sélectionner le modèle dans les paramètres de l'interface utilisateur de PowerShell ou en utilisant une commande spécifique. Cela permet de rendre le script plus lisible et de faciliter la détection des erreurs.

En résumé :
- La coloration syntaxique dans PowerShell est une fonctionnalité qui permet de mettre en surbrillance les différents éléments d'une commande ou d'un script, comme les mots clés, les variables, les commentaires, etc. Cela permet de rendre le code plus lisible et de faciliter la détection des erreurs. 
- Il est possible de personnaliser les couleurs et les styles utilisés pour la coloration syntaxique en utilisant les paramètres de l'interface utilisateur de PowerShell. 
- Il est également possible de créer des modèles de coloration syntaxique pour des scripts ou des languages spécifiques en utilisant les fonctionnalités de PowerShell, et de les appliquer à des scripts pour les rendre plus lisibles et faciliter la détection des erreurs.

La suite de ce TP peut être réalisé sur un Windows classique, donc pas besoin d'utiliser Windows Server. En revanche, vous devez produire un rapport de ce TP qui décrit l'ensemble de vos réponses au questions posés.


### 1.1. Début du TP : Le terminal

Cliquez sur le menu démarrer, puis tapez PowerShell.

Un terminal s'ouvre alors : (Insérer image)

Avant de vraiment apprendre les premiers commandes, il est important de noter qu'il n'existe pas de man (manuel) des commandes. En générale, si vous souhaitez avoir de l'aide :

```title="Dans le terminal"
[Nom de commande] -help
```

### 1.2. Un éditeur de texte

Nous aurons rapidement besoin d’un éditeur de texte, par exemple pour prendre des notes, ouvrir un fichier ou écrire un programme. Il existe de nombreux éditeurs de texte dont les fonctionnalités et la facilité d’utilisation varient  ́énormément. Voici quelques exemples, parmi les plus connus et les plus utilisés :

*   notepad: C'est un éditeur par défaut de Windows. C'est celui qui est utilisé pour ouvrir un fichier de texte txt. Il est simple mais peu performant pour les tâches de l'informatique en générale. Il a l'avantage d'être installé par défaut par rapport aux autres.
*   Visual Code : C'est éditeur de texte édité par Microsoft principalement pour la communauté des développeurs (et pas seulement). Il a pour avantage d'être gratuit et possède des extensions pour écrire plus facilement un fichier de configuration ou bien même des fichiers à ligne de codes !
*   NotePad++: C'est un des éditeurs les plus utilisés avant l'apparition de Visual Code. Il a l'avantage d'être performant, et très rapide à ouvrir n'importe quel type de fichier. Il a la particularité d'être uniquement disponible sur Windows.
*   SublimeText: C'est un des éditeurs de texte les plus utilisé, mais qui a la particularité d'être payant. Il est généralement apprécié par les développeurs web. D'ailleurs, sa couleur d'interface est iconic dans le monde entier, elle s'appelle "Monokai"

Malheureusement, il n'existe pas de programme pour éditer un fichier de texte directement dans le terminal.

### 1.3. Les raccourcis les plus courantes

Les raccourcis clavier sont une méthode efficace pour naviguer et utiliser l'environnement de PowerShell. Voici quelques raccourcis clavier couramment utilisés dans PowerShell.

#### 1.3.1. La touche tabulation

La touche de tabulation est un outil magique dans un terminal. Elle permet de compléter automatiquement les commandes ou les chemins que vous tapez au clavier, ce qui vous fera gagner énormément de temps et évitera de trop user vos doigts ou de faire des fautes de frappe dans les noms de fichiers compliqués que vous manipulerez par la suite. Il est important de prendre l'habitude de l'utiliser.

#### 1.3.2 La touche "flèche haut" et "flèche bas"

Comme à l'image de Linux, il est possible de parcourir l'historique des commandes utilisés.

#### 1.3.3. Crtl + R

La touche Ctrl + R permet de rechercher dans l'historique des commandes.

### 1.4. Différentes commandes

#### 1.4.1. Généralités

Cette section vous introduit les commandes qui peuvent vous être utile, quelque-soit le type de finalité.

##### 1.4.1.1. Get-Command

Cette commande permet de lister la liste des commandes disponible sur PowerShell.

!!! note "Question"
    Quel est le résultat de cette commande?

##### 1.4.1.2. Get-Help

Affiche de l'aide pour une commande spécifique.

!!! note "Question"
     *  Comment utilise-t-on cette commande?
     *  Quel est le résultat de cette commande avec l'exemple "Get-Service"?

##### 1.4.1.3. Get-ComputerInfo

Affiche des informations détaillées sur un ordinateur.

#### 1.4.2. Commandes courantes sur la gestion des tâches

Cette section vous présente un ensemble de commande qui sont courantes sur la gestion des tâches. On connaissant ces commande, vous pouvez limite vous en passer du gestionnaire de tâches.

##### 1.4.2.1. Get-Service

Cette commande permet d'afficher tous les services qui sont soit :

- stoppés.
- en cours d'exécution
- en cours de démarrage

sur un ordinateur.

!!! note "Question"
    Quel est le résultat de cette commande?
    Quels sont les colonnes affichés?

##### 1 1.4.2.2. Start-Service

Démarre un service.

##### 1.4.2.3. Stop-Service

Arrête un service

##### 1.4.2.4. Restart-Service

Redémarre un service

##### 1.4.2.5. Set-Service

Modifie les propriétés d'un service.


##### 1.4.2.6. Get-Process

Cette commande permet d'afficher tous les processus en cours d'exécution sur un ordinateur.

!!! note "Question"
    Donner la signification de tout les colonnes

#### 1.4.3. Manipulation de fichiers

Voici les 4 commandes les plus utilisés pour la gestion des fichiers. Il n'y pas de question pour les quatres, mais vous aurez droit à une activité dirigé pour vous entrainer.

##### 1.4.3.1. New-Item

Crée un nouvel objet (fichier, dossier, clé de registre, etc.).

##### 1.4.3.2. Remove-Item

Supprime un objet existant (fichier, dossier, clé de registre, etc.).

##### 1.4.3.3. Copy-Item

Copie un objet existant (fichier, dossier, etc.).

##### 1.4.3.4. Move-Item

Déplace un objet existant (fichier, dossier, etc.).

!!! note "Activité dirigé"
    1. Créez un fichier `test.txt`
    2. Dans le fichier `test.txt` : Ajouter du texte au hasard.
    3. Créez un dossier "`dossier1`"
    4. Déplacer le fichier `test.txt` dans le dossier1
    5. Trouvez la commande pour lister le contenu du `dossier1` et vérifiez que le fichier a bien été bien déplacé.
    6. Copier/Coller le fichier test.txt sans se déplacer, dans le même dossier. Le fichier collé doit s'appeler `test1.txt`
    7. Supprimez le fichier `test.txt` toujours sans se déplacer.
    8. Supprimez le dossier `dossier1`.

### 1.5. Personnalisation de la coloration syntaxique

!!! note "Activité autonomie"
    Ouvrez les paramètres de l'interface utilisateur de PowerShell et modifiez les couleurs et les styles utilisés pour la coloration syntaxique. Créez un script simple et utilisez le modèle de coloration syntaxique que vous avez créé pour le rendre plus lisible.

## 2. Concept de base du PowerShell

* Les cmdlets : Les cmdlets (acronyme pour Command-lets) sont des commandes de base de PowerShell qui permettent d'exécuter des tâches spécifiques. Les cmdlets sont généralement formatés avec un verbe et un nom, par exemple : `Get-Process` ou `Set-Service`. Il existe des milliers de cmdlets disponibles dans PowerShell, qui permettent de gérer des tâches telles que la gestion des processus, des services, des utilisateurs, des groupes, des fichiers, etc.

* Les scripts : Les scripts sont des séries de commandes PowerShell qui sont exécutées en séquence pour accomplir une tâche spécifique. Les scripts peuvent être créés en utilisant un éditeur de texte et enregistrés avec l'extension `.ps1`.

* Les modules : Les modules sont des collections de cmdlets, de scripts et de définitions de fonctions qui peuvent être chargés dans PowerShell pour étendre ses fonctionnalités. Les modules peuvent être téléchargés à partir de la communauté PowerShell ou créés par l'utilisateur.

* Les objets : Les objets sont les résultats de l'exécution d'une cmdlet ou d'un script. Les objets peuvent avoir des propriétés et des méthodes qui peuvent être utilisées pour manipuler les données.

* Les propriétés et les paramètres : Les propriétés décrivent les caractéristiques d'un objet, tandis que les paramètres sont utilisés pour configurer une cmdlet ou un script. Les propriétés et les paramètres peuvent être utilisés pour filtrer et formater les résultats.

* Les pipelines : Les pipelines permettent de connecter les cmdlets ensemble pour créer des workflows de traitement de données. Les objets sortant d'une cmdlet sont envoyés à la cmdlet suivante dans le pipeline pour être traités.

* Les alias : Les alias sont des noms courts pour les cmdlets ou les scripts. Cela permet de raccourcir les commandes ou de les rendre plus facile à retenir. Par exemple, "ls" est un alias pour la cmdlet `Get-ChildItem` qui permet de lister les fichiers et dossiers dans un répertoire.

* Les variables : Les variables sont des conteneurs pour stocker des valeurs. Les variables peuvent être utilisées pour stocker des résultats de commandes, des paramètres de configuration, etc. Les variables sont définies en utilisant le signe `$` suivi du nom de la variable.

* Les fonctions : Les fonctions sont des blocs de code qui peuvent être réutilisés dans plusieurs scripts. Les fonctions peuvent prendre des paramètres d'entrée et retourner des résultats. Les fonctions peuvent être définies en utilisant le mot-clé "function" suivi du nom de la fonction.

* Les scripts de démarrage : Les scripts de démarrage sont des scripts qui sont automatiquement exécutés lorsque PowerShell démarre. Ces scripts peuvent être utilisés pour configurer les paramètres de PowerShell, charger des modules, définir des alias, etc.

* Les règles de nommage : Les règles de nommage définissent comment nommer les objets, les variables, les fonctions, les scripts, etc. dans PowerShell. Il est important de suivre ces règles pour maintenir une structure de nommage claire et facile à comprendre.

### 2.1 Suite du TP

#### 2.1.1. Créations des alias.

Nous avons commencé à apprendre les commandes Linux en début de formation et vous avez remarqué qu'à travers le déroulement de ce TP, les commandes PowerShell sont longues à taper. Cela nous donne un bon exercice d'utiliser les alias afin de ne pas perdre nos marques.

!!! note "Activité"
     Créer des alias de l'ensemble des commandes que nous avons vu.

#### 2.1.2. Variables

Il se peut que vous avez une longue commande à taper plusieurs fois.

!!! note "Activité"
     1.  Ouvrez une fenêtre de commande PowerShell.
     2.  Créez une variable en utilisant le signe `$` suivi du nom de la variable. Par exemple, pour créer une variable appelée "nom", tapez : `$nom = "John Doe"`
     3.  Utilisez la variable en la faisant précéder du signe `$`. Par exemple, pour afficher la valeur de la variable "nom", tapez : `Write-Host $nom`
     4.  Modifiez la valeur de la variable en lui donnant une nouvelle valeur. Par exemple, pour changer la valeur de la variable "nom" en "Jane Smith", tapez : `$nom = "Jane Smith"`
     5.  Utilisez des variables pour stocker les résultats de commandes. Par exemple, pour stocker les résultats de la commande "Get-Process" dans une variable appelée "processes", tapez : `$processes = Get-Process`
     6.  Utilisez les propriétés des objets stockés dans des variables pour filtrer les résultats. Par exemple, pour afficher le nom des processus qui utilisent plus de 50 Mo de mémoire, tapez : `$processes | Where-Object {$_.WorkingSet -gt 50000000} | Select-Object -Property Name`
     7.  Utilisez des variables pour configurer les paramètres de commandes. Par exemple, pour créer un nouveau dossier nommé "nouveau_dossier" avec la commande "New-Item", tapez : 
     ```
     $folder = "nouveau_dossier"
     New-Item -ItemType Directory -Path $folder
     ```
     8.  Utilisez des variables pour stocker des valeurs de configuration, comme des chemins de répertoires ou des paramètres de connexion à une base de données. Par exemple, pour stocker un chemin de répertoire dans une variable appelée "chemin_repertoire", tapez : `$chemin_repertoire = "C:\Users\Documents"`
     9.  Utilisez des variables pour automatiser des tâches répétitives en créant des scripts. Par exemple, pour créer un script qui copie tous les fichiers d'un répertoire dans un autre, vous pouvez utiliser des variables pour stocker les chemins de répertoire de source et de destination.
     10.  Sauvegardez votre script pour pouvoir l'utiliser ultérieurement. Utilisez l'extension .ps1 pour sauvegarder votre fichier

#### 2.1.3. Pipelines

!!! note "Activité"
    1. Ouvrez une fenêtre de commande PowerShell.
    2. Utilisez la cmdlet "Get-Service" pour lister tous les services en cours d'exécution sur votre ordinateur. Par exemple, tapez : Get-Service
    3. Utilisez la cmdlet "Where-Object" pour filtrer les services en fonction de leur statut. Par exemple, pour afficher uniquement les services en cours d'exécution, tapez : Get-Service | Where-Object {$_.Status -eq "Running"}
    4. Utilisez la cmdlet "Sort-Object" pour trier les services en fonction d'une propriété spécifique. Par exemple, pour trier les services par ordre alphabétique, tapez : Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object Name
    5. Utilisez la cmdlet "Select-Object" pour sélectionner les propriétés spécifiques d'un objet. Par exemple, pour afficher uniquement le nom et le statut des services en cours d'exécution, tapez : Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name, Status
    6. Utilisez la cmdlet "Export-Csv" pour exporter les résultats dans un fichier CSV. Par exemple, pour exporter les résultats dans un fichier nommé "services.csv", tapez : Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name, Status | Export-Csv -Path "services.csv" -NoTypeInformation

#### 2.1.4. Fonctions

!!! note "Activité"
     1. Ouvrez une fenêtre de commande PowerShell.
     2. Créez une fonction en utilisant le mot-clé "function" suivi du nom de la fonction. Par exemple, pour créer une fonction appelée "Get-RunningServices", tapez :
     ```
     function Get-RunningServices {
        Get-Service | Where-Object {$_.Status -eq "Running"}
     }
     ```
     3. Utilisez la fonction en tapant son nom. Par exemple, pour utiliser la fonction "Get-RunningServices", tapez : Get-RunningServices
     4. Ajoutez des paramètres à la fonction pour la rendre plus flexible. Par exemple, pour ajouter un paramètre pour filtrer les services par nom, modifiez la fonction pour ressembler à ceci :
     ```
     function Get-RunningServices {
        param(
            [string]$Name
        )
        Get-Service | Where-Object {$_.Status -eq "Running" -and $_.Name -like "*$Name*"}
     }
     ```
     5. Utilisez les paramètres pour filtrer les résultats. Par exemple, pour utiliser la fonction "Get-RunningServices" pour afficher uniquement les services en cours d'exécution dont le nom contient "SQL", tapez : `Get-RunningServices -Name "SQL"`.
     6. Utilisez des variables pour stocker les résultats de la fonction. Par exemple, pour stocker les résultats de la fonction "Get-RunningServices" dans une variable appelée "services", tapez : `$services = Get-RunningServices -Name "SQL"`.
     7. Utilisez les propriétés des objets stockés dans des variables pour filtrer les résultats. Par exemple, pour afficher le nom des processus qui utilisent plus de 50 Mo de mémoire, tapez : `$services | Where-Object {$_.WorkingSet -gt 50000000} | Select-Object -Property Name`.
     8. Utilisez des fonctions pour automatiser des tâches répétitives en créant des scripts. Par exemple, pour créer un script qui envoie un rapport d'utilisation de la mémoire pour tous les services en cours d'exécution, vous pouvez utiliser une fonction pour collecter les données et un autre pour envoyer un email avec les informations collectées.
     9. Sauvegardez votre script pour pouvoir l'utiliser ultérieurement. Utilisez l'extension `.ps1` pour sauvegarder votre fichier.

#### 2.1.5. Règles de l'art

Les règles de l'art du nommage dans PowerShell visent à maintenir une structure de nommage claire et facile à comprendre pour les objets tels que les variables, les fonctions, les scripts, les alias, etc. Voici quelques règles de base pour le nommage des objets dans PowerShell :

*  Utilisez des lettres minuscules pour les noms d'objets. PowerShell est sensible à la casse, mais la plupart des conventions de nommage utilisent des lettres minuscules pour les noms d'objets.
*  Utilisez des tirets du bas pour séparer les mots dans les noms d'objets. Les tirets du bas sont utilisés pour séparer les mots dans les noms d'objets pour les rendre plus lisibles. Par exemple, "get-service" au lieu de "getservice"
*  Utilisez des noms de propriétés qui décrivent clairement leur fonction. Les noms de propriétés doivent être décrire clairement leur fonction pour faciliter la compréhension de leur utilisation.
*  Évitez d'utiliser des abréviations ou des acronymes dans les noms d'objets, sauf s'ils sont couramment utilisés et compris. Les abréviations et les acronymes peuvent rendre les noms d'objets difficiles à comprendre pour les utilisateurs qui ne sont pas familiers avec eux.
*  Évitez d'utiliser des caractères spéciaux, sauf pour les tirets du bas. Les caractères spéciaux peuvent rendre les noms d'objets difficiles à lire et à utiliser.
*  Utilisez des noms de fonctions qui décrivent clairement ce qu'elles font. Les noms de fonctions doivent décrire clairement ce qu'elles font pour faciliter la compréhension de leur utilisation.
*  Utilisez des préfixes pour les types d'objets. Par exemple, utilisez "Get-" pour les cmdlets de récupération, "Set-" pour les cmdlets de configuration, "New-" pour les cmdlets de création, etc.
*  Utilisez des suffixes pour les types de retour. Par exemple, utilisez "-Path" pour les chemins de fichiers, "-Name" pour les noms de fichiers, "-Count" pour les nombres, etc.

#### 2.1.6. Et pour finir, un script pour mettre à jour Windows.
!!! note "Activité"
    