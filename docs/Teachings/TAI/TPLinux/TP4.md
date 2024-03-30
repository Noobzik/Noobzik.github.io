# TP4 : NFS

Le but de ce TP est de mettre en place un NFS (Network File System) qui permet à un ordinateur d’accéder au disque dur d’un autre.

!!! warning "Attention"
    Attention ! il y a souvent une erreur `RPC error: Program not registered` au moment du montage (à la partie 1.3.2), il faut arrêter le démon `bind`, redémarrer le démon qui gère le serveur NFS puis démarrer le démon `bind`. Par sécurité, il vaut mieux le faire sur toutes les machines...

!!! warning "Attention"
    Attention ! il y a souvent une erreur `Requested NFS version or transport portocol is not supported` au moment du montage (à la partie 1.3.2), il faut arrêter le démon `rpcbind`, redémarrer le démon qui gère le serveur NFS `service nfs-common restart` puis démarrer le démon `service rpcbind start`.

## 1 Les bases

### 1.1.  Mise en place initiale

Ouvrir un nouveau projet. Mettre deux ordinateurs et les connecter à l’aide d’un câble. Démarrer les ordinateurs. Modifier les fichiers `/etc/network/interfaces` de manière à assigner une adresse IP statique à chaque machine. Modifier les fichiers `/etc/hosts` de manière à ce que chacun connaisse l’autre.

!!! note "Remarque"
    En vrai, il faudrait bien sûr mettre en place un serveur DNS. Dans le cadre de ce TP, on se contentera de la version simplifiée.

Activer les interfaces réseau et vérifier (à l’aide de ping) que le réseau fonctionne correctement.

### 1.2. Exporter un répertoire

Sur la première machine, il faut exporter un répertoire pour qu’il soit accessible depuis l’autre machine.
La liste des répertoires à exporter se trouve dans le fichier `/etc/exports`. Regarder le contenu de ce fichier (utiliser `cat` ou `less`, pas besoin d’utiliser un éditeur de texte et de risquer de modifier le fichier par erreur). Il contient juste quelques exemples un peu obscurs ainsi qu’une référence au manuel...

Regarder le manuel de exports. En particulier :

-    Le deuxième paragraphe qui décrit le format général du fichier (et de chaque ligne).
-    La section “`Machine Name Formats`” qui explique comment peuvent être donné les noms des machines autorisées à accéder au répertoire exporté. Quel format faudra-t-il utiliser pour l’instant ?
-    La section “`General Options`”. Quelle option faudra-t-il utiliser pour autoriser la machine distante à écrire dans le répertoire exporté ?
-    La section “`EXAMPLE`” qui contient en quelques lignes un résumé de la syntaxe du fichier.

Comme on peut le voir, il faut préciser sur chaque ligne d’une part le répertoire qui doit être exporté et d’autre part la ou les machines qui ont le droit d’y accéder, suivie d’une liste d’options entre parenthèses.

* Créer un répertoire `/toto` sur `m1`. Y placer un fichier `toto.txt` contenant le texte “Ce fichier se trouve physiquement sur `m1`.” Faites bien attention de créer un dossier à la racine `/` et non dans le chemin actuel.
* Modifier le fichier `/etc/exports` de manière à autoriser `m2` à accéder au répertoire et à écrire dedans. 
* Rajouter l’option `no_subtree_check` pour éviter les warning intempestifs par la suite...

Pour que les changements soient pris en compte, il faut relancer le démon NFS (ou lui faire recharger sa configuration). Mais avant de faire ça, il faut s'assurer que le démon `rpcbind` soit actif. Pour cela, on utilise soit la commande `service rpcbind start`, soit `/etc/init.d/rpcbind start` Le programme de gestion du démon se trouve à l’endroit habituel (au même endroit que `bind` de la semaine dernière) et il s’agit de la gestion du serveur NFS (lister les programmes de ce répertoire pour trouver le bon). 

Relancer (restart) ou recharger la configuration (reload) du démon NFS serveur (à vous de trouver le nom).

Utiliser la commande `exportfs` pour vérifier que le répertoire est bien exporté vers `m2`.

Le résultat attendu est le suivant:
```
/toto m2
```

### 1.3.  Monter le répertoire

Pour que `m2` puisse accéder à un répertoire distant,il faut le monter sur `m2`. Le mécanisme de montage est le mécanisme général avec lequel Linux accède à toutes ses informations, que ce soit les disques durs (locaux ou distants), les CD/DVD, les clés USB, ... Aussi nous allons passer un peu de temps à le
détailler...

#### 1.3.1 Montage de périphériques physiques

!!! warning "Remarque"
    Cette partie du TP nécessite que vous utilisez Linux comme système d'exploitation. Mais il se peut que vous l'avez en tant que machine virtuel. Dans ce cas, vous pouvez soit sauter cette partie, soit le lire sans réaliser les actions demandés.

Sous Windows, lorsqu’on rajoute un nouveau périphérique de stockage (disque dur, CD, clé USB, ...), le système lui attribue un nouveau lecteur,identifié par une lettre (généralement C:, D: pour les disques durs, A: pour les disquettes, ...)

Sous Linux, les périphériques ne sont pas rattachés au niveau le plus haut de l’arborescence de répertoires mais peuvent être rattachés à n’importe quel niveau.il faut donc spécifier au système à la fois un périphérique et un point de montage, c’est-à-dire un répertoire où sera rattaché le périphérique en question.

La commande pour monter un périphérique s’appelle mount. Regarder son manuel. En particulier le deuxième paragraphe qui indique la syntaxe la plus courante d’utilisation de la commande et la section “`FILES`” à la fin qui indique les fichiers de configuration associés à mount. On pourra aussi survoler la
liste d’arguments que peut prendre l’option `-t` (i.e. la liste des types de système de fichiers qui sont gérés) ainsi que les options spécifiques à chaque type de système de fichiers (“`FILESYSTEM SPECIFIC MOUNT OPTIONS`”). 

* Y a-t-il des noms de type de système de fichiers qui vous disent quelque chose ?
* Quel est le système de fichier d’un CD ?

!!! note "Remarque"
    La section “`FILES`” du manuel parle du fichier `/etc/filesystems` qui n’existe pas sur les machines Marionnet. Une lecture attentive de la description de l’option `-t` permettra de trouver par quel fichier il est remplacé et de voir ainsi la liste des systèmes de fichiers utilisable sur ces ordinateurs (on pourra aussi regarder le manuel de `filesystems` pour une rapide description des plus courants).

Les deux premiers fichiers de la section “`FILES`” du manuel sont ceux sur lesquels nous allons nous concentrer maintenant. La machine virtuelle étant, par nature, un peu bizarre au niveau des périphériques, nous allons les regarder sur la machine réelle. Le deuxième de ces fichiers contient la table de tous les périphériques qui sont actuellement montés sur la machine.

Regarder ce fichier sur la machine réelle 2. Chaque ligne contient un nom de périphérique, le nom du point de montage et une liste d’options de montage. 

Regarder en particulier :

-  Les lignes qui commencent par `/dev/sd` et qui indiquent les disques durs `SCSI` (la lettre indique ensuite le numéro du disque et le chiffre le numéro de la partition, ainsi `/dev/sdb3` correspond à la troisième partition du deuxième disque SCSI).
- Les lignes commençant par `/dev/hd` indiquent les disques durs iDE 3.
- Les lignes dont le nom de fichier contient ’`:`’indiquent des disques distants montés par NFS. On y trouve notamment les comptes utilisateurs.

Insérer une clé USB ou un CD dans l’ordinateur. Normalement, le montage a lieu automatiquement (grâce au démon `hald` (Hardware Abstraction Layer )). Regarder de nouveau le fichier `/etc/mtab` et constater le changement. Retirer la clé/le CD. Regarder de nouveau le fichier.
Regarder maintenant (toujours sur la machine réelle) le fichier `/etc/fstab` qui contient la liste des système de fichiers qui peuvent être monté. La syntaxe est globalement similaire. On retrouve les différentes partitions du disque dur ainsi que la possibilité de montage pour CD ou clé USB.

### 1.3.2. Montage de disque réseau

!!! warning
    En cas d’erreur `RPC error: Program not registered`, voir la procédure à suivre en début de TP.

Nous allons maintenant pouvoir monter sur `m2` le disque réseau exporté par `m1` (enfin !)
Il faut tout d’abord créer sur `m2` un point de montage, c’est-à-dire un répertoire où sera monté le disque. Créer un répertoire `/titi` sur `m2`.

Ensuite, on doit s'assurer que le `rpcbind`soit actif, donc on va tapper la commande `service rpcbind restart`.

Et enfin, utiliser `mount` pour monter le disque. Re-regarder le manuel pour retrouver (deuxième paragraphe) la syntaxe de la commande. Le type de système de fichiers sera, bien sûr, nfs. 

Le répertoire de montage sera `/titi`. Pour le périphérique (device),il faut signaler qu’il se trouve sur m1 et indiquer le chemin sur place. Comme dans les fichiers `fstab` ou `mtab`, on indique ça à l’aide de la syntaxe :
`machine:chemin`

* Monter le répertoire `/toto` de `m1` sur `m2` (dans le répertoire `/titi`).
* Aller dans le répertoire. 
* Vérifier que le fichier `toto.txt` s’y trouve bien et qu’il s’agit bien de celui créé précédemment (regarder son contenu).

!!! note "Remarque"
    Par la suite, nous utiliserons cette syntaxe pour spécifier des répertoires particuliers sur des machines particulières. Ainsi, on écrira `m2:/titi` comme forme abrégée de “le répertoire `/titi` sur la machine `m2`”.

* Essayer de modifier son contenu. Pour des raisons de sécurité, root n’a pas le droit de modifier les répertoires NFS. Nous y reviendrons.

* Démonter le répertoire à l’aide de la commande `umount` (regarder le manuel, en particulier le premier paragraphe, en cas de doutes sur la syntaxe). 

!!! note
    Avez-vous penser à quitter le répertoire avant de le démonter ?

#### 1.3.3 Monter et démonter, c’est toujours travailler

Aller dans `m2:/titi`. Créer un fichier toto.txt contenant le texte “Ce fichier se trouve physiquement sur `m2`.” Revenir à la racine. Remonter `m1:/toto` comme précédemment. Regarder le contenu de `m2:/titi`. Que constate-t-on ? Démonter le répertoire. Que constate-t-on ?

### 1.4 Montage au démarrage

Bien évidemment, cette méthode ne permet pas un accès pérenne au répertoire car il faut le remonter à chaque fois et en particulier à chaque démarrage.
éditer le fichier `m2:/etc/fstab`.

En s’inspirant du fichier sur la machine réelle, ajouter une ligne pour monter le répertoire distant `m1:/toto` au point de montage `/titi` (seuls ces deux paramètres sont à changer par rapport aux lignes correspondant à des montages NFS sur la machine réelle).

Regarder dans le manuel de mount l’option `-a`. L’utiliser et vérifier que le répertoire est bien monté (donc que la syntaxe est correcte...)

Arrêter et redémarrer `m2` (uniquement). Le répertoire a-t-il été monté automatiquement au démarrage ?

Remarque : il faut bien évidemment que m1 soit déjà allumée quand m2 est démarrée pour que le montage puisse avoir lieu... 

Si les deux machines sont démarrées simultanément, rien n’est garanti quant à l’ordre réel dans lequel les opérations vont avoir lieu et des problèmes peuvent surgir.

## 2. Lecture et écriture

### 2.1. Pour un utilisateur

À l’aide de la commande `adduser`:

* Créer un utilisateur toto sur chacune des deux machines. 
* Créer un répertoire `m1:/export_toto`. 
* À l’aide de `chown`, donner ce répertoire à l’utilisateur `toto`. 
* Exporter ce répertoire par NFS. 
* Vérifier que depuis m2 l’utilisateur toto parvient bien à lire ce répertoire et à écrire dedans. 
* Regarder les propriétaires du répertoire et des fichiers se trouvant dedans vu depuis chaque machine.

### 2.2. Pour root

Par défaut, lorsqu’un répertoire est exporté par NFS est monté par `root`, l’écriture est impossible. En effet, `root` n’est pas forcément la même personne sur chaque machine ! Si on autorise l’accès en écriture au root d’une autre machine, on lui donne ainsi la possibilité de modifier les fichiers de configuration du système et on ouvre une faille de sécurité.

Par exemple, le serveur de fichiers du Sercal permet à toutes les machines ayant obtenues une adresse par DHCP de monter les disques utilisateurs (les $HOME de tout le monde). Si quelqu’un se connecte avec un portable (ne jamais brancher de portable sur les machines de la fac, ̧ca perturbe gravement le réseau), il peut obtenir une adresse par DHCP et monter ainsi les répertoires de tout le monde. Il est bien évidemment facile d’être root sur son portable et si on autorisait root à faire ce qu’il veut via ce montage, il serait alors facile de ”pirater” tous les comptes de la fac !

* Lire dans le manuel de exports la section “User ID Mapping” vers la fin.
* Créer et exporter un répertoire de telle sorte que root puisse écrire dedans. 
* Créer et exporter un répertoire de telle sorte que personne (ni root, ni toto) ne puisse écrire dedans. 
* Vérifier qu’ils se comportent comme ils doivent.

## 2.3 Pour plusieurs utilisateurs

* Sur `m1`, créer un utilisateur tata puis un utilisateur titi. 
* Sur `m2`, créer un utilisateur titi puis un utilisateur tata (attention à l’ordre !)
* Sur `m1`, créer et exporter un répertoire appartenant à titi. 
* Que se passe-t-il sur `m2` ? Avez-vous une idée de la raison de ce phénomène ? (explications... au prochain TP)

## 3 Ce qu’il faut retenir

Vous devez connaître :

* le concept de NFS et les fichiers associés.
* la commande mount et la manière de monter un disque NFS

Vous devez connaître l’existence :
* de la notion de types de systèmes de fichiers, éventuellement des noms de quelques uns de ces types.
* des fichiers `/etc/fstab` et `/etc/mtab`.
* de la commande `adduser` (nous y reviendrons).