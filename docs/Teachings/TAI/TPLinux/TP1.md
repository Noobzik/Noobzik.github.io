# Travaux Pratique 1 : Bases des commandes Linux

## 1. Premier pas

1. Ouvrir son premier terminal

* Ouvrir d’abord une session Linux Gnome (se connecter sur l’ordinateur). 
* Ensuite, ouvrir un terminal unix (menu Applications/Accessoires/Terminal). Si ce n’est pas déjà fait, prévoir de faire un raccourci vers Terminal (sur le bureau ou dans le tableau de bord). 

Toute application Linux peut être lancée depuis un terminal à partir du moment où on connaît son nom exact (attention à la casse !), y compris un terminal gnome! Preuve : Entrer `gnome-terminal` dans le terminal pour ouvrir un autre terminal (fermer ensuite ce terminal (utiliser le raccourci clavier ++Ctrl+D++)).


2. Un éditeur de texte

Nous aurons rapidement besoin d’un éditeur de texte, par exemple pour prendre des notes, ouvrir un fichier ou  écrire un programme. Il existe de nombreux  ́éditeurs de texte dont les fonctionnalités et la facilité d’utilisation varient  ́énormément. Voici quelques exemples, parmi les plus connus et les plus utilisés :

* `gedit` : éditeur par défaut de Gnome. C’est celui qui est utilisé quand on ouvre un fichier texte. Il est simple mais peu performant pour les tâches de programmation (coloration syntaxique, indentation, . . . ) Ca vaut le coup de passer à un éditeur plus évolué et de profiter de vos études pour en apprendre les fonctionnalités
* `kwrite` : éditeur de l’environnement KDE, `kwrite` est simple et intuitif. De plus, il a quelques fonctionnalités très appréciables ;
* `nano` : un éditeur petit et pratique. Il fonctionne directement dans le terminal, ce qui sera très utile pour la suite. Nous reviendrons sur nano dans le TP suivant ;
* èmacs` : un éditeur qui dispose d’un ensemble extensible de fonctionnalités et est très populaire parmi les programmeurs. Cet éditeur a une longévité impressionante ! (sa première version date de 1975 !) mais il pourra vite décourager le débutant. Pour les fans inconditionnels, il peut aussi être lancé dans le terminal avec emacs -nw (“no window”) ;
* vi(m) : vi date de la même époque qu’emacs et est lui aussi très utilisé par les programmeurs (vim (Vi IMproved) est la version améliorée de vi). Cet éditeur est peut-être encore plus déroutant qu’emacs pour le débutant.

Essayer quelques éditeurs avant d’en choisir un ! L’important est d’être à l’aise et de vite se familiariser avec les raccourcis clavier de l’éditeur. Pour une prise en main rapide, nous conseillons `gedit` (et nano à partir du prochain TP) qui est assez riche et dont l’utilisation est assez simple. Pour ceux qui veulent passer un peu plus de temps à apprendre à utiliser un éditeur de texte, `emacs` et `vim` sont des outils très performant dont l’apprentissage sera rentabilisé à terme (y compris dans tous les autres cours d’informatique...)

3. L’esperluette ou ≪ et commercial ≫

Lancer un éditeur à partir du terminal (par exemple, `gedit`). Que se passe-t-il dans le terminal ? Essayer d’ouvrir un nouvel éditeur à partir du même terminal.
Fermer l’éditeur puis entrer : `gedit &` dans le terminal. L’esperluette (&) permet de lancer une application en tâche de fond et de laisser la main sur le terminal à l’utilisateur. Entrer de nouveau `gedit &` dans le terminal pour ouvrir un deuxième éditeur.

## 2. Deux compagnons indispensables : man et internet

Sous ces 3 lettres se cache une commande qui sera la première source d’informations durant les TPs. Cette commande permet d’afficher le manuel de la commande dont le nom est passé en paramètre. Pour savoir comment fonctionne man... afficher son manuel : `man man`. 

Appuyer sur la barre d’espace pour aller à la page suivante et sur la touche q pour quitter le manuel et retourner sur le terminal. Il faut prendre l’habitude de regarder le manuel des commandes inconnues avant d’appeler le prof ! Cette commande est très importante pour retrouver comment utiliser une commande qu’on n’a pas utilisée depuis longtemps et/ou retrouver l’option de cette commande qui nous intéresse.

Les pages de manuel sont souvent très (trop) grandes et on a du mal à trouver l’information qu’on cherche... Pour chercher un texte dans une page de manuel, utiliser “/”, puis taper le texte à chercher et appuyer sur [Entrée] (et utiliser ’n’ pour passer à l’occurrence suivante du texte à chercher).
Combien de fois le mot “exemple” (ou example si le manuel est en anglais) apparaît-il dans le manuel de man?
2.2 Internet
Il faut également prendre l’habitude d’utiliser les moteurs de recherche internet (et Wikipédia) pour trouver une information. Lancer une recherche sur ≪ les commandes unix ≫, chercher une page web qui explique brièvement comment utiliser les commandes unix et garder cette page précieusement pour la suite. On pourra commencer une liste de signets comportant des pages web utiles pour le cours d’API...

La plupart des pages web parlant d’unix sont rédigées en anglais. Cependant, beaucoup d’entre elles sont traduites dans de nombreuses langues, notamment le français mais aussi le chinois ou l’arabe. Par défaut, les navigateurs internet de la fac affichent la page en français si elle existe. Il est possible de changer ce comportement et d’afficher prioritairement, par exemple, les pages en chinois. Aller dans les préférences du navigateur, trouver le réglage des langues et choisir ses langues préférées. Vérifier que le choix est bien pris en compte en allant, par exemple, sur www.debian.org