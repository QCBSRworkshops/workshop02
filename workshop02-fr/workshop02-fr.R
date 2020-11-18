## ----setup, echo = FALSE------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  fig.width=5, fig.height=5, fig.retina=3,
  fig.align = 'center'
)
options(repos=structure(c(CRAN="http://cran.r-project.org")))


## ----install_pkgs, echo = FALSE, results = "asis"-----------------------------
cat(
  qcbsRworkshops::first_slides(2, c('dplyr', 'tidyr', 'magrittr'), lang = "fr")
)


## ---- eval = FALSE------------------------------------------------------------
## # Ceci est un commentaire pas une commande R!


## ---- eval = FALSE------------------------------------------------------------
## #### Chargement du fichier de données ####


## ---- eval = FALSE------------------------------------------------------------
## rm(list = ls()) # Efface ce qui se trouve dans l'espace de travail
## ?rm
## ?ls


## ---- eval = FALSE, error = TRUE----------------------------------------------
## A<-"Test" # On crée un objet "A".
## A <- "Test" # Utilisez des espaces - plus facile à lire
## A = "Test"
## 
## # Note: il est recommandé d'utiliser "<-" pour l'assigment au lieu de "="
## 
## # Visualiser des objets en mémoire
## ls()
## # [1] "A"
## 
## A
## # [1] "Test"
## 
## # Nettoyer la mémoire
## rm(list=ls())
## 
## A
## # Error in eval(expr, envir, enclos): object 'A' not found


## ---- eval = TRUE, error = TRUE-----------------------------------------------
a <- 10
A <- 5
a
A
rm(list=ls())  # On nettoie l'espace de travail à nouveau !


## ---- eval = FALSE------------------------------------------------------------
## # Liste complete de tous les données disponibles sur base R
## library(help = "datasets")


## ---- eval = FALSE------------------------------------------------------------
## getwd()


## ---- eval = FALSE------------------------------------------------------------
## setwd("C:/Users/mon_repertoire")


## ---- eval = TRUE-------------------------------------------------------------
dir()


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- read.csv("data/co2_good.csv", header=TRUE)


## ---- eval = FALSE------------------------------------------------------------
## ?read.csv


## ---- eval = FALSE------------------------------------------------------------
## ?read.csv2


## ---- eval = TRUE-------------------------------------------------------------
str(CO2)


## ---- eval = FALSE------------------------------------------------------------
## CO2 <- read.csv("data/co2_good.csv", header = FALSE)


## ---- eval = FALSE------------------------------------------------------------
## mydata[1,] # Extrait la 1ère ligne
## mydata[2,3] # Extrait la 2ème ligne / 3ème colonne
## mydata[,1] # Extrait la 1ère colonne
## mydata[,1][2] # [...] peut être utilisé récursivement
## mydata$Variable1 # Extrait la colonne "Variable1"


## ---- eval = TRUE-------------------------------------------------------------
# Créer une copie du jeu de données qu'on pourra modifier
CO2copy <- CO2

# names() donne les noms des variables présentes dans le jeu de données
names(CO2copy)

# Changer des noms anglais pour des noms français
names(CO2copy) <- c("Plante", "Categorie", "Traitement", "conc", "absorption")
names(CO2copy)


## ---- eval = T----------------------------------------------------------------
# N'oubliez pas d'utiliser "" pour les chaînes de caractères
CO2copy$uniqueID <- paste0(CO2copy$Plante,
                           "_", CO2copy$Categorie,
                           "_", CO2copy$Traitement)

# Observer les résultats
head(CO2copy$uniqueID)


## ---- eval = T----------------------------------------------------------------
# Standardizer la variable "absorption" en valeurs relatives
CO2copy$absorptionRel <- CO2copy$absorption/max(CO2copy$absorption)

# Observer les résultats
head(CO2copy$absorptionRel)


## ---- eval = FALSE------------------------------------------------------------
## # On continue à travailler avec notre jeux de données CO2copy
## 
## # Extraire un sous-ensemble par un nom de variable
## CO2copy[, c("Plante", "absorptionRel")]
## 
## # Extraire un sous-ensemble de rangées
## CO2copy[1:50, ]


## ---- eval = FALSE------------------------------------------------------------
## # Extraire les observations du traitement "nonchilled"
## CO2copy[CO2copy$Traitement == "nonchilled", ]
## 
## # Extraire selon une condition numérique
## CO2copy[CO2copy$absorption >= 20, ]
## 
## # Extraire selon plusieurs conditions numériques
## CO2copy[CO2copy$Traitement  == "nonchilled" & CO2copy$absorption >= 20, ]
## 
## # Nous avons fini de modifier le data frame CO2copy, effaçons-le
## rm(CO2copy)


## ---- eval = FALSE------------------------------------------------------------
## summary(CO2)


## ---- eval = TRUE-------------------------------------------------------------
# Calculer la moyenne et l'écart type de la concentration,
# et les assigner à de nouvelles variables
meanConc <- mean(CO2$conc)
sdConc <- sd(CO2$conc)


## ---- eval = TRUE-------------------------------------------------------------
# print() imprime une valeur donnée dans la console R
print(paste("the mean of concentration is:", meanConc))

print(paste("the standard deviation of concentration is:", sdConc))


## ---- eval = TRUE, fig.width=6, fig.height=6----------------------------------
# Créons un histogramme pour explorer la distribution de "uptake"
hist(CO2$uptake)


## ---- eval = TRUE, fig.width=6, fig.height=6----------------------------------
# Créons un histogramme pour explorer la distribution de "uptake"
hist(CO2$uptake, breaks = 40) # breaks permet de changer le nombre de classes


## ---- eval = FALSE------------------------------------------------------------
## # Sauver l'espace de travail avec tous les objets
## save.image(file="data/co2_project_Data.RData")
## 
## # Nettoyer l'espace de travail
## rm(list = ls())
## 
## # Charger tout ce qui se trouvait dans l'espace de travail
## load("data/co2_project_Data.RData")
## head(CO2) # cela fonctionne! :)


## ---- echo = FALSE------------------------------------------------------------
head(CO2)


## ---- eval = FALSE------------------------------------------------------------
## write.csv(CO2, file = "data/co2_new.csv")


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- read.csv("data/co2_broken.csv")
head(CO2) # C'est le bordel!


## ---- eval = TRUE-------------------------------------------------------------
head(CO2)


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- read.csv("data/co2_broken.csv", sep = "")


## ---- eval = TRUE-------------------------------------------------------------
head(CO2)


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- read.csv("data/co2_broken.csv", sep = "", skip = 2)
head(CO2)


## ---- eval = TRUE-------------------------------------------------------------
str(CO2)


## ---- eval = TRUE-------------------------------------------------------------
unique(CO2$conc)


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- read.csv("data/co2_broken.csv", sep = "", skip = 2,
                na.strings = c("NA", "na", "cannot_read_notes"))
str(CO2)


## ---- eval = FALSE------------------------------------------------------------
## str(CO2)


## ---- eval = TRUE-------------------------------------------------------------
levels(CO2$Treatment)
unique(CO2$Treatment)


## ---- eval = TRUE-------------------------------------------------------------
# Identifier toutes les lignes contenant "nnchilled" et remplacer par "nonchilled"
CO2$Treatment[which(CO2$Treatment=="nnchilled")] <- "nonchilled"

# Faisons la même chose pour "chiled" :
CO2$Treatment[which(CO2$Treatment=="chiled")] <- "chilled"


## -----------------------------------------------------------------------------
boxplot(uptake ~ Treatment, data = CO2)


## ---- eval = TRUE-------------------------------------------------------------
CO2 <- droplevels(CO2)
str(CO2)


## ---- eval = FALSE------------------------------------------------------------
## boxplot(uptake ~ Treatment, data = CO2)


## ---- echo = FALSE, fig.height = 3.5------------------------------------------
par(mar = c(4, 4, 0, 0))
boxplot(uptake ~ Treatment, data = CO2)


## -----------------------------------------------------------------------------
library(tidyr)


## ---- echo = FALSE, eval = TRUE-----------------------------------------------
large <- data.frame(Species = c("Chene", "Orme", "Frene"),
                   DHP = c(12, 20, 13),
                   Haut = c(56, 85, 55))
large


## ---- echo=FALSE, eval = TRUE-------------------------------------------------
long <- gather(large, dimension, cm, DHP, Haut)
long


## -----------------------------------------------------------------------------
install.packages("tidyr")
library(tidyr)


## ---- echo = T----------------------------------------------------------------
large <- data.frame(Species = c("Chene", "Orme", "Frene"),
                   DHP      = c(12, 20, 13),
                   Haut     = c(56, 85, 55))
large


## -----------------------------------------------------------------------------
long <- pivot_longer(data      = large, 
                     cols      = c("DHP", "Haut"),
                     names_to  = "dimension", 
                     values_to = "cm")
long


## -----------------------------------------------------------------------------
long


## -----------------------------------------------------------------------------
large2 <- pivot_wider(data        = long, 
                      names_from  = "dimension", 
                      values_from = "cm")
large2


## -----------------------------------------------------------------------------
tibble(x = 1:3, y = c("a","b","c"))


## -----------------------------------------------------------------------------
tibble(x = 1:3, y = list(1:5, 1:10, 1:20))



## -----------------------------------------------------------------------------
set.seed(8)
degat <- data.frame(id = 1:4,
                    trt = sample(rep(c('control', 'culture'), each = 2)),
                    zooplancton.T1 = runif(4),
                    poisson.T1 = runif(4),
                    zooplancton.T2 = runif(4),
                    poisson.T2 = runif(4))
degat


## -----------------------------------------------------------------------------
degat.long <- pivot_longer(degat,
                           names_to = "taxa",
                           cols     = c("zooplancton.T1", 
                                        "poisson.T1",
                                        "zooplancton.T2",
                                        "poisson.T2"))
head(degat.long)


## -----------------------------------------------------------------------------
degat.long.sep <- separate(degat.long, taxa,
                           into = c("especes", "temps"), sep = "\\.")
head(degat.long.sep)


## ---- eval = FALSE------------------------------------------------------------
## ?airquality
## 
## data(airquality)


## -----------------------------------------------------------------------------
air.long <- pivot_longer(airquality,
                         cols     = c("Ozone", "Solar.R", "Wind", "Temp"), 
                         names_to = c("variable"))

head(air.long)


## -----------------------------------------------------------------------------
air.wide <- pivot_wider(air.long,
                        values_from = "value",
                        names_from  = "variable")
head(air.wide)


## ---- eval = TRUE-------------------------------------------------------------
library(dplyr)


## ---- eval = FALSE------------------------------------------------------------
## select(données, colonne1, colonne2) # sélectionne colonne1 et colonne2
## select(données, c(2:4,6) # sélectionne les colonnes 2 à 4, plus la 6ème colonne
## select(données, -colonne1) # sélectionne toutes les colonnes sauf la 1ère
## select(données, start_with(x.)) # sélectionne les colonnes ayant un nom qui commence par "x."


## -----------------------------------------------------------------------------
ozone <- select(airquality, Ozone, Month, Day)
head(ozone)


## ----airquality---------------------------------------------------------------
aout <- filter(airquality, Month == 8, Temp >= 90)
# ou filter(airquality, Month == 8 & Temp >= 90)
head(aout)


## -----------------------------------------------------------------------------
air_degat <- sample_frac(airquality, 1)
head(air_degat)


## -----------------------------------------------------------------------------
air_chron <- arrange(air_degat, Month, Day)
head(air_chron)


## -----------------------------------------------------------------------------
airquality_C <- mutate(airquality, 
                       Temp_C = (Temp-32)*(5/9))
head(airquality_C)


## ---- eval=FALSE--------------------------------------------------------------
## library(magrittr)


## -----------------------------------------------------------------------------
juin_C <- mutate(filter(airquality, Month == 6),
                 Temp_C = (Temp-32)*(5/9))


## -----------------------------------------------------------------------------
juin_C <- airquality %>%
            filter(Month == 6) %>%
            mutate(Temp_C = (Temp-32)*(5/9))


## -----------------------------------------------------------------------------
mois_moy <- airquality %>%
             group_by(Month) %>%
             summarise(mean_temp = mean(Temp),
                       sd_temp   = sd(Temp))
mois_moy


## ----eval = 2-----------------------------------------------------------------
?ChickWeight
data(ChickWeight)


## -----------------------------------------------------------------------------
mass_diff <- ChickWeight %>%
              group_by(Chick) %>%
              summarise(mass_diff = max(weight) - min(weight))
head(mass_diff)


## -----------------------------------------------------------------------------

mass_diff_rbase <- aggregate(formula = weight ~ Chick, 
                             data    = ChickWeight,
                             FUN     = function(x) weight_diff = max(x) - min(x))
names(mass_diff_rbase) <- c("Chick", "weight_diff")



## -----------------------------------------------------------------------------
# Est ce que les deux résultats sont identiques (c-a-d avec et sans dplyr)

table(mass_diff_rbase ==  as.data.frame(mass_diff))



## -----------------------------------------------------------------------------
diet_mass <- ChickWeight %>%
      group_by(Diet, Chick) %>%
      summarise(gain_masse = last(weight) - first(weight)) %>%
      summarise(gain_moyen = mean(gain_masse))
diet_mass

