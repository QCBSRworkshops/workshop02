# [QCBS R Workshop Series](https://r.qcbs.ca/)

This series of 10 workshops walks participants through the steps required to use R for a wide array of statistical analyses relevant to research in biology and ecology. These open-access workshops were created by members of the QCBS both for members of the QCBS and the larger community.

The content of this workshop has been peer-reviewed by several QCBS members. If you would like to suggest modifications, please contact the current series coordinators, listed [here](https://r.qcbs.ca/about/) or open a pull request (see contributing guidelines at <https://r.qcbs.ca/presenter-developer-protocol/developing-en.html>).

# [Série d'ateliers R du CSBQ](https://r.qcbs.ca/fr/)

Cette série de 10 ateliers guide les participants à travers les étapes requises afin de maîtriser le logiciel R pour une grande variété d'analyses statistiques pertinentes en recherche en biologie et en écologie. Ces ateliers en libre accès ont été créés par des membres du CSBQ à la fois pour les membres du CSBQ et pour la grande communauté d'utilisateurs de R.

Le contenu de cet atelier a été révisé par plusieurs membres du CSBQ. Si vous souhaitez y apporter des modifications, veuillez SVP contacter les coordonnateurs actuels de la série, listés [ici](https://r.qcbs.ca/fr/about/) ou ouvrez un pull request (voir les instructions <https://r.qcbs.ca/presenter-developer-protocol/developper-fr.html>).

# Workshop 2: Loading and manipulating data

In this workshop, you will learn how to load, view, and manipulate your data in
R. You will learn basic commands to inspect and visualize your data, and learn
how to fix errors that may have occurred while loading your data into R. In
addition, you will learn how to write an R script, which is a text file that
contains your R commands and allows you to rerun your analyses in one simple
touch of a key (or maybe two, or three…)! We will then introduce `tidyr` and
`dplyr`, two powerful tools to manage and re-format your dataset, as well as
apply simple or complex functions on subsets of your data. This workshop will be
useful for those progressing through the entire workshop series, but also for
those who already have some experience in R and would like to become proficient
with new tools and packages.


# Atelier 2: Charger et manipuler des données

Durant cet atelier, vous apprendrez comment charger et visualiser des données
dans R. Vous apprendrez certaines fonctions permettant d’examiner vos données et
vous apprendrez comment corriger certaines erreurs communes se produisant lors
du chargement des données. Finalement, vous verrez l’importance de sauvegarder
votre travail dans un script R, soit un fichier texte contenant tous vos codes
et permettant de refaire toutes vos analyses en appuyant sur une seule touche
(ou deux, ou trois peut-être…). Ensuite, nous présenterons `tidyr` et `dplyr`
pour vous aider à transformer et à gérer le format de vos données ainsi que pour
appliquer des fonctions simples ou complexes sur des sous-groupes de vos jeux de
données. Cet atelier s’avérera utile non seulement pour les participants suivant
notre série d’ateliers, mais également pour ceux et celles d’entre vous
connaissant déjà le langage R et cherchant à maîtriser des outils plus avancés
pour l'analyse et la visualisation de vos données.

# Workshop materials

Language | Slides | Bookdown | Script | 
:--------|:-------|:-----|:-----|
EN | [![badge](https://img.shields.io/static/v1?style=flat-square&label=Slides&message=02&color=red&logo=html5)](https://r.qcbs.ca/workshop02/pres-en/workshop02-pres-en.html) | [![badge](https://img.shields.io/static/v1?style=flat-square&label=book&message=02&logo=github)](https://r.qcbs.ca/workshop02/book-en/index.html) | [![badge](https://img.shields.io/static/v1?style=flat-square&label=script&message=02&color=2a50b8&logo=r)](https://r.qcbs.ca/workshop02/book-en/workshop02-script-en.R) | [![badge](https://img.shields.io/static/v1?style=flat-square&label=repo&message=dev&color=6f42c1&logo=github)](https://github.com/QCBSRworkshops/workshop02) |
FR | [![badge](https://img.shields.io/static/v1?style=flat-square&label=Diapos&message=02&color=red&logo=html5)](https://r.qcbs.ca/workshop02/pres-fr/workshop02-pres-fr.html) | [![badge](https://img.shields.io/static/v1?style=flat-square&label=livre&message=02&logo=github)](https://r.qcbs.ca/workshop02/book-fr/index.html) | [![badge](https://img.shields.io/static/v1?style=flat-square&label=script&message=02&color=2a50b8&logo=r)](https://r.qcbs.ca/workshop02/book-fr/workshop02-script-fr.R)| [![badge](https://img.shields.io/static/v1?style=flat-square&label=repo&message=dev&color=6f42c1&logo=github)](https://github.com/QCBSRworkshops/workshop02) 

> *Note: The wiki for this workshop was converted to Bookdown in September 2021. <br> The wiki pages for this workshop will no longer be updated (Archive: [EN](https://wiki.qcbs.ca/r_workshop2), [FR](https://wiki.qcbs.ca/r_atelier2)).* 

# License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

# Contributors | Contributeurs et contributrices 

This workshop was originally developed by Johanna Bradie, Vincent Fugère, and Thomas Lamy.

Since 2014, several QCBS members contributed to consistently and collaboratively develop and update this workshop, as part of the *Learning and Development Award* from the Québec Centre for Biodiversity Science. They were:

|      2022 - 2021 - 2020     |      2019 - 2018 - 2017     |      2016 - 2015 - 2014      |
|:---------------------------:|:---------------------------:|:----------------------------:|
| Valentin Lucet | Gabriel Muñoz | Johanna Bradie |
| Kevin Cazelles | Katherine Hébert | Vincent Fugère |
| Pedro Henrique P. Braga | Marie-Hélène Brice | Thomas Lamy |
| Marie-Hélène Brice |  | Sebastien Portalier |
| Gabriel Muñoz |  | Zofia Taranu |
| Hassen Allegue |  | Cédric Frenette Dussault |
| Willian Vieira |  | |

# Development status

**Template** 

[![receive-from-template-and-dispatch-to-workflows](https://github.com/QCBSRworkshops/workshop02/workflows/receive-from-template-and-dispatch-to-workflows/badge.svg)](https://github.com/QCBSRworkshops/workshop02/actions?query=workflow%3Areceive-from-template-and-dispatch-to-workflows) 

**Building workshop materials**

Language | Slides | Book
:------- | :----- | :-----
EN  | [![render-presentation-en](https://github.com/QCBSRworkshops/workshop02/workflows/render-presentation-en/badge.svg)](https://github.com/QCBSRworkshops/workshop02/actions?query=workflow%3Arender-presentation-en) | [![render-book-en](https://github.com/QCBSRworkshops/workshop02/workflows/render-book-en/badge.svg)](https://github.com/QCBSRworkshops/workshop02/actions?query=workflow%3Arender-book-en)
FR   | [![render-presentation-fr](https://github.com/QCBSRworkshops/workshop02/workflows/render-presentation-fr/badge.svg)](https://github.com/QCBSRworkshops/workshop02/actions?query=workflow%3Arender-presentation-fr) | [![render-book-fr](https://github.com/QCBSRworkshops/workshop02/workflows/render-book-fr/badge.svg)](https://github.com/QCBSRworkshops/workshop02/actions?query=workflow%3Arender-book-fr)
