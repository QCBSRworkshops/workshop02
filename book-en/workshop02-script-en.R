##Section: 01-preparing-for-the-workshop.R 

###Notice ###
#                                                                            #
#This is an automatically generated script based on the code chunks from the #
#book for this workshop.                                                     #
#                                                                            #
#It is minimally annotated to allow participants to provide their comments:  #
#a practice that we highly encourage.                                        #
#                                                                            #
#Note that the solutions to the challenges are also included in this script. #
#When solving the challenges by yourself, attempt to not scroll and peek at  #
#the solutions.                                                              #
#                                                                            #
#Happy coding!                                                               #



##Section: 02-r-project.R 




##Section: 03-writing-a-script.R 

# This is a comment, not a command

QCBS R Workshop ##
Workshop 2 - Loading and manipulating data
Author: Quebec Center for Biodiversity Science
Date: Fall 2014
R version 2.15.0

##Housekeeping ####

rm(list=ls())  # Clears R workspace
?rm
?ls

A<-"Test" # Put some data in workspace
A <- "Test" # Add some spaces to organize your data!
A = "Test" # You can do this, but it does not mean you should
# Check objects in the workspace
ls()
# [1] "A"
A
# [1] "Test"
# Clean Workspace
rm(list=ls())
A

a<-10
A<-5
a
A

rm(list=ls())  # Clears R workspace again


##Section: 04-load-explore-save.R 

getwd() # This commands shows the directory you are currently working in

dir() # This command shows the content of the directory you are currently working in

CO2 <- read.csv("co2_good.csv") # Creates an object called CO2 by loading data from a file called "co2_good.csv"

?read.csv # Use the question mark to pull up the help page for a command

CO2 <- read.csv("co2_good.csv", header = TRUE)

CO2<-read.csv("co2_good.csv",header=FALSE)

mydata[2,3] # extracts the content of row 2 / column 3

mydata[1,] # extracts the content of the first row

mydata[,1][2] # this extracts the second content of the first column

mydata$Variable1 # extracts a specific column by its name ("Variable1")

# First let's make a copy of the dataset to play with!
CO2copy <- CO2
# names() gives you the names of the variables present in the data frame
names(CO2copy)

# Changing from English to French names (make sure you have the same levels!)
names(CO2copy) <- c("Plante","Categorie", "Traitement", "conc","absortion")

# Let's create an unique id for our samples using the function paste()
# see ?paste and ?paste0
# Don't forget to use "" for strings
CO2copy$uniqueID <- paste0(CO2copy$Plante,"_", CO2copy$Categorie, "_", CO2copy$Traitement)

# Observe the results
head(CO2copy$uniqueID)

# Let's standardize our variable "absortion" to relative values
CO2copy$absortionRel = CO2copy$absortion/max(CO2copy$absortion) # Changing to relative values

# Observe the results
head(CO2copy$absortionRel)


# Let's keep working with our CO2copy data frame

Subsetting by variable name
CO2copy[,c("Plante", "absortionRel")] # Selects only "Plante" and "absortionRel" columns. (Don't forget the ","!)

Subsetting by row
CO2copy[1:50,] # Subset data frame from rows from 1 to 50

#Subsetting by matching with a factor level
CO2copy[CO2copy$Traitement == "nonchilled",] # Select observations matching only the nonchilled Traitement.

#Subsetting according to a numeric condition
CO2copy[CO2copy$absortion >= 20, ] # Select observations with absortion higher or equal to 20

#Conditions can be complimentary -The & (and) argument-
CO2copy[CO2copy$Traitement  == "nonchilled" & CO2copy$absortion >= 20, ]

# We are done playing with the dataset copy. Let's erase it.
rm(CO2copy)

summary(CO2) # Get summary statistics of your dataset

# Calculate mean and standard deviation of the concentration, and assign them to new variables
meanConc <- mean(CO2$conc)
sdConc <- sd(CO2$conc)

# print() prints any given value to the R console
print(paste("the mean of concentration is:", meanConc))
print(paste("the standard deviation of concentration is:", sdConc))

# Let's plot a histogram to explore the distribution of "uptake"
hist(CO2$uptake)

# Increasing the number of bins to observe better the pattern
hist(CO2$uptake, breaks = 40)

?apply

apply(CO2[,4:5], MARGIN = 2, FUN = mean) # Calculate mean of the two columns in the data frame that contain continuous data

save.image(file="co2_project_Data.RData") # Save workspace

rm(list=ls())  # Clears R workspace

load("co2_project_Data.RData") #Reload everything that was in your workspace

head(CO2) # Looking good! :)

write.csv(CO2,file="co2_new.csv") # Save object CO2 to a file named co2_new.csv


##Section: 05-repair.R 

CO2<-read.csv("co2_broken.csv") # Overwrite CO2 object with broken CO2 data
head(CO2) # Looks messy
CO2 # Indeed!

CO2 <- read.csv("co2_broken.csv",sep = "")
?read.csv

head(CO2) # The head() command allows you to see that the data has not been read in with the proper headings

CO2<-read.csv("co2_broken.csv",sep = "",skip=2)  # By adding the skip argument into the read.csv function, R knows to skip the first two rows
head(CO2) # You can now see that the CO2 object has the appropriate headings

str(CO2) # The str() command shows you that both 'conc' and 'uptake' are labelled as factors
class(CO2$conc)
unique(CO2$conc) # By looking at the unique values in this column, you see that both columns contain "cannot_read_notes"
unique(CO2$uptake)
?unique

?read.csv

CO2 <- read.csv("co2_broken.csv",sep = "",skip = 2,na.strings = c("NA","na","cannot_read_notes"))

head(CO2)
str(CO2) # You can see that conc variable is now an integer and the uptake variable is now treated as numeric

str(CO2) # You can see that 4 levels are listed for Treatment
levels(CO2$Treatment)
unique(CO2$Treatment) # The 4 different treatments are "nonchilled", "nnchilled", "chilled", and "chiled"

# You can use which() to find rows with the typo "nnchilled"
which(CO2$Treatment=="nnchilled") # Row number ten
# You can then correct the error using indexing:
CO2$Treatment[10] <- "nonchilled"
# Alternatively, doing it with a single command:
CO2$Treatment[which(CO2$Treatment=="nnchilled")] <- "nonchilled"
# Now doing the same for "chiled":
CO2$Treatment[which(CO2$Treatment=="chiled")] <- "chilled"

str(CO2)  # Structure still identifies 4 levels of the factor
unique(CO2$Treatment) # But, unique says that only two are used
CO2<-droplevels(CO2) # This command drops the unused levels from all factors in the data frame
str(CO2) # Fixed!


##Section: 06-tidyverse.R 

if(!require(tidyr)){install.packages("tidyr")}
library(tidyr)

> wide <- data.frame(Species = c("Oak", "Elm", "Ash"),
                          DBH = c(12, 20, 13),
                       Height = c(56, 85, 55))
> wide
  Species DBH Height
1     Oak  12     56
2     Elm  20     85
3     Ash  13     55

?pivot_longer

# Gathering columns into rows

> long <- pivot_longer(data      = wide,
                       cols      = c("DBH", "Height"),
                       names_to  = "dimension",
                       values_to = "cm")

> long
  Species dimension    cm
  <chr>   <chr>     <dbl>
1 Chene   DHP          12
2 Chene   Haut         56
3 Orme    DHP          20
4 Orme    Haut         85
5 Frene   DHP          13
6 Frene   Haut         55

CO2.long <- pivot_longer(CO2, cols = c("conc", "uptake"),
                                       "response", "value")
head(CO2)
head(CO2.long)
tail(CO2.long)

# Spreading rows into columns
> wide2 <- ivot_wider(data        = long,
                      names_from  = "dimension",
                      values_from = "cm")
> wide2
  Species   DBH Height
  <chr>   <dbl>  <dbl>
1 Oak        12     56
2 Elm        20     85
3 Ash        13     55

tibble(x = 1:3, y = c("a","b","c"))

tibble(x = 1:3, y = list(1:5, 1:10, 1:20))


set.seed(8)
messy <- data.frame(id = 1:4,
                          trt = sample(rep(c('control', 'farm'), each = 2)),
               zooplankton.T1 = runif(4),
                      fish.T1 = runif(4),
               zooplankton.T2 = runif(4),
                      fish.T2 = runif(4))
messy

messy.long <- pivot_longer(messy,
                           names_to = "taxa",
                           cols     = c("zooplankton.T1",
                                        "fish.T1",
                                        "zooplankton.T2",
                                        "fish.T2"))
head(messy.long)
     id trt   taxa           value
  <int> <chr> <chr>          <dbl>
1     1 farm  zooplankton.T1 0.719
2     1 farm  fish.T1        0.644
3     1 farm  zooplankton.T2 0.545
4     1 farm  fish.T2        0.264
5     2 farm  zooplankton.T1 0.291
6     2 farm  fish.T1        0.457

messy.long.sep <- separate(messy.long, taxa, into = c("species", "time"), sep = "\\.")

head(messy.long.sep)

     id trt   species     time  value
  <int> <chr> <chr>       <chr> <dbl>
1     1 farm  zooplankton T1    0.719
2     1 farm  fish        T1    0.644
3     1 farm  zooplankton T2    0.545
4     1 farm  fish        T2    0.264
5     2 farm  zooplankton T1    0.291
6     2 farm  fish        T1    0.457

?air.quality
data(airquality)

# Use gather() to convert the dataset to long format
air.long <- gather(airquality, variable, value, -Month, -Day)
head(air.long)
# Note that the syntax used here indicates we wish to gather ALL the columns except "Month" and "Day"

# Then, use spread() to convert the dataset back to wide format
air.wide <- spread(air.long , variable, value)
head(air.wide)

air.wide <- pivot_wider(air.long,
                        values_from = "value",
                        names_from  = "variable")
head(air.wide)

if(!require(dplyr)){install.packages("dplyr")}
library(dplyr)

select(data, column1, column2) # select columns 1 and 2
select(data, c(2:4,6) # select columns 2 to 4 and 6
select(data, -column1) # select all columns except column 1
select(data, start_with(x.)) # select all columns that start with "x."

> head(airquality)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6

> ozone <- select(airquality, Ozone, Month, Day)
> head(ozone)
  Ozone Month Day
1    41     5   1
2    36     5   2
3    12     5   3
4    18     5   4
5    NA     5   5
6    28     5   6

> august <- filter(airquality, Month == 8, Temp >= 90)
> head(august)
  Ozone Solar.R Wind Temp Month Day
1    89     229 10.3   90     8   8
2   110     207  8.0   90     8   9
3    NA     222  8.6   92     8  10
4    76     203  9.7   97     8  28
5   118     225  2.3   94     8  29
6    84     237  6.3   96     8  30

> air_mess <- sample_frac(airquality, 1)
> head(air_mess)
    Ozone Solar.R Wind Temp Month Day
21      1       8  9.7   59     5  21
42     NA     259 10.9   93     6  11
151    14     191 14.3   75     9  28
108    22      71 10.3   77     8  16
8      19      99 13.8   59     5   8
104    44     192 11.5   86     8  12

> air_chron <- arrange(air_mess, Month, Day)
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
require(magrittr)

june_C <- mutate(filter(airquality, Month == 6), Temp_C = (Temp-32)*(5/9))

june_C <- airquality %>%
    filter(Month == 6) %>%
    mutate(Temp_C = (Temp-32)*(5/9))

> month_sum <- airquality %>%
      group_by(Month) %>%
      summarise(mean_temp = mean(Temp),
                sd_temp = sd(Temp))
> month_sum
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

# Use group_by() to divide the dataset by "Chick"
# Use summarise() to calculate the weight gain within each group
> weight_diff <- ChickWeight %>%
      group_by(Chick) %>%
      summarise(weight_diff = max(weight) - min(weight))
> weight_diff
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

> chick_18 <- ChickWeight %>% filter(Chick == 18)
> chick_18
  weight Time Chick Diet
1     39    0    18    1
2     35    2    18    1

> diet_summ <- ChickWeight %>%
      group_by(Diet, Chick) %>%
      summarise(weight_gain = last(weight) - first(weight)) %>%
      group_by(Diet) %>%
      summarise(mean_gain = mean(weight_gain))
> diet_summ
# A tibble: 4 × 2
    Diet mean_gain
  <fctr>     <dbl>
1      1     114.9
2      2     174.0
3      3     229.5
4      4     188.3


##Section: 07-final-considerations.R 




##Section: 08-references.R 




