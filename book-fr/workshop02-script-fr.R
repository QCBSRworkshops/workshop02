##Section: 01-preparation-pour-l-atelier.R 

###Avis ###
#                                                                            #
#Ceci est un script généré automatiquement basé sur les morceaux de code du  #
#livre pour cet atelier.                                                     #
#                                                                            #
#Il est minimalement annoté pour permettre aux participants de fournir leurs #
#commentaires : une pratique que nous encourageons vivement.                 #
#                                                                            #
#Notez que les solutions aux défis sont également incluses dans ce script.   #
#Lorsque vous résolvez les défis par vous-méme, essayez de ne pas parcourir  #
#le code et de regarder les solutions.                                       #
#                                                                            #
#Bon codage !                                                               #



##Section: 02-projet-r.R 




##Section: 03-ecrire-un-script.R 

# Ceci est un commentaire, pas une commande !

Atelier R du CSBQ ##
Atelier 2 - Charger et manipuler des données
Auteur: Centre de la science de la biodiversité du Québec
Date: Automne 2014
R version 2.15.0

##Chargement du fichier de données ####

rm(list=ls())  # Efface ce qui se trouve dans l'espace de travail
?rm
?ls

A<-"Test" # On crée un objet "A".
A <- "Test" # Utilisez des espaces - plus facile à lire
A = "Test"
# Note: il est recommandé d'utiliser "<-" pour l'assigment au lieu de "="
# Visualiser des objets en mémoire
ls()
# [1] "A"
A
# [1] "Test"
# Nettoyer la mémoire
rm(list=ls())
A
# Error in eval(expr, envir, enclos): object 'A' not found

a<-10
A<-5
a
A

rm(list=ls())  # On nettoie l'espace de travail à nouveau !


##Section: 04-charger-explorer-enregistrer.R 

getwd() # Cette commande vous indique le répertoire dans lequel vous vous trouvez.

dir() # Cette commande vous indique le contenu du répertoire dans lequel vous vous trouvez.

CO2<-read.csv("CO2_good.csv")
# Cette commande crée un objet nommé CO2 en chargeant les données
# du fichier nommé "CO2_good.csv".

CO2<-read.csv(file.choose())

?read.csv # Ceci fera apparaître la page d'aide pour la fonction read.csv().

CO2<-read.csv("CO2_good.csv", header = TRUE)

CO2<-read.csv("CO2_good.csv",header=FALSE)

mydata[2,3] # extrait le contenu de la deuxième ligne / troisième colonne

mydata[1,] # extrait le contenu de la première ligne

mydata[,1] # extrait le contenu de la première colonne
mydata[,1][2] # [...] peut être utilisé récursivement
mydata$Variable1 # extrait le contenu de la colonne "Variable1"

# Créer une copie du jeu de données qu'on pourra modifier
CO2copy <- CO2
# names() donne les noms des variables présents dans le jeu de données
names(CO2copy)

# Changer des noms anglais à des noms français
names(CO2copy) <- c("Plante","Categorie", "Traitement", "conc","absortion")

# Créer un ID unique pour les échantillons avec la fonction ''paste()''
# Consultez ?paste et ?paste0
# N'oubliez pas d'utiliser "" pour les chaînes de caractères
CO2copy$uniqueID <- paste0(CO2copy$Plante,"_", CO2copy$Categorie, "_", CO2copy$Traitement)

# Observer les résultats
head(CO2copy$uniqueID)

# Standardizer la variable "absortion" en valeurs relatives
CO2copy$absortionRel = CO2copy$absortion/max(CO2copy$absortion)

# Observer les résultats
head(CO2copy$absortionRel)

# Continuons avec notre trame de données "CO2copy"

Extraire un sous-ensemble par un nom de variable
CO2copy[,c("Plante", "absortionRel")] # Extrait seulement les colonnes nommées "Plante" et "absortionRel". (N'oubliez pas ","!)

Extraire un sous-ensemble de rangées
CO2copy[1:50,] # Extraite les rangées de 1 à 50

#Extraire un sous-ensemble correspondant à un facteur
CO2copy[CO2copy$Traitement == "nonchilled",] # Extraire les observations correspondant seulement au traitement "nonchilled".

#Extraire un sous-ensemble correspondant à une condition numérique
CO2copy[CO2copy$absortion >= 20, ] # Extraire les observations ayant une absortion plus grande ou égale à 20

#Les conditions peuvent être complémentaires en utilisant "&"
CO2copy[CO2copy$Traitement == "nonchilled" & CO2copy$absortion >= 20, ]

# Nous avons fini de modifier la copie du jeu de données CO2copy. On peut alors l'effacer.
rm(CO2copy)

summary(CO2) # calculer les statistiques sommaires du jeu de données

# Calculer la moyenne et l'écart type des données dans la colonne "conc" de l'objet CO2
meanConc<-mean(CO2$conc) # Calcule la moyenne de la colonne "conc" de l'objet "CO2"
sdConc<-sd(CO2$conc) # Calcule l'écart-type de la colonne "conc"

# print() sort une valeure dans la console R
print(paste("la concentration moyenne est:", meanConc)) print(paste("l'écart type de la concentration est:", sdConc))

# Produisez un histogramme to explore the distribution of "uptake"
hist(CO2$uptake)

# Augmenter le nombre de classes pour mieux observer la distribution
hist(CO2$uptake, breaks = 40)

?apply

apply(CO2[,4:5], MARGIN = 2, FUN = mean) # Calcule la moyenne des colonnes 4 et 5 du jeu de données CO2

save.image(file="CO2_project_Data.RData") # L'espace de travail est enregistré

rm(list=ls())  # Nettoyer l'espace de travail

load("CO2_project_Data.RData") # Charger tout ce qui se trouvait dans l'espace de travail

head(CO2) # Ça fonctionne! :)

write.csv(CO2,file="CO2_new.csv") # L'objet CO2 est enregistré dans le fichier nommé CO2_new.csv


##Section: 05-réparer.R 

CO2<-read.csv("CO2_broken.csv") # On remplace l'ancien objet CO2 avec le contenu d'un nouveau jeu de données
head(CO2) # C'est le désordre!
CO2

CO2 <- read.csv("CO2_broken.csv",sep = "")
?read.csv

head(CO2) # La fonction head() permet de voir que les données n'ont pas été lues avec les bons en-têtes

CO2<-read.csv("CO2_broken.csv",sep = "",skip=2)  # En ajoutant l'argument skip, R ignore les deux premières lignes.
head(CO2) # Le tableau a maintenant des en-têtes appropriés.

str(CO2) # La fonction str() montre que les colonnes 'conc' et 'uptake' sont considérées comme facteurs.
class(CO2$conc)
unique(CO2$conc) # En examinant les valeurs uniques de cette colonne,
                 # on voit que ces deux colonnes contiennent la valeur "cannot_read_notes".
unique(CO2$uptake)
?unique

?read.csv

CO2 <- read.csv("CO2_broken.csv",sep = "",skip = 2,na.strings = c("NA","na","cannot_read_notes"))

head(CO2)
str(CO2) # La variable 'conc' est maintenant de type 'integer' (nombre entier) et la variable 'uptake' est maintenant de type numérique.

str(CO2) # Vous voyez qu'il y a quatre niveaux de traitement
levels(CO2$Treatment)
unique(CO2$Treatment) # Les quatre différents traitements sont "nonchilled", "nnchilled", "chilled" et "chiled"

# Vous pouvez utiliser la fonction which() afin de trouver les lignes avec l'erreur "nnchilled"
which(CO2$Treatment=="nnchilled") # Cette commande nous indique que l'erreur se trouve à la ligne 10
# Vous pouvez corriger l'erreur par indexation (voir atelier 1) :
CO2$Treatment[10] <- "nonchilled"
# Vous pouvez faire ces deux étapes en une seule commande :
CO2$Treatment[which(CO2$Treatment=="nnchilled")] <- "nonchilled"
# Faisons la même chose pour "chiled" :
CO2$Treatment[which(CO2$Treatment=="chiled")] <- "chilled"

str(CO2)  # La fonction str() identifie toujours quatre niveaux de facteur pour la variable traitement
unique(CO2$Treatment) # Cependant, la fonction unique() indique que seulement deux niveaux sont utilisés
CO2<-droplevels(CO2) # La fonction droplevels() supprime les niveaux inutilisés de tous les facteurs du tableau de données
str(CO2) # C'est réparé !


##Section: 06-tidyverse.R 

if(!require(tidyr)){install.packages("tidyr")}
library(tidyr)

> large <- data.frame(Species = c("Chêne", "Orme", "Frêne"),
                          DHP = c(12, 20, 13),
                         Haut = c(56, 85, 55))
> large

  Species DHP Haut
1   Chêne  12   56
2    Orme  20   85
3   Frêne  13   55

?pivot_longer

# Rassembler les colonnes en rangées d'observations uniques

> long <- pivot_longer(data      = large,
                       cols      = c("DHP", "Haut"),
                       names_to  = "dimension",
                       values_to = "cm")
> long
  Species dimension cm
1   Chêne       DHP 12
2    Orme       DHP 20
3   Frêne       DHP 13
4   Chêne      Haut 56
5    Orme      Haut 85
6   Frêne      Haut 55

CO2.long <- pivot_longer(CO2, cols = c("conc", "uptake"),
                         "response", "value")
head(CO2)
head(CO2.long)
tail(CO2.long)

?pivot_wider

> large2 <- pivot_wider(data        = long,
                        names_from  = "dimension",
                        values_from = "cm")
> large2
  Species DHP Haut
1   Chêne  12   56
2   Frêne  13   55
3    Orme  20   85

tibble(x = 1:3, y = list(1:5, 1:10, 1:20))

set.seed(8)
degat <- data.frame(id = 1:4,
                    trt = sample(rep(c('controle', 'culture'), each = 2)),
         zooplancton.T1 = runif(4),
             poisson.T1 = runif(4),
         zooplancton.T2 = runif(4),
             poisson.T2 = runif(4))

> degat.long <- pivot_longer(degat,
                             names_to = "taxa",
                             cols     = c("zooplancton.T1",
                                          "poisson.T1",
                                          "zooplancton.T2",
                                          "poisson.T2"))
> head(degat.long)

> degat.long.sep <- separate(degat.long, taxa, into = c("especes", "temps"), sep = "\.")
> head(degat.long.sep)
  id      trt     especes temps     count
1  1 controle zooplancton    T1 0.3215092
2  2 controle zooplancton    T1 0.7189275
3  3  culture zooplancton    T1 0.2908734
4  4  culture zooplancton    T1 0.9322698
5  1 controle     poisson    T1 0.7691470
6  2 controle     poisson    T1 0.6444911

air.long <- pivot_longer(airquality,
                         cols     = c("Ozone", "Solar.R", "Wind", "Temp"),
                         names_to = c("variable"))
# Notez que la syntaxe ici indique qu'on veut "rassembler" toutes les colonnes sauf "Month" et "Day"
head(air.long)
air.wide <- pivot_wider(air.long,
                        values_from = "value",
                        names_from  = "variable")
head(air.wide)

if(!require(dplyr)){install.packages("dplyr")}
library(dplyr)

?airquality
data(airquality)
?ChickWeight
data(ChickWeight)

select(données, colonne1, colonne2) # sélectionne colonne1 et colonne2
select(données, c(2:4,6) # sélectionne les colonnes 2 à 4, plus la 6ème colonne
select(données, -colonne1) # sélectionne toutes les colonnes sauf la 1ère
select(données, start_with(x.)) # sélectionne les colonnes ayant un nom qui commence par "x."

> ozone <- select(airquality, Ozone, Month, Day)
> head(ozone)
  Ozone Month Day
1    41     5   1
2    36     5   2
3    12     5   3
4    18     5   4
5    NA     5   5
6    28     5   6

> aout <- filter(airquality, Month == 8, Temp >= 90)
> head(aout)
  Ozone Solar.R Wind Temp Month Day
1    89     229 10.3   90     8   8
2   110     207  8.0   90     8   9
3    NA     222  8.6   92     8  10
4    76     203  9.7   97     8  28
5   118     225  2.3   94     8  29
6    84     237  6.3   96     8  30

> air_degat <- sample_frac(airquality, 1)
> head(air_degat)
    Ozone Solar.R Wind Temp Month Day
21      1       8  9.7   59     5  21
42     NA     259 10.9   93     6  11
151    14     191 14.3   75     9  28
108    22      71 10.3   77     8  16
8      19      99 13.8   59     5   8
104    44     192 11.5   86     8  12

> air_chron <- arrange(air_degat, Month, Day)
> head(air_chron)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6

arrange(air_mess, Day, Month)

> airquality_C <- mutate(airquality, Temp_C = (Temp-32)*(5/9))
> head(airquality_C)
  Ozone Solar.R Wind Temp Month Day   Temp_C
1    41     190  7.4   67     5   1 19.44444
2    36     118  8.0   72     5   2 22.22222
3    12     149 12.6   74     5   3 23.33333
4    18     313 11.5   62     5   4 16.66667
5    NA      NA 14.3   56     5   5 13.33333
6    28      NA 14.9   66     5   6 18.88889

if(!require(magrittr)){install.packages("magrittr")}
library(magrittr)

juin_C <- mutate(filter(airquality, Month == 6), Temp_C = (Temp-32)*(5/9))

juin_C <- airquality %>%
    filter(Month == 6) %>%
    mutate(Temp_C = (Temp-32)*(5/9))

> mois_moy <- airquality %>%
      group_by(Month) %>%
      summarise(mean_temp = mean(Temp),
                sd_temp = sd(Temp))
mois_moy
Source: local data frame [5 x 3]

  Month mean_temp  sd_temp
  (int)     (dbl)    (dbl)
1     5  65.54839 6.854870
2     6  79.10000 6.598589
3     7  83.90323 4.315513
4     8  83.96774 6.585256
5     9  76.90000 8.355671

?ChickWeight
data(ChickWeight)

> mass_diff <- ChickWeight %>%
     group_by(Chick) %>%
     summarise(mass_diff = max(weight) - min(weight))
> mass_diff
Source: local data frame [50 x 2]

    Chick weight_diff
   (fctr)       (dbl)
1      18           4
2      16          16
3      15          27
4      13          55
5       9          58
6      20          76
7      10          83
8       8          92
9      17         100
10     19         114
..    ...         ...

> poussin_18 <- ChickWeight %>% filter(Chick == 18)
> poussin_18
  weight Time Chick Diet
1     39    0    18    1
2     35    2    18    1

> diet_mass <- ChickWeight %>%
      group_by(Diet, Chick) %>%
      summarise(gain_masse = last(weight) - first(weight)) %>%
      summarise(gain_moyen = mean(gain_masse))
> diet_mass
Source: local data frame [4 x 2]

    Diet gain_moyen
  (fctr)      (dbl)
1      1      114.9
2      2      174.0
3      3      229.5
4      4      188.3


mass_diff_rbase <- aggregate(formula = weight ~ Chick,
                             data    = ChickWeight,
                             FUN     = function(x) weight_diff = max(x) - min(x))
names(mass_diff_rbase) <- c("Chick", "weight_diff")


# Est ce que les deux résultats sont identiques (c-a-d avec et sans dplyr)

table(mass_diff_rbase ==  as.data.frame(mass_diff))



##Section: 07-considerations-finales.R 




##Section: 08-references-fr.R 




