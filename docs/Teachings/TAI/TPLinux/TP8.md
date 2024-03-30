# TP08 : LDAP

## 1. Présentation

### 1.1.   Définition

LDAP *(Lightweight Directory Acces Protocol)* est un protocole réseau pour gérer des annuaires. Le *serveur LDAP* contient un annuaire et les *clients LDAP* peuvent interroger le serveur pour récupérer les informations contenues dans l’annuaire. Dans le contexte informatique, l’annuaire ne contient pas nécessairement des numéros de téléphones ou des adresses mais plutôt des noms de comptes informatique (`uid`), avec les mots de passe associés. On peut donc interroger l’annuaire pour vérifier qu’un couple (`login, password`) existe bien et que la personne en question a donc le droit de se connecter. Comme l’annuaire est centralisé (sur le serveur), ce système permet à plusieurs clients (ordinateurs) de partager les mêmes comptes informatiques.

Un annuaire LDAP est représenté sous la forme d’un arbre. On peut ainsi regrouper dans différentes branches de l’arbre les différentes informations similaires (par exemple, tous les étudiants sont dans une même branche, tous les enseignants sont dans une autre branches,... ) Un tel arbre est représenté ci-dessous.

``` mermaid
graph TD
    A(arbre LDAP) --- B(utilisateurs);
    A --- C(groupes);
    B --- D(toto);
    B --- F(titi);
    C --- H(groupe 1);
    C --- I(groupe 2);
```

### 1.2. Arborescence

Chaque noeud de l’arbre correspond à un objet (une entrée) de l’annuaire. Il est défini par sa position dans l’arbre ainsi que par ce qu’il représente. Autrement dit, le nom de chaque objet est associé à un attribut qui explique de quelle catégorie d’objets il s’agit : il ne faut pas confondre un utilisateur et un groupe !

En annexe (à la fin du sujet), on trouvera une liste (non exhaustive) d’attributs LDAP ainsi que leur description. Nous y reviendrons.

Il faut donc préciser pour chacun des nœuds de notre arbre à quelle catégorie il appartient. Par exemple, nous pouvons choisir :
*   pour la racine de l’arbre, l’attribut dc (*Domain Component*);
*   pour l’ensemble des utilisateurs et des groupes, l’attribut ou (*Organizationnal Unit*);
*   pour chaque utilisateur, l’attribut uid et pour chaque groupe, l’attribut `gid`.

On obtient ainsi l’arbre suivant.

``` mermaid
graph TD
    A(dc=arbre LDAP) --- B(ou=utilisateurs);
    A --- C(ou=groupes);
    B --- D(uid=toto);
    B --- F(uid=titi);
    C --- H(gid=groupe 1);
    C --- I(gid=groupe 2);
```



### 1.3.  Nom distingué

Pour pouvoir retrouver sans ambiguïté un nœud de l’arbre, il faut donner à chacun à un nom unique. 

Pour plus de commodité dans la recherche, ce nom unique correspond en fait au chemin à parcourir dans
l’arbre pour retrouver l’objet. Ceci a deux avantages :

1. retrouver un objet à partir de son nom est très facile puisque le chemin pour y arriver est indiqué dans le nom (et ceci même si l’arbre est très grand, par exemple avec le millier de comptes
informatiques de l’institut Galilée) ;
2. deux objets peuvent avoir le même nom pourvu qu’ils ne soient pas côte à côte dans l’arbre (par exemple, on peut avoir à la fois un groupe et un utilisateur toto).

Ce nom unique s’appelle DN (*Distinguished Name*, nom distingué (au sens mathématique du terme)). Il est exprimé en partant de l’objet et en remontant jusqu’à la racine de l’arbre. Par exemple, avec l’arbre précédent, l’utilisateur toto a pour DN :

```
uid=toto,ou=utilisateurs,dc=arbre_LDAP
```

!!! note
    Notez au passage qu’on précise l’attribut à chaque étape et que les différentes étapes sont séparées par des virgules.)

### 1.4. Attributs

En plus de son DN, chaque objet peut avoir plusieurs autres attributs. Typiquement, pour un utilisateur on peut avoir envie de préciser le (vrai) nom de l’utilisateur, mais surtout son mot de passe ou son répertoire personnel (HOME). Ceci est fait en donnant une valeur aux attributs correspondants.

L’annexe A donne une liste (non exhaustive) d’attributs LDAP existant ainsi que leur signification.
On peut remarquer que les attributs les plus courant ont des noms abrégés (cn, ou,... ) tandis que les moins courant ont des noms très longs.

Un des attributs est un peu particulier. Il s’agit de l’attribut objectClass qui précise à quelle catégorie d’objets appartient le nœud de l’arbre en question. Les catégories d’objets peuvent être des individus (personnes), des pays, des comptes informatiques,... Un même objet peut appartenir à plusieurs catégories.

À chaque catégorie d’objets est associée un ou plusieurs attributs qu’il est nécessaire de fournir.
Par exemple, pour un individu on est obligé de préciser quel est son nom de famille (sn) ainsi que son nom courant (`cn`, prénom ou surnom ou nom complet). L’annexe B donne une liste (non exhaustive) de catégories d’objets ainsi que les attributs nécessaires associés à chacun.

## 2.  Mise en place matérielle

### 2.1 Mise en place des machines virtuelles debian

*   Ouvrir `virtualbox`. 
*   Aller dans les Paramètres, Réseau et ajouter un réseau. (On peut laisser les paramètre par défaut)
*   Placer 3 ordinateurs sous debian avec les noms suivants: serveur, `m1` et `m2`. (Si vous avez la nouvelle version de debian, il suffit de cloner)
*   Aller dans la configuration de la VM, Réseau et dans mode d'accès réseau, sélectionnez Réseau NAT, puis NatNetwork dans le nom. (A faire pour tout les machines)
*   Configurer les cartes réseaux ainsi que les fichiers `/etc/hosts` de manière à ce que les machines se connaissent par leur nom.
*   Donner tout de suite un mot de passe à root sur chacune des trois machines (À l’aide de la commande `passwd`), ca sera utile plus tard en cas de problèmes ...

### 2.2. Préparation du client

Nous allons installer les paquets clients du LDAP afin de pouvoir utiliser les commandes en lien avec LDAP

```title="Dans le terminal"
# aptitude install ldap-utils libnss-ldapd -y
```

### 2.3. Préparation du serveur

Pareil, mais les programmes utiles pour l'utilisation pour serveur:

```title="Dans le terminal"
# DEBIAN_FRONTEND=noninteractive aptitude -yq install slapd
```

## 3.  Configuration du serveur

!!! warning
    Dans les versions récentes d’OpenLDAP (supérieures à la version 2.4), la configuration n’est plus stockée dans un fichier de configuration plat, mais réside directement dans la base de données elle-même, au sein d’une DIT spécifique. C’est la fonctionnalité OLC (On-Line Configuration), également connue sous le nom de cn=config.
    
    Cette approche consistant à stocker « en ligne » la configuration du serveur pourrait paraître complexe mais elle a été rendue nécessaire pour les gros serveurs d’annuaire, dont les redémarrages à chaque modification de configuration nécessitaient des temps d’arrêt trop longs.
    
    La documentation sur Internet n'est pas toujours à jour sur ce point de vue.

Sur `serveur`, il faut configurer le serveur LDAP puis créer et remplir la base de données (l’arbre).
Dans le cadre du TP, nous nous contenterons d’une base de données extrêmement simplifiée, correspondant à l’arbre suivant :

``` mermaid
graph TD
    A(dc=toto,dc=fr) --- B(uid=user1);
    A --- C(uid=user2);
```

Bien sûr, certains attributs sont manquants dans cet arbre (par exemple, les `cn` des utilisateurs) et il faudra les renseigner dans la base. N’hésitez pas à revenir voir cet arbre quand on remplira la base dans la suite du TP.

### 3.1. Configuration du serveur LDAP

#### 3.1.1. Configuration

La méthode classique pour éditer un fichier ne fonctionnera pas malheureusement. Nous allons devoir faire appel à des installations guidés.
Mais avant tout de chose, nous devons configurer le fichier suivant :

``` title="/etc/ldap/ldap.conf"
BASE dc=toto,dc=fr
URI ldap://ldap.toto.fr ldap://ldap.toto.fr:666
```

Ensuite nous devons reconfigurer le service `slapd` avec la ligne de commande suivante :

``` terminal
# dpkg-reconfigure slapd
```

Lorsque le programme vous pose la question d'omettre la configuration, répondez non. Puis renseignez les informations suivantes:

```
Domaine : toto.fr
Organisation: toto
Base de donnée : hdb
```

Puisque dans le fichier `ldap.conf` on a précisé un url vers `toto.fr`, il faut modifier le fichier `hosts` pour l'inclure

```title="/etc/hosts"
127.0.0.1 localhist ldap.toto.fr
10.0.0.254 serveur ldap.toto.fr
```

Nous sommes prêt à redémarrer le service slapd, et on peut vérifier la configuration.
Pour cela, je vous demande de chercher comment utiliser la commande `ldapsearch` pour vérifier la configuration avec et sans mot de passe. A partir de ce qui est affiché, quels sont les DN de l'objet racine et de l'administrateur ?

#### 3.1.2. Configurer les logs

Avant de continuer, on doit activer les messages d'erreur dans le dossier `/var/log/slapd.log`. Pour cela, on doit créer un fichier `/etc/rsyslog.d/slapd.conf` et ajouter les lignes suivantes :

```title="sldapd.log"
# Enrengistrer les logs LDAP
local.4$ /var/log/sldapd.log
```

Il ne reste plus qu'à redémarrer le service qui va éditer les logs :
``` log
$ service rsyslog restart
```

Maintenant, dès qu'il y a un problème, il faudra penser à aller voir le fichier `/var/log/sldapd.log` pour voir ce qui pose problème.


#### 3.1.3. Premier test

Nous allons maintenant pouvoir faire un premier test du serveur. Pour faire une recherche dans la base de données, on utilise la commande `ldapsearch`. Quand on ne précise pas ce qu’on cherche, on se retrouve avec tout le contenu de la base (qui est pour l’instant vide). Regarder le manuel de `ldapsearch`, nous aurons besoin de préciser les options suivantes :

*   Ne pas utiliser l’authentification par SASL.
*   Préciser le nom de la base dans laquelle faire la recherche ("dc=toto,dc=fr" les guillemets sont nécessaires pour que le terminal ne fasse pas n’importe quoi avec les virgules).

L’ordinateur doit afficher une série de résultats précisant qu’il n’y a aucun élément dans la base.

#### 3.1.4. Avec mot de passe

Nous allons maintenant tester le mot de passe de l’administrateur de la base. Regarder le manuel de `ldapsearch` et rajouter aux options précédentes les options nécessaires pour préciser qu’on veut se connecter en tant qu’administrateur de la base (préciser l’identifiant de connexion) et qu’on doit fournir le mot de passe.

Le résultat obtenu doit être le même. En cas de problème, voir l’annexe C qui explique quelques astuces pour essayer de corriger l’erreur.

### 3.2. Création de l’annuaire

#### 3.2.1. Racine de l’annuaire

Pour remplir l’annuaire, on utilise des fichiers au format `ldif` (*LDAP Data Interchange Format*).
Regarder le manuel de `ldif`. Comme on peut le constater, il s’agit simplement d’un fichier texte dans lequel chaque ligne comporte un attribut et la valeur associée à cet attribut. Bien évidemment, seul l’attribut dn est obligatoire (sans DN, pas moyen de savoir où ranger l’objet dans la base).

Maintenant, on doit créer notre racine de l'annuaire. Mais lorsque vous allez tapper la commande `ldapsearch -x`, vous allez voir que nous avons déjà une rentré pour la racine avec le résultat suivant:

``` title="Résultat du terminal"
# extended LDIF
#
# LDAPv3
# base <dc=toto,dc=fr> (default) with scope subtree
# filter: (objectclass=*)
# requesting: ALL
#

# toto.fr
dn: dc=toto,dc=fr
objectClass: top
objectClass: dcObject
objectClass: organization
o: nodomain
dc: toto

# admin, toto.fr
dn: cn=admin,dc=toto,dc=fr
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
description: LDAP administrator

# search result
search: 2
result: 0 Success

# numResponses: 3
# numEntries: 2
```


Utiliser `ldapsearch` pour vérifier que la base a bien été remplie (on doit maintenant voir apparaître un objet dans les résultats de la commande).


!!! note
    On peut utiliser `/` pour faire une recherche dans une page de manuel.

#### 3.2.2 Utilisateurs

Nous allons ici faire une base de données très simple : Uniquement une racine et directement en dessous deux utilisateurs. En cas d’erreurs lors des ajouts dans la base, on pourra utiliser `ldapdelete` pour supprimer une entrée de la base (et recommencer).

Créer un fichier `users.ldif` dans lequel on déclarera deux utilisateurs : `user1` et `user2` (sauter une ligne entre les deux blocs de déclarations pour plus de lisibilité, mettre le DN en première ligne de chaque bloc).
Les utilisateurs sont à la fois des individus (`person`) et des comptes informatiques (`posixAccount`).

Déclarer les `objectClass` correspondants ainsi que les attributs nécessaires à ces catégories.

!!! warning "Attention !"
    Bien qu’il ne soit pas nécessaire, il faut aussi définir l’attribut userPassword pour que chaque utilisateur ait un mot de passe et puisse se connecter !

Pour remplir la base de données, il faut ensuite utiliser la commande `ldapadd`. Ceci ne peut bien évidemment être fait que par l’administrateur de la base. Regarder le manuel de `ldapadd` pour savoir comment remplir la base à partir d’un fichier. Préciser là aussi qu’on ne veut pas d’authentification par SASL et qu’on doit se connecter en tant qu’administrateur (note : les options communes sont les mêmes que pour `ldapsearch`).

!!! note
    pour ldapadd, on n’a pas besoin de préciser le nom de la base (pas de -b) puisqu’il est contenu dans le DN des objets à rajouter !

*   Utiliser `ldapadd` pour rajouter les utilisateurs à la base.
*   Utiliser `ldapsearch` pour vérifier que les ajouts ont bien eu lieu. Comparer les résultats selon qu’on est ou non connecté à la base en tant qu’administrateur.

## 4.  Configuration des clients

Nous allons maintenant configurer les machines clients (`m1` et `m2`). La configuration de chaque machine est identique. Aussi, on peut commencer par en configurer une seule pour bien repérer les étapes nécessaires. En cas de gros problème lors de la configuration 3 on peut abandonner une machine et se contenter de configurer la deuxième...

!!! warning "Important" 
    Si vous n’avez pas encore mis de mot de passe à root, faites le immédiatement avant de continuer. Sans mot de passe, il ne sera plus possible de se connecter en temps que root une fois LDAP mis en place...

### 4.1. Client LDAP

La configuration du client LDAP se trouve dans le fichier `/etc/ldap/ldap.conf`. Consulter le manuel du fichier et éditer le fichier. Il suffit de préciser deux informations : le nom du serveur et la base de données à consulter. Il s’agit des options host et BASE (ne pas oublier de décommenter les lignes correspondantes).

!!! note "Remarque"
     *   en théorie (d’après le manuel), on devrait utiliser l’URI plutôt que host. En pratique j’ai constaté des problèmes avec l’URI et moins avec host...
     *   en théorie on peut utiliser soit le nom du serveur, soit son adresse IP. En pratique il semblerait que le nom marche mieux que l’adresse IP...

Tester ensuite la configuration en faisant une recherche dans la base (sans authentification SASL).
Cette fois, on n’a pas besoin de préciser la base de données dans laquelle effectuer la recherche (pas de -b) puisqu’elle est indiquée dans le fichier de configuration.

### 4.2. nsswitch

!!! warning
     Cette partie n'est plus fonctionnel sur marionnet, et il est en cours de réécriture pour une utilisation sous virtualbox.

Le fichier `/etc/nsswitch.conf` (*Name Server Switch*) indique où et comment trouver un certain nombre de services. Regarder son manuel et éditer le fichier.
Ici, nous devons préciser que les services correspondant à l’authentification sont obtenus via LDAP. Il s’agit non seulement des mots de passe, mais aussi du fichier shadow et des groupes d’utilisateurs.
Dans la configuration de base, ces trois services sont en mode compat, c’est-à-dire que, par compatibilité avec l’ancien système, on va utiliser les fichiers `/etc/passwd`, `/etc/shadow` et `/etc/groups`.

Modifier les trois lignes en question pour indiquer que ces services peuvent aussi être obtenus via LDAP.

!!! note "Remarque"
    Il faut rajouter la possibilité de faire du LDAP mais ne pas supprimer la compatibilité. En effet, certains comptes (par exemple root) ne sont pas partagés (et ne doivent pas l’être à priori) et on accède donc toujours à leurs informations via le fichier `/etc/passwd`.

Il faut maintenant configurer l’interaction entre nsswitch et LDAP. Ceci est fait au moyen du fichier `/etc/libnss-ldap.conf`. éditer ce fichier pour indiquer les bonnes options :
*   Le nom de la base de données.
*   Le nom du serveur. Attention ! Utiliser plutôt host que URI (et commenter cette ligne). Utiliser impérativement le nom de machine (serveur) et pas son IP.
*   Le nom de l’administrateur de la base. Attention ! Il faut aussi préciser le mot de passe de l’administrateur de la base. Regarder dans le commentaire juste avant la définition du rootdn comment faire pour préciser le mot de passe. Le fichier contenant le mot de passe doit être en “mode” 600, il s’agit des permissions lecture/écriture/. . . (utiliser chmod).

Relancer le démon `nscd`.

### 4.3. PAM

PAM (*Plugable Authentification Module*) gère les différentes manières de s’identifier.

Tout d’abord, commençons par l’interaction entre PAM et LDAP. Elle est configurée dans le fichier `/etc/pam_ldap.conf`. Les modification à y effectuer sont les mêmes que pour `/etc/libnss-ldap.conf`.

!!! warning "Attention" 
    Il faut aussi faire la même manipulation pour le mot de passe administrateur, mais le fichier n’est plus le même !

Le reste de la configuration de PAM se fait dans le répertoire `/etc/pam.d/`. Ce répertoire contient de nombreux fichiers. Nous allons faire le minimum de modifications en se contenant d’indiquer les changements à effectuer pour la gestion des comptes (account) et de l’authentification (mots de passes, auth).

Regarder, sur la machine réelle, les fichiers :

```title= "Chemin des fichiers"
/etc/pam.d/common-auth
/etc/pam.d/common-account
```

Recopier ces deux fichiers sur la machine virtuelle, dans le répertoire `/etc/pam.d/` (en remplacement des fichiers déjà existant).

!!! note "Remarque"
    Cette configuration minimale ne permet pas, entre autres, aux utilisateurs de changer leur mots de passe.

### 4.4. Et c’est parti !

Se déconnecter (en tant que root) du client et essayer de se reconnecter en tant que user1 (ou user2. Normalement, ça devrait marcher... En cas de problèmes, regarder les logs (voir l’annexe C).

!!! note
    Pour l’instant, les répertoires personnels des utilisateurs n’existent pas.

!!! note "Remarque"
    Il faut normalement recommencer la configuration sur le deuxième client. Faire la partie suivante (ajout d’un troisième utilisateur) et ne configurer `m2` qu’au moment de la mise en place de NFS à la fin du TP.

### 4.5. Un de plus

Sur le serveur, créer un fichier `ldif` pour rajouter un troisième utilisateur (et utiliser `ldapadd` pour l’ajouter dans la base). Sur les clients (`m1` et `m2`), on peut maintenant utiliser ce compte sans rien avoir à changer à la configuration !

Autrement dit, la configuration de PAM et NSS est délicate au début mais n’est à faire qu’une fois pour toutes. Ensuite, l’ajout d’utilisateurs se fait uniquement sur le serveur (pas besoin de faire `adduser` sur chaque client). Quand il y a beaucoup de clients (par exemple, les 150 machines libre service de la fac), on imagine bien le temps gagné...

## 5. Et un peu de NFS pour finir

Sur serveur, créer des répertoires personnels pour chaque utilisateur (à l’emplacement que vous avez indiqué dans les fichiers `ldif` !) Exporter ces répertoires par NFS vers `m1` et `m2`. 

!!! note "Remarque"
    Si les répertoires sont biens groupés (par exemple, tous dans `/home/`), on peut exporter d’un coup /home/ plutôt que d’exporter individuellement chaque répertoire... C’est pour cette raison que les répertoires personnels à la fac ont un chemin bizarre (on ne va pas exporter individuellement 1000 répertoires !)

Donner (chown) à chaque utilisateur son répertoire.

Sur `m1` et `m2`, montez les répertoires personnels aux bons endroits (ce doit être les mêmes puisqu’ils sont indiqués dans la base de données !) 

!!! note "Remarque"
    Utiliser mount (normalement il faut modifier la fstab mais l’arrêt et le redémarrage des machines est parfois capricieux).

Sur `m1`, connectez-vous en tant qu’user1. Créer un fichier dans le répertoire personnel. Sur `m2`, connectez-vous en tant qu’user1. Que contient le répertoire personnel ? 

##   6. Ce qu’il faut retenir

Vous devez connaître l’existence :
*   de la manière de configurer LDAP et des fichiers associés.
*   de la notion d’arbres LDAP, d’attributs, de classes d’objets.