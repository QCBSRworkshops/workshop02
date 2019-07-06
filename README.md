# [QCBS R Workshop series](https://wiki.qcbs.ca/r)

This series of 10 workshops walks participants through the steps required to use R for a wide array of statistical analyses relevant to research in biology and ecology. These open-access workshops were created by members of the QCBS both for members of the QCBS and the larger community.

The content of this workshop has been peer-reviewed by several QCBS members. If you would like to suggest modifications, please contact the current series coordinators, listed [here](https://wiki.qcbs.ca/r).

# [Série d'ateliers R du CSBQ](https://wiki.qcbs.ca/r)

Cette série de 10 ateliers guide les participants à travers les étapes requises afin de maîtriser le logiciel R pour une grande variété d’analyses statistiques pertinentes en recherche en biologie et en écologie. Ces ateliers en libre accès ont été créés par des membres du CSBQ à la fois pour les membres du CSBQ et pour la grande communauté d’utilisateurs de R.

Le contenu de cet atelier a été révisé par plusieurs membres du CSBQ. Si vous souhaitez y apporter des modifications, veuillez SVP contacter les coordonnateurs actuels de la série, listés [ici](https://wiki.qcbs.ca/r).

# Workshop 2: Loading and manipulating data

 In this workshop, you will learn how to load, view, and manipulate your data in R. You will learn basic commands to inspect and visualize your data, and learn how to fix errors that may have occurred while loading your data into R. In addition, you will learn how to write an R script, which is a text file that contains your R commands and allows you to rerun your analyses in one simple touch of a key (or maybe two, or three…)! We will then introduce `tidyr` and `dplyr`, two powerful tools to manage and re-format your dataset, as well as apply simple or complex functions on subsets of your data. This workshop will be useful for those progressing through the entire workshop series, but also for those who already have some experience in R and would like to become proficient with new tools and packages.

# Atelier 2: Charger et manipuler des données

Durant cet atelier, vous apprendrez comment charger et visualiser des données dans R. Vous apprendrez certaines fonctions permettant d’examiner vos données et vous apprendrez comment corriger certaines erreurs communes se produisant lors du chargement des données. Finalement, vous verrez l’importance de sauvegarder votre travail dans un script R, soit un fichier texte contenant tous vos codes et permettant de refaire toutes vos analyses en appuyant sur une seule touche (ou deux, ou trois peut-être…). Ensuite, nous présenterons `tidyr` et `dplyr` pour vous aider à transformer et à gérer le format de vos données ainsi que pour appliquer des fonctions simples ou complexes sur des sous-groupes de vos jeux de données. Cet atelier s’avérera utile non seulement pour les participants suivant notre série d’ateliers, mais également pour ceux et celles d’entre vous connaissant déjà le langage R et cherchant à maîtriser des outils plus avancés pour l'analyse et la visualisation de vos données.


# Links

#### [English](https://qcbsrworkshops.github.io/workshop02/workshop02-en/workshop02-en.html)

#### [Français](https://qcbsrworkshops.github.io/workshop02/workshop02-fr/workshop02-fr.html)

# Developers

1. Set the working directory set to this folder.
2. then use:

``` r
install.packages("remotes")
remotes::install_github("QCBSRworkshops/qcbsRworkshops")
library("qcbsRworkshops")
build_workshops()
```
