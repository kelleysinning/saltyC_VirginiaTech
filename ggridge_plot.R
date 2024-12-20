# Code from Chelsa Smith 11/11/2024, annotations of here code from lines 3-34
# Copy and pasted with my own data from lines 40 +

library(tidyverse)
library(readxl)
library(lubridate)
library(ggridges)
#import and fix data################################################################################
#you really just need a dataframe with the count of each size by time. A lot of this was to fix some 
#issues in the data I'm sending you.
Monthly_data <- read_excel("~/Desktop/Hexagenia/Data/Bug_data.xlsx", 
                           sheet = "Monthly_full")
#fix length and count columns
Monthly_data$Length<-as.numeric(Monthly_data$Length)
Monthly_data$Count<-as.numeric(Monthly_data$Count)
#remove any with NA in length
Monthly_data<-Monthly_data%>%
  drop_na(Count)
#Add month column and put it in the order you need--(you could just add the month column with the 
#month() function without adding order if you don't overlap year changes like I did)
Monthly_data$Month = factor(month(Monthly_data$Date_shared,label=T, abbr = T),
                            levels = c("Feb","Mar","Apr","Jun","Jul", "Aug","Sep","Oct","Nov","Dec","Jan"))
#add area2 grouping with split into just Chatt and Flint
Monthly_data$area2<-ifelse(Monthly_data$New_name %in% c("Dam 1", "Dam 4", "Dam 8", "Dam 9"), "Flint", ifelse(
  Monthly_data$New_name %in% c("Dam 2", "Dam 3", "Dam 5", "Dam 6", "Dam 7", "Dam 10"), "Chattahoochee", Monthly_data$area))

#make ggridges plot#################################################################################
ggplot(Monthly_data, aes(Length, y = Month, fill = after_stat(x))) +
  facet_wrap(~area2)+
  geom_density_ridges_gradient(scale = 1.5, size = 0.3, alpha=.4) +
  scale_y_discrete(limits = rev(levels(Monthly_data$Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

ggsave("densiy_ridge_plot.jpeg", path="graphs/manuscript", width = 12, height= 8, unit= "in")







# Insert my data--------------------------------------------------------------

library(tidyverse)
library(readxl)
library(lubridate)
library(ggridges)


Total_Lengths <- read.csv("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/Data/saltyC_VirginiaTech/2P sheets/SECPROD_greaterandless.csv")


# FFGs

Total_Lengths$FFG[Total_Lengths$Genus=="Acerpenna"] ="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Acentrella"] = "Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Acroneuria"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Allocapnia"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Allognasta"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Alloperla"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Ameletus"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Amphinemura"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Antocha"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Atherix"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Attenella"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Baetidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Baetis"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Baetisca"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Boyeria"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Calopteryx"]=="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Capniidae"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Ceratopogonidae"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Cernotina"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Chauloides"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Chelifera"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Chimarra"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Cheumatopsyche"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Chironomidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Chironomini"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Circulionidae"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Collembola"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Cordulegaster"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Cyrnellus"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Dicranota"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Diplectrona"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Discocerina"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Dixa"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Dixella"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Dolophilodes"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Ectopria"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Eloeophila"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Epeorus"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Eriopterini"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Ephemera"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Ephemerellidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Eurylophella"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Gerris"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Glossosoma"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Goera"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Gomphus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Gomphurus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Gyrinus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Helichus"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Hemiptera"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Heptageniidae"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Hetaerina"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Hexatoma"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Hydrachnia"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Hydatophylax"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Hydropsyche"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Isonychia"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Isoperla"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Langessa"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Lanthus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Leptophlebiidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Lepidostoma"]= "Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Leuctra"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Leuctridae"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Limnephilidae"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Limnophila"]= "Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Limoniidae"]= "Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Lypodiversa"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Micrasema"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Microvelia"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Molophilus"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Neocleon"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Neophylax"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Neoplasta"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Nigronia"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Oligochaeta"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Optioservus"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Oreogeton"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Orthocladine"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Oulimnius"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Paracapnia"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Paraleptophlebiidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Polycentropodidae"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Polycentropus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Probezzia"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Prodaticus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Prosimulium"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Psephenus"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Pseudolimnophila"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Psychodini"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Pteronarcys"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Pycnopsyche"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Remenus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Rhagovelia"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Rhyacophila"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Prostoia"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Sialis"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Simulium"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Stratiomyidae"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Stylogomphus"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Tallaperla"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Stenelmis"]="Scraper"
Total_Lengths$FFG[Total_Lengths$Genus=="Stenonema"]="Scraper" 
Total_Lengths$FFG[Total_Lengths$Genus=="Taeniopteryx"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Tanypodinae"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Tanytarsini"]="Collector-Gatherer"
Total_Lengths$FFG[Total_Lengths$Genus=="Tipula"]="Shredder"
Total_Lengths$FFG[Total_Lengths$Genus=="Triacanthagyna"]="Predator"
Total_Lengths$FFG[Total_Lengths$Genus=="Wormaldia"]="Collector-Filterer"
Total_Lengths$FFG[Total_Lengths$Genus=="Zoraena"]="Predator"


# Subsetting for Leuctra----------------------
TotalLengths_leuctra <- Total_Lengths %>%
  filter(Genus == "Leuctra" & Site %in% c("EAS", "FRY", "RIC"))
  
# Fix length and count columns
TotalLengths_leuctra$Length<-as.numeric(TotalLengths_leuctra$Length)
TotalLengths_leuctra$Abundance<-as.numeric(TotalLengths_leuctra$Abundance)

# Putting months in order of how I sampled them
TotalLengths_leuctra$Sample.Month <- factor(
  TotalLengths_leuctra$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
TotalLengths_leuctra$SC.Category <- factor(TotalLengths_leuctra$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_leuctra, aes(Length, y = Sample.Month, fill = after_stat(x))) + # after_stat let's you reference a computer variable (length) during plotting...maps length values to fill aesthetic
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) + # computation of densities, kernal density estimations to get smoothed ridgelines
  scale_y_discrete(limits = rev(levels(TotalLengths_leuctra$Sample.Month)))+ # reverses order of months so it read top to bottom easier
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

ggsave("LEUCTRAdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")


# ANOVA
anova_result <- aov(Length ~ SC.Category, data = TotalLengths_leuctra)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)

print(tukey_result)
plot(tukey_result)

# Extract the result for SC.Category and convert to a data frame
tukey_result <- as.data.frame(tukey_result$SC.Category)

# Install and load kableExtra to make it pretty
install.packages("kableExtra")
library(kableExtra)

# Create and style the table
tukey_result %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)


# Subsetting for Stenonema--------------------------------------------------------
TotalLengths_stenonema <- Total_Lengths %>%
  filter(Genus == "Stenonema" & Site %in% c("EAS", "FRY", "RIC")) 

# Fix length and count columns
TotalLengths_stenonema$Length<-as.numeric(TotalLengths_stenonema$Length)
TotalLengths_stenonema$Abundance<-as.numeric(TotalLengths_stenonema$Abundance)

# Putting months in order of how I sampled them
TotalLengths_stenonema$Sample.Month <- factor(
TotalLengths_stenonema$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
TotalLengths_stenonema$SC.Category <- factor(TotalLengths_stenonema$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_stenonema, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_y_discrete(limits = rev(levels(TotalLengths_stenonema$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

ggsave("STENONEMAdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")


# ANOVA
anova_result <- aov(Length ~ SC.Category, data = TotalLengths_stenonema)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
plot(tukey_result)

tukey_result <- as.data.frame(tukey_result$SC.Category)


install.packages("kableExtra")
library(kableExtra)

tukey_result %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)


# Subsetting for Epeorus--------------------------------------------------------
TotalLengths_epeorus<- Total_Lengths %>%
  filter(Genus == "Epeorus"& Site %in% c("EAS", "FRY", "RIC"))  

# Fix length and count columns
TotalLengths_epeorus$Length<-as.numeric(TotalLengths_epeorus$Length)
TotalLengths_epeorus$Abundance<-as.numeric(TotalLengths_epeorus$Abundance)

# Putting months in order of how I sampled them
TotalLengths_epeorus$Sample.Month <- factor(
TotalLengths_epeorus$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
TotalLengths_epeorus$SC.Category <- factor(TotalLengths_epeorus$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_epeorus, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_y_discrete(limits = rev(levels(TotalLengths_epeorus$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic() # high shows up with nothing bc there is only one value, not enough to make a hump I presume

ggsave("EPEORUSdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")

# ANOVA
anova_result <- aov(Length ~ SC.Category, data = TotalLengths_epeorus)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
plot(tukey_result)



# Looking at everything--------------------------------------------------------

TotalLengths<- Total_Lengths %>%
  filter(Site %in% c("EAS", "FRY", "RIC"))  

# Fix length and count columns
Total_Lengths$Length<-as.numeric(Total_Lengths$Length)
Total_Lengths$Abundance<-as.numeric(Total_Lengths$Abundance)

# Putting months in order of how I sampled them
Total_Lengths$Sample.Month <- factor(
  Total_Lengths$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
Total_Lengths$SC.Category <- factor(Total_Lengths$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(Total_Lengths, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_y_discrete(limits = rev(levels(Total_Lengths$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

ggsave("ALLdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")

# ANOVA
anova_result <- aov(Length ~ SC.Category, data = TotalLengths)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

plot(tukey_result)

# Extract the result for SC.Category and convert to a data frame
tukey_result <- as.data.frame(tukey_result$SC.Category)


# mid-high: -0.2985. MID has a slightly shorter mean length compared to HIGH, but not sig.
# ref-high: -1.1517. REF has significantly shorter lengths than HIGH, significant
# ref- mid: -0.8531. REF has significantly shorter lengths than MID, significant

# Install and load kableExtra to make it pretty
install.packages("kableExtra")
library(kableExtra)

# Assuming scrapers_table is already in a data frame format
# Create and style the table
tukey_result %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)


# Looking at everything but filter so nothing bigger than 20 on x-axis---------------------------------------------

TotalLengths_slim<- Total_Lengths %>%
  filter(Site %in% c("EAS", "FRY", "RIC"))  

# Fix length and count columns
TotalLengths_slim$Length<-as.numeric(TotalLengths_slim$Length)
TotalLengths_slim$Abundance<-as.numeric(TotalLengths_slim$Abundance)

# Putting months in order of how I sampled them
TotalLengths_slim$Sample.Month <- factor(
  TotalLengths_slim$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
TotalLengths_slim$SC.Category <- factor(TotalLengths_slim$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_slim, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_x_continuous(limits = c(0, 20)) +
  scale_y_discrete(limits = rev(levels(TotalLengths_slim$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

ggsave("SLIMdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")

# ANOVA
anova_result <- aov(Length ~ SC.Category, data = TotalLengths_slim)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
plot(tukey_result)

# Extract the result for SC.Category and convert to a data frame
tukey_result <- as.data.frame(tukey_result$SC.Category)

# Install and load kableExtra to make it pretty
install.packages("kableExtra")
library(kableExtra)

# Assuming scrapers_table is already in a data frame format
# Create and style the table
tukey_result %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)




# Subsetting for FFGS----------------------
TotalLengths_FFG <- Total_Lengths %>%
  filter(FFG %in% c("Scraper", "Shredder") & Site %in% c("EAS", "FRY", "RIC"))

# Fix length and count columns
TotalLengths_FFG$Length<-as.numeric(TotalLengths_FFG$Length)
TotalLengths_FFG$Abundance<-as.numeric(TotalLengths_FFG$Abundance)

# Putting months in order of how I sampled them
TotalLengths_FFG$Sample.Month <- factor(
  TotalLengths_FFG$Sample.Month, 
  levels = c("September", "October", "November", "December",
             "January", "February", "March", "April", "May", 
             "June", "July", "August")
)


# Ensure SC.Category is a factor with the desired order
TotalLengths_FFG$FFG <- factor(TotalLengths_FFG$FFG, levels = c("Scraper", "Shredder"))
TotalLengths_FFG$SC.Category <- factor(TotalLengths_FFG$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_FFG, aes(Length, y = Sample.Month, fill = after_stat(x))) + # after_stat let's you reference a computer variable (length) during plotting...maps length values to fill aesthetic
  facet_wrap(FFG~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) + # computation of densities, kernal density estimations to get smoothed ridgelines
  scale_x_continuous(limits = c(0, 20)) +
  scale_y_discrete(limits = rev(levels(TotalLengths_FFG$Sample.Month)))+ # reverses order of months so it read top to bottom easier
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()


ggsave("FFGdensity_ridge_plot.jpeg", path="Graphs/ggridge", width = 12, height= 8, unit= "in")

# ANOVA
anova_result <- aov(Length ~ FFG*SC.Category, data = TotalLengths_FFG)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
plot(tukey_result)

# Extract the result for SC.Category and convert to a data frame
tukey_result <- as.data.frame(tukey_result$`FFG:SC.Category`)

# Install and load kableExtra to make it pretty
install.packages("kableExtra")
library(kableExtra)

# Assuming scrapers_table is already in a data frame format
# Create and style the table
tukey_result %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)



