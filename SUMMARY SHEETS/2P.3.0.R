# Secondary production code for Kelley Sinning Salty Carbon Data

rm(list=ls())  # clears workspace                     

#load important packages##
library(ggplot2)
library(gridExtra)
library(viridis)
library(ggthemes)
library(dplyr)
library(tidyverse)
library(RColorBrewer)
library(rcartocolor)
library(dplyr)
library(purrr)

setwd("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/Data/saltyC_VirginiaTech/SUMMARY SHEETS")

# Bringing in total prod csv from 2P_2.0.R to cut out a lot of coding from previous scripts!
TOTAL_PROD_lengths <- read.csv("TOTALPROD.csv")

# Keeping only the necessary columns
TOTALPROD_Summary <- TOTAL_PROD_lengths %>%
  group_by(Site, Genus) %>%
  summarise(
    Production.Uncorrected = mean(Production.Uncorrected, na.rm = TRUE),
    CPI = mean(CPI, na.rm = TRUE),
    Annual.Production = mean(Annual.Production, na.rm = TRUE),
    AnnualP.B = mean(AnnualP.B, na.rm = TRUE),
    Daily.Growth = mean(Daily.Growth, na.rm = TRUE),
    .groups = 'drop' # Specify .groups only once
  )


TOTALPROD_sum <- TOTALPROD_Summary %>%
  group_by(Site) %>%
  summarise(Sum.Annual.Production = sum(Annual.Production, na.rm = TRUE), .groups = 'drop')


TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Acerpenna"] ="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Acentrella"] = "Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Acroneuria"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Allocapnia"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Allognasta"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Alloperla"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ameletus"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Amphinemura"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Antocha"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Atherix"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Attenella"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Baetidae"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Baetis"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Baetisca"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Boyeria"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Calopteryx"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Capniidae"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ceratopogonidae"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Cernotina"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Chauloides"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Chelifera"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Chimarra"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Cheumatopsyche"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Chironomidae"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Chironomini"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Circulionidae"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Collembola"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Cordulegaster"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Cyrnellus"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Dicranota"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Diplectrona"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Discocerina"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Dixa"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Dixella"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Dolophilodes"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ectopria"]="Coleoptera Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Eloeophila"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Epeorus"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Eriopterini"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ephemera"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ephemerellidae"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Eurylophella"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Gerris"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Glossosoma"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Goera"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Gomphus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Gomphurus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Gyrinus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Helichus"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hemiptera"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Heptageniidae"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hetaerina"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hexatoma"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hydrachnia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hydatophylax"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Hydropsyche"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Isonychia"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Isoperla"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Langessa"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Lanthus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Leptophlebiidae"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Lepidostoma"]= "Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Leuctra"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Leuctridae"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Limnephilidae"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Limnophila"]= "Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Limoniidae"]= "Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Lypodiversa"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Micrasema"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Microvelia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Molophilus"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Neocleon"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Neophylax"]="Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Neoplasta"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Nigronia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Oligochaeta"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Optioservus"]="Coleoptera Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Oreogeton"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Orthocladine"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Oulimnius"]="Coleoptera Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Paracapnia"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Paraleptophlebia"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Polycentropodidae"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Polycentropus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Probezzia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Prodaticus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Prosimulium"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Psephenus"]="Coleoptera Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Pseudolimnophila"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Psychodini"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Pteronarcys"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Pycnopsyche"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Remenus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Rhagovelia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Rhyacophila"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Prostoia"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Sialis"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Simulium"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Stratiomyidae"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Stylogomphus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Tallaperla"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Stenelmis"]="Coleoptera Scraper"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Stenonema"]="Scraper" 
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Taeniopteryx"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Tanypodinae"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Tanytarsini"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Tipula"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Triacanthagyna"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Wormaldia"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Zoraena"]="Predator"
TOTALPROD_Summary <- TOTALPROD_Summary %>%
  filter(!str_detect(Genus, "Hagenella|Stagnicola"))


TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="EAS"] = "16"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="CRO"] = "40"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HCN"] = "77"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HUR"] = "293"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="FRY"] = "350"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RUT"] = "447"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLW"] = "1048"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLC"] = "1083"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RIC"] = "1185"

TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="EAS"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="CRO"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="HCN"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="HUR"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="FRY"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="RUT"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="LLW"] = "HIGH"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="LLC"] = "HIGH"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="RIC"] = "HIGH"



TOTALPROD_Summary$Site <- factor(TOTALPROD_Summary$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
TOTALPROD_Summary$SC.Category <- factor(TOTALPROD_Summary$SC.Category, levels = c("REF","MID","HIGH"))
TOTALPROD_Summary$SC.Level <- factor(TOTALPROD_Summary$SC.Level, levels = c("16","40","77","293","350","447","1048","1083","1185"))
TOTALPROD_Summary$FFG <- factor(TOTALPROD_Summary$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))

TOTALPROD_Summary <- TOTALPROD_Summary %>%
  filter(!is.na(FFG))  # anything without an FFG assigned



# Starting figures--------------------------------------------------------------

install.packages("rcartocolor")# Colorblind color schemes
library(rcartocolor)
display_carto_all()
library(dplyr)
install.packages("ggplot2")
library(ggplot2)



my_colors = carto_pal(7, "Geyser") # to get hexcodes 
my_colors

ffg_colors <- c("Scraper" = "#008080", 
                "Coleoptera Scraper" = "#B4C8A8",
                "Shredder" = "#CA562C", 
                "Predator" = "#F6EDBD", 
                "Collector-Gatherer" = "#DE8A5A", 
                "Collector-Filterer" = "#70A494")  



# Proportion party

# Now to do actual proportions, scaling everything to 100% production for each site
TOTALPROD_Summary_site <- TOTALPROD_Summary %>%
  group_by(Site, SC.Level) %>%
  summarise(TOTALPROD_Summary = sum(Annual.Production)) # summing the annual production for each site


df_proportions_site <- TOTALPROD_Summary %>% # Calculate proportions of total production for each FFG for each site
  left_join(TOTALPROD_Summary_site, by = "SC.Level") %>%
  group_by(SC.Level, FFG) %>%
  summarise(Proportion = sum(Annual.Production) / first(TOTALPROD_Summary)) # Summing annual production
#for each FFG for each site and dividing it by summed annual production for each site

propgg_site = ggplot(df_proportions_site, aes(x = SC.Level, y = Proportion, fill = FFG)) +
  geom_bar(stat = "identity") +
  labs(x = "SC.Level", y = "Proportion of Total Production", fill = "FFGs") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign specific colors
  theme_minimal()

propgg_site


# bars side by side
propgg_site = ggplot(df_proportions_site, aes(x = SC.Level, y = Proportion, fill = FFG)) + 
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +  # Adjust bar width for better spacing
  labs(x = "SC.Level", y = "Proportion of Total Production", fill = "FFG") + 
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign specific colors
  theme_minimal()

propgg_site


# Pie chart

propgg_pie <- ggplot(df_proportions_site, aes(x = "", y = Proportion, fill = FFG)) +
  geom_bar(stat = "identity", width = 1, color = "white") +  # Create the bar chart
  coord_polar(theta = "y") +  # Convert to a pie chart
  facet_wrap(~ SC.Level, labeller = labeller(SC.Level = function(x) paste0(x, " µS/cm"))) +  # Add unit
  labs(x = NULL, y = NULL, fill = "FFG") +  # Remove axis labels
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign colors
  theme_void() +  # Clean up background
  theme(
    legend.position = "right",  # Adjust legend position
    strip.text = element_text(size = 15) #face = "regular")  # Increase facet label size
  )

propgg_pie




# Moving into linear 

TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="EAS"] = "16"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="CRO"] = "40"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="HCN"] = "77"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="HUR"] = "293"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="FRY"] = "350"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="RUT"] = "447"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="LLW"] = "1048"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="LLC"] = "1083"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="RIC"] = "1185"

TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="EAS"] = "REF"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="CRO"] = "REF"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="HCN"] = "REF"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="HUR"] = "MID"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="FRY"] = "MID"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="RUT"] = "MID"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="LLW"] = "HIGH"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="LLC"] = "HIGH"
TOTALPROD_sum$SC.Category[TOTALPROD_sum$Site =="RIC"] = "HIGH"



TOTALPROD_sum$Site <- factor(TOTALPROD_sum$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
TOTALPROD_sum$SC.Category <- factor(TOTALPROD_sum$SC.Category, levels = c("REF","MID","HIGH"))
TOTALPROD_sum$SC.Level <- factor(TOTALPROD_sum$SC.Level, levels = c("16","40","77","293","350","447","1048","1083","1185"))


TOTALPROD_sum$SC.Level <- as.numeric(as.character(TOTALPROD_sum$SC.Level))# Ensure SC.Level is numeric

TOTALPROD_sum$Site.Type <- ifelse(TOTALPROD_sum$Site %in% c("EAS", "FRY", "RIC"), 
                                  "Core Streams", "Quarterly Streams")# Create a categorical variable for site type

TOTALPROD_sum$Site.Type <- factor(TOTALPROD_sum$Site.Type, levels = c("Quarterly Streams", "Core Streams"))# Convert Site.Type to a factor for proper legend display

install.packages("ggpmisc")
library(ggpmisc)

# PRODUCTION ALONG SC GRADIENT GLM...FINAL FIGURE
glm_model <- glm(Sum.Annual.Production ~ SC.Level, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = TOTALPROD_sum)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


prod <- ggplot(TOTALPROD_sum, aes(x = SC.Level, y = Sum.Annual.Production, color = SC.Level)) +   
  geom_point(aes(shape = Site.Type), size = 3) +  
  geom_smooth(method = "glm", method.args = list(family = "gaussian"), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(TOTALPROD_sum$SC.Level), 
           y = max(TOTALPROD_sum$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +   
  xlab("Specific Conductivity (µS/cm)") +   
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +  
  scale_shape_manual(values = c("Quarterly Streams" = 16, "Core Streams" = 8)) +  
  theme_bw() +   
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  ) +
  coord_cartesian(ylim = range(TOTALPROD_sum$Sum.Annual.Production, na.rm = TRUE) * c(0.0, 1.1))


prod  # Display the plot


# COMPUTE GLMs PER FFG...FINAL FIGURE!!!!!
TOTALPROD_Summary_Sum <- TOTALPROD_Summary %>% # new df for FFG facet wraps
  group_by(Site,FFG, SC.Level) %>%
  summarise(
    Summed.Annual.Production = sum((Annual.Production), na.rm = TRUE),
    SC.Category = first(SC.Category)  
  )


TOTALPROD_Summary_Sum$SC.Level <- as.numeric(as.character(TOTALPROD_Summary_Sum$SC.Level))# Ensure SC.Level is numeric

TOTALPROD_Summary_Sum$Site.Type <- ifelse(TOTALPROD_Summary_Sum$Site %in% c("EAS", "FRY", "RIC"), 
                                          "Core Streams", "Quarterly Streams")# Create a categorical variable for site type

TOTALPROD_Summary_Sum$Site.Type <- factor(TOTALPROD_Summary_Sum$Site.Type, levels = c("Quarterly Streams", "Core Streams"))# Convert Site.Type to a factor for proper legend display


ggplot(TOTALPROD_Summary_Sum, aes(x = SC.Level, y = Summed.Annual.Production)) + 
  geom_point(aes(color = SC.Level), size = 3, alpha = 0.7) +  
  facet_wrap(~FFG, scales = "free") +  # Facet by FFG
  theme_bw() + 
  labs(x = "Specific Conductivity (µS/cm)", y = "Summed Annual Production") +
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +
  theme(
    strip.text = element_text(size = 12),  # Facet labels size
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 12),
    panel.grid = element_blank()
  )

plot(TOTALPROD_Summary_Sum$SC.Level, TOTALPROD_Summary_Sum$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma




glm_results <- TOTALPROD_Summary_Sum %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ SC.Level, 
                         family = Gamma(link = "log"), 
                         #family = gaussian(link = "identity"),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )

# At this point, p_value, pseudo_r2, p_label, and r2_label are all in the `glm_results` dataframe.

# Merge with main dataset
TOTALPROD_Summary_Sum <- TOTALPROD_Summary_Sum %>%
  left_join(glm_results, by = "FFG")

TOTALPROD_Summary_Sum$SC.Level <- as.numeric(as.character(TOTALPROD_Summary_Sum$SC.Level))


# Plot to scale
ggplot(TOTALPROD_Summary_Sum, aes(x = SC.Level, y = Summed.Annual.Production)) + 
  geom_point(aes(color = SC.Level, shape = Site.Type), size = 3, alpha = 0.8) +  # Color points by SC.Level
  geom_smooth(method = "glm", method.args = list(family = Gamma (link = "log")), se = TRUE, color = "grey37") + 
  # Add p-values and R² to each facet in the bottom left corner
  geom_text(data = glm_results, aes(
    x = min(TOTALPROD_Summary_Sum$SC.Level),  # Place the text at the bottom left of each facet
    y = min(TOTALPROD_Summary_Sum$Summed.Annual.Production),  # Adjust y to the lower bound
    label = paste("R² =", r2_label, "\nP =", p_label)),
    hjust = 0, vjust = .1 , size = 3, alpha = 2, inherit.aes = FALSE) +  # Position text at bottom-left
  facet_wrap(~FFG, scales = "free") +  # Facet by FFG with independent scaling per facet
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Specific Conductivity (µS/cm)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +  # Gradient color scale
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) +
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white"),
    strip.text = element_text(size = 12),
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  )


# NOT scaled
ggplot(TOTALPROD_Summary_Sum, aes(x = SC.Level, y = Summed.Annual.Production)) + 
  geom_point(aes(color = SC.Level)) +  # Color points by SC.Level
  geom_smooth(method = "glm", method.args = list(family = Gamma (link = "log")), se = FALSE, color = "grey37") + 
  geom_text(data = glm_results, aes(
    x = min(TOTALPROD_Summary_Sum$SC.Level),  # Place the text at the top-left of each facet
    y = max(TOTALPROD_Summary_Sum$Summed.Annual.Production),  # Adjust y to the upper bound
    label = paste("R² =", r2_label, "\nP =", p_label)),
    hjust = 0, vjust = 1, size = 3, inherit.aes = FALSE, alpha = 0) +  # Smaller text and position at top-left
  facet_wrap(~FFG, scales = "free") +  # Facet by FFG with independent scaling per facet
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Specific Conductivity (µS/cm)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +  # Gradient color scale
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white"),
    strip.text = element_text(size = 12),  # Make facet labels readable
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  )





# Adding in food resources------------------------------------------------------

CBOM=read.csv("CBOM.Year1Summary.csv")
FBOM=read.csv("FBOM.Year1Summary.csv")
Algae=read.csv("Algae.Year1Summary.csv")

CBOM <- CBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample.Month) %>%
  summarise(
    mean.CBOM = mean(CBOM.AFDM.g.m2., na.rm = TRUE)
  ) %>%
  group_by(Site) %>%
  summarise(
    annual.mean.CBOM = mean(mean.CBOM, na.rm = TRUE)  # Use mean.CBOM to get the annual mean
  )

str(FBOM)

FBOM <- FBOM %>%
  mutate(FBOM.AFDM.g.m2. = parse_number(FBOM.AFDM.g.m2.))


FBOM <- FBOM %>%
  mutate(
    Site = str_trim(Site),  # Remove extra spaces
    FBOM.AFDM.g.m2. = as.numeric(FBOM.AFDM.g.m2.)  # Convert to numeric if needed
  ) %>%
  group_by(Site, Sample.Month) %>%
  summarise(
    mean.FBOM = mean(FBOM.AFDM.g.m2., na.rm = TRUE), 
    .groups = "drop"  # Removes automatic grouping
  ) %>%
  group_by(Site) %>%
  summarise(
    annual.mean.FBOM = mean(mean.FBOM, na.rm = TRUE),
    .groups = "drop"
  )


Algae <- Algae %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample.Month) %>%
  summarise(
    mean.Algae = mean(Algae.AFDM.g.m2., na.rm = TRUE),
    mean.AI = mean(Autotrophic.Index..g.m2., na.rm = TRUE),
    mean.chla = mean(Chl.a..g.m2., na.rm = TRUE)
  ) %>%
  group_by(Site) %>%
  summarise(
    annual.mean.Algae = mean(mean.Algae, na.rm = TRUE),
    annual.mean.AI = mean(mean.AI, na.rm = TRUE),
    annual.mean.chla = mean(mean.chla, na.rm = TRUE),
  )


food <- cbind(CBOM,FBOM,Algae)
food <- CBOM %>%
  left_join(FBOM, by = "Site") %>%
  left_join(Algae, by = "Site")


# THIS is the "totals" dataframes...linking production with food
prod.food <- cbind(food, TOTALPROD_sum)
prod.food <- left_join(food, TOTALPROD_sum, by = c("Site"))


prod.food.ffg <-cbind(food, TOTALPROD_Summary_Sum)
prod.food.ffg <- left_join(food, TOTALPROD_Summary_Sum, by = c("Site"))

colnames(prod.food.ffg)  # Lists all column names


prod.food.ffg <- prod.food.ffg %>%
  mutate(Site_FFG = paste(Site, FFG, sep = "."))  # Creates unique site-FFG names

prod.food <- prod.food %>%
  mutate(fbom.cbom = annual.mean.FBOM + annual.mean.CBOM) # column with fbom+cbom combined

prod.food.ffg <- prod.food.ffg %>%
  mutate(fbom.cbom = annual.mean.FBOM + annual.mean.CBOM) # column with fbom+cbom combined






# FOOD DYNAMICS ALOMG SC GRADIENT...FINAL FIGURES-------------------------------

#CBOM----------------------------
plot(prod.food$SC.Level, prod.food$annual.mean.CBOM) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.CBOM ~ SC.Level, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


CBOM.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.CBOM, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.CBOM), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 2) + 
  ylab(expression("Mean annual CBOM (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

CBOM.sc.lm



#FBOM----------------------------
plot(prod.food$SC.Level,prod.food$annual.mean.FBOM) # variance doesn't increase with more positive values-->gaussian

glm_model <- glm(annual.mean.FBOM ~ SC.Level, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


FBOM.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.FBOM, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.FBOM), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual FBOM (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

FBOM.sc.lm



#FBOM + CBOM----------------------------
plot(prod.food$SC.Level, prod.food$fbom.cbom) # variance doesn't increase with more positive values-->gaussian

glm_model <- glm(fbom.cbom ~ SC.Level, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


FBOM.CBOM.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = fbom.cbom, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$fbom.cbom), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 2) + 
  ylab(expression("Mean annual leaf litter standing stock (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

FBOM.CBOM.sc.lm


#ALGAE----------------------------
plot(prod.food$SC.Level,prod.food$annual.mean.Algae) # variance increases with greater values, postively, right skewed --> Gamma

glm_model <- glm(annual.mean.Algae ~ SC.Level, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


Algae.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.Algae, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "Gamma"(link= "log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.Algae), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual Algae standing stock (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

Algae.sc.lm



#AUTOTROPHIC INDEX----------------------------
plot(prod.food$SC.Level,prod.food$annual.mean.AI) # variance increases with greater values, postively, right skewed --> Gamma

glm_model <- glm(annual.mean.AI ~ SC.Level, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


AI.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.AI, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "Gamma"(link="log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.AI), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual autotrophic index (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

AI.sc.lm




#CHL-A----------------------------
plot(prod.food$SC.Level,prod.food$annual.mean.chla) # variance doesn't increases with greater values--> gaussian

glm_model <- glm(annual.mean.chla ~ SC.Level, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


chla.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.chla, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.chla), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual chlorophyll-a (g/m²)")) +  
  xlab("Specific Conductivity (µS/cm)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

chla.sc.lm






# PRODUCTION AND STANDING STOCK, NOT WITH FFG-------------------------------------

#CBOM----------------------------
plot(prod.food$annual.mean.CBOM, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.CBOM ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


CBOM.prod.lm <- ggplot(prod.food, aes(x = annual.mean.CBOM, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$annual.mean.CBOM), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual CBOM (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

CBOM.prod.lm


#FBOM----------------------------
plot(prod.food$annual.mean.FBOM, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.FBOM ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


FBOM.prod.lm <- ggplot(prod.food, aes(x = annual.mean.FBOM, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$annual.mean.FBOM), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual FBOM (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

FBOM.prod.lm

#FBOM + CBOM----------------------------
plot(prod.food$fbom.cbom, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(fbom.cbom ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


FBOM.CBOM.prod.lm <- ggplot(prod.food, aes(x = fbom.cbom, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$fbom.cbom), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual leaf litter standing stock (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

FBOM.CBOM.prod.lm



#ALGAE----------------------------
plot(prod.food$annual.mean.Algae, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.Algae ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


Algae.prod.lm <- ggplot(prod.food, aes(x = annual.mean.Algae, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$annual.mean.Algae), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual algae standing stock (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

Algae.prod.lm


#AUTOTROPHIC INDEX----------------------------

plot(prod.food$annual.mean.AI, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.AI ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


AI.prod.lm <- ggplot(prod.food, aes(x = annual.mean.AI, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$annual.mean.AI), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 2) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual autotrophic index (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

AI.prod.lm


#CHL-A----------------------------

plot(prod.food$annual.mean.chla, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_model <- glm(annual.mean.chla ~ Sum.Annual.Production, 
                 #family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


chla.prod.lm <- ggplot(prod.food, aes(x = annual.mean.chla, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "gaussian"(link="identity")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$annual.mean.chla), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust= 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual chlorophyll-a (g/m²)") +  # Corrected X-axis label
  scale_colour_gradient(
    low = "#70A494", 
    high = "#CA562C",
    name = "Specific Conductivity"  # Labeled scale bar
  ) +  
  scale_shape_manual(
    values = c("Quarterly Streams" = 16, "Core Streams" = 8)
  ) +  # Define shapes properly
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),  # Adjusted legend title size
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

chla.prod.lm

# production and standing stock facet wrapped with FFG------------------------------
prod.food.ffg$SC.Level <- as.numeric(as.character(prod.food.ffg$SC.Level))# Ensure SC.Level is numeric

prod.food.ffg$Site.Type <- ifelse(prod.food.ffg$Site %in% c("EAS", "FRY", "RIC"), 
                                          "Core Streams", "Quarterly Streams")# Create a categorical variable for site type

prod.food.ffg$Site.Type <- factor(prod.food.ffg$Site.Type, levels = c("Quarterly Streams", "Core Streams"))# Convert Site.Type to a factor for proper legend display



# CBOM-----------------------------------
plot(prod.food.ffg$annual.mean.CBOM, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.CBOM, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )



# At this point, p_value, pseudo_r2, p_label, and r2_label are all in the `glm_results` dataframe.

# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")

cor(prod.food.ffg$annual.mean.CBOM, prod.food.ffg$Summed.Annual.Production)

production_cbom_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.CBOM, y = Summed.Annual.Production, color = SC.Level) 
) +
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) +  
  geom_smooth(method = "glm", method.args = list(family = gaussian (link = "identity")), se = TRUE, color = "grey37") +  
  geom_text(data = glm_results, aes(
    x = min(prod.food.ffg$annual.mean.CBOM),
    y = quantile(prod.food.ffg$Summed.Annual.Production, 0.1),
    label = paste("R² =", r2_label, "\nP =", p_label),
    group = FFG
  ), hjust = 0, vjust = 0.1, size = 3, alpha = 0, inherit.aes = FALSE) +  
  facet_wrap(~FFG, scales = "free") +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +  
  xlab("Mean annual CBOM (g/m²)") +  
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +  
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) +
  theme_bw() +  
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white"),
    strip.text = element_text(size = 12),
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  )

production_cbom_lm




# FBOM-----------------------------------

plot(prod.food.ffg$annual.mean.FBOM, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.FBOM, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )

# At this point, p_value, pseudo_r2, p_label, and r2_label are all in the `glm_results` dataframe.

# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")


production_fbom_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.FBOM, y = Summed.Annual.Production, color = SC.Level) 
) +
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) +  
  geom_smooth(method = "glm", method.args = list(family = gaussian (link = "identity")), se = TRUE, color = "grey37") +  
  geom_text(data = glm_results, aes(
    x = min(prod.food.ffg$annual.mean.FBOM),
    y = quantile(prod.food.ffg$Summed.Annual.Production, 0.1),
    label = paste("R² =", r2_label, "\nP =", p_label),
    group = FFG
  ), hjust = 0.1, vjust = 0.1, size = 3, alpha = 2, inherit.aes = FALSE) +  
  facet_wrap(~FFG, scales = "free") +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +  
  xlab("Mean annual FBOM (g/m²)") +  
  scale_colour_gradient(low = "#70A494", high = "#CA562C") +  
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) +
  theme_bw() +  
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white"),
    strip.text = element_text(size = 12),
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  )+ 
  scale_x_continuous(
    limits = c(min(prod.food.ffg$annual.mean.FBOM) * 0.9, max(prod.food.ffg$annual.mean.FBOM) * 1),  # Add cushion to both ends
    expand = c(0.05, 0.02)  # Add padding to the x-axis ends
  )+ 
  scale_y_continuous(expand = c(0.05, 0.05))  # Add padding to the y-axis to ensure points don't get cut off


production_fbom_lm


# CBOM + FBOM-----------------------------------

plot(prod.food.ffg$fbom.cbom, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ fbom.cbom, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )

library(purrr)

# Extract the coefficients and create the equation for each glm model
glm_results <- glm_results %>%
  mutate(
    equation = map(glm_model, ~paste("y =", round(coef(.x)[1], 2), 
                                     "+", round(coef(.x)[2], 2), "*x"))
  )

# Check the output
glm_results

# At this point, p_value, pseudo_r2, p_label, and r2_label are all in the `glm_results` dataframe.

# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")



# Create the plot
production_cbomfbom_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = fbom.cbom, y = Summed.Annual.Production, color = SC.Level)
) + 
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) + 
  geom_smooth(method = "glm", method.args = list(family = gaussian(link = "identity")), se = TRUE, color = "grey37") + 
  #geom_text(data = glm_results, aes(
    #x = min(prod.food.ffg$fbom.cbom) * 0.95,  # Adjust to move the label to the left of the plot
    #y = quantile(prod.food.ffg$Summed.Annual.Production, 0.9),  # Move label upwards to avoid overlap
    #label = paste("R² =", r2_label, "\nP =", p_label), 
    #group = FFG),
    #hjust = 0, vjust = 1, size = 3, alpha = 1, inherit.aes = FALSE) + 
  facet_wrap(~FFG, scales = "free") +  # Allow free y-axis scales
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Mean annual leaf litter standing stock (g/m²)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") + 
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) + 
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15), 
    axis.text = element_text(size = 15), 
    panel.grid = element_blank(), 
    axis.line = element_line(), 
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"), 
    legend.position = "top", 
    legend.title = element_blank(), 
    legend.text = element_text(size = 10), 
    legend.background = element_blank(), 
    legend.key = element_rect(fill = "white", color = "white"), 
    strip.text = element_text(size = 12), 
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  ) + 
  scale_x_continuous(
    limits = c(min(prod.food.ffg$fbom.cbom) * 0.9, max(prod.food.ffg$fbom.cbom) * 0.9),  # Add cushion to both ends
    expand = c(0.05, 0.05)  # Add padding to the x-axis ends
  ) + 
  scale_y_continuous(expand = c(0.05, 0.05))  # Add padding to the y-axis to ensure points don't get cut off

# Print the plot
production_cbomfbom_lm



# Algae------------------------------

plot(prod.food.ffg$annual.mean.Algae, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.Algae, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )


# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")



# Create the plot
production_algae_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.Algae, y = Summed.Annual.Production, color = SC.Level)
) + 
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) + 
  geom_smooth(method = "glm", method.args = list(family = gaussian(link = "identity")), se = TRUE, color = "grey37") + 
  #geom_text(data = glm_results, aes(
    #x = min(prod.food.ffg$annual.mean.Algae) * 1,  # Adjust to move the label to the left of the plot
    #y = quantile(prod.food.ffg$Summed.Annual.Production, 0.9),  # Move label upwards to avoid overlap
    #label = paste("R² =", r2_label, "\nP =", p_label), 
    #group = FFG),
    #hjust = 0, vjust = 1, size = 3, alpha = 1, inherit.aes = FALSE) + 
  facet_wrap(~FFG, scales = "free") +  # Allow free y-axis scales
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Mean annual algae standing stock (g/m²)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") + 
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) + 
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15), 
    axis.text = element_text(size = 15), 
    panel.grid = element_blank(), 
    axis.line = element_line(), 
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"), 
    legend.position = "top", 
    legend.title = element_blank(), 
    legend.text = element_text(size = 10), 
    legend.background = element_blank(), 
    legend.key = element_rect(fill = "white", color = "white"), 
    strip.text = element_text(size = 12), 
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  ) + 
  scale_x_continuous(
    limits = c(min(prod.food.ffg$annual.mean.Algae), max(prod.food.ffg$annual.mean.Algae) * 1.05),  # Adjusted cushion for both ends
    expand = c(0.05, 0)  # Remove extra space on x-axis
  ) + 
  scale_y_continuous(expand = c(0.0, 0.2))  # Add padding to the y-axis to ensure points don't get cut off

# Print the plot
production_algae_lm





# Chl-a------------------------------

plot(prod.food.ffg$annual.mean.chla, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.chla, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )


# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")



# Create the plot
production_chla_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.chla, y = Summed.Annual.Production, color = SC.Level)
) + 
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) + 
  geom_smooth(method = "glm", method.args = list(family = gaussian(link = "identity")), se = TRUE, color = "grey37") + 
  geom_text(data = glm_results, aes(
    x = min(prod.food.ffg$annual.mean.chla) * 1,  # Adjust to move the label to the left of the plot
    y = quantile(prod.food.ffg$Summed.Annual.Production, 0.9),  # Move label upwards to avoid overlap
    label = paste("R² =", r2_label, "\nP =", p_label), 
    group = FFG),
    hjust = 0, vjust = 1, size = 3, alpha = 1, inherit.aes = FALSE) + 
  facet_wrap(~FFG, scales = "free") +  # Allow free y-axis scales
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Mean annual chl-a (g/m²)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") + 
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) + 
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15), 
    axis.text = element_text(size = 15), 
    panel.grid = element_blank(), 
    axis.line = element_line(), 
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"), 
    legend.position = "top", 
    legend.title = element_blank(), 
    legend.text = element_text(size = 10), 
    legend.background = element_blank(), 
    legend.key = element_rect(fill = "white", color = "white"), 
    strip.text = element_text(size = 12), 
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  ) + 
  scale_x_continuous(
    limits = c(min(prod.food.ffg$annual.mean.chla), max(prod.food.ffg$annual.mean.chla) * 1.05),  # Adjusted cushion for both ends
    expand = c(0.05, 0)  # Remove extra space on x-axis
  ) + 
  scale_y_continuous(expand = c(0.0, 0.2))  # Add padding to the y-axis to ensure points don't get cut off

# Print the plot
production_chla_lm




# Autotrophic index---------------------------

plot(prod.food.ffg$annual.mean.AI, prod.food.ffg$Summed.Annual.Production) # variance increases with greater values, postively, right skewed --> Gamma


glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.AI, 
                         #family = Gamma(link = "log"), # this yielded a very unfit model
                         family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    
    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )


# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")



# Create the plot
production_AI_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.AI, y = Summed.Annual.Production, color = SC.Level)
) + 
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) + 
  geom_smooth(method = "glm", method.args = list(family = gaussian(link = "identity")), se = TRUE, color = "grey37") + 
  geom_text(data = glm_results, aes(
  x = min(prod.food.ffg$annual.mean.AI) * 1,  # Adjust to move the label to the left of the plot
  y = quantile(prod.food.ffg$Summed.Annual.Production, 0.9),  # Move label upwards to avoid overlap
  label = paste("R² =", r2_label, "\nP =", p_label), 
  group = FFG),
  hjust = 0, vjust = 1, size = 3, alpha = 1, inherit.aes = FALSE) + 
  facet_wrap(~FFG, scales = "free") +  # Allow free y-axis scales
  ylab(expression(Secondary~Production~(g/m^2/yr))) + 
  xlab("Mean annual autotrophic index (g/m²)") + 
  scale_colour_gradient(low = "#70A494", high = "#CA562C") + 
  scale_shape_manual(values = c("Core Streams" = 8, "Quarterly Streams" = 16)) + 
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15), 
    axis.text = element_text(size = 15), 
    panel.grid = element_blank(), 
    axis.line = element_line(), 
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"), 
    legend.position = "top", 
    legend.title = element_blank(), 
    legend.text = element_text(size = 10), 
    legend.background = element_blank(), 
    legend.key = element_rect(fill = "white", color = "white"), 
    strip.text = element_text(size = 12), 
    plot.margin = unit(c(1, 2, 1, 1), "cm")
  ) + 
  scale_x_continuous(
    limits = c(min(prod.food.ffg$annual.mean.AI), max(prod.food.ffg$annual.mean.AI) * 1.05),  # Adjusted cushion for both ends
    expand = c(0.05, 0)  # Remove extra space on x-axis
  ) + 
  scale_y_continuous(expand = c(0.0, 0.4))  # Add padding to the y-axis to ensure points don't get cut off

# Print the plot
production_AI_lm



# Looking at 2P rate of response to resources across SC.Categories--------------------------

# FBOM AND CBOM--------------------------
plot(prod.food$fbom.cbom, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_results <- prod.food %>%
  group_by(SC.Category) %>%
  do({
    model <- glm(Sum.Annual.Production ~ fbom.cbom, family = gaussian(link="identity"), data = .)
    # Extract p-value and R² from the model
    p_value <- summary(model)$coefficients[2, 4]  # p-value for fbom.cbom
    r2 <- 1 - sum(residuals(model)^2) / sum((.$Sum.Annual.Production - mean(.$Sum.Annual.Production, na.rm = TRUE))^2)  # R²
    data.frame(p_value = p_value, r2 = r2)
  }) %>%
  ungroup() %>%
  mutate(
    label = paste0("P = ", signif(p_value, 3), "\nR² = ", signif(r2, 3))  # Format label text
  )



FBOM.CBOM.lm.cat <- ggplot(prod.food, aes(x = fbom.cbom, y = Sum.Annual.Production, color = SC.Category)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  
  geom_smooth(aes(group = SC.Category), method = "glm", method.args = list(family = gaussian(link="identity")), se = FALSE) +  
  geom_text(data = glm_results, aes(
    x = min(prod.food$fbom.cbom) + 0.05 * (max(prod.food$fbom.cbom) - min(prod.food$fbom.cbom)),  # Adjust x position
    y = max(prod.food$Sum.Annual.Production) - 0.1 * (max(prod.food$Sum.Annual.Production) - min(prod.food$Sum.Annual.Production)) * as.numeric(factor(SC.Category)),  # Different y offsets per category
    label = label, 
    color = SC.Category  # Color the text based on SC.Category
  ), inherit.aes = FALSE, hjust = 0, size = 5, alpha = 0) +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +  
  xlab("Mean annual leaf litter standing stock (g/m²)") +  
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C"), name = "SC Category") +  
  scale_shape_manual(values = c("Quarterly Streams" = 16, "Core Streams" = 8)) +  
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

FBOM.CBOM.lm.cat


# ALGAE---------------------------------------
plot(prod.food$annual.mean.Algae, prod.food$Sum.Annual.Production) # variance doesn't increase significantly with more positive values-->gaussian

glm_results <- prod.food %>%
  group_by(SC.Category) %>%
  do({
    model <- glm(Sum.Annual.Production ~ annual.mean.Algae, family = gaussian(link="identity"), data = .)
    # Extract p-value and R² from the model
    p_value <- summary(model)$coefficients[2, 4]  # p-value for fbom.cbom
    r2 <- 1 - sum(residuals(model)^2) / sum((.$Sum.Annual.Production - mean(.$Sum.Annual.Production, na.rm = TRUE))^2)  # R²
    data.frame(p_value = p_value, r2 = r2)
  }) %>%
  ungroup() %>%
  mutate(
    label = paste0("P = ", signif(p_value, 3), "\nR² = ", signif(r2, 3))  # Format label text
  )



Algae.lm.cat <- ggplot(prod.food, aes(x = annual.mean.Algae, y = Sum.Annual.Production, color = SC.Category)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  
  geom_smooth(aes(group = SC.Category), method = "glm", method.args = list(family = gaussian(link="identity")), se = FALSE) +  
  geom_text(data = glm_results, aes(
    x = min(prod.food$annual.mean.Algae) + 0.05 * (max(prod.food$annual.mean.Algae) - min(prod.food$annual.mean.Algae)),  # Adjust x position
    y = max(prod.food$Sum.Annual.Production) - 0.1 * (max(prod.food$Sum.Annual.Production) - min(prod.food$Sum.Annual.Production)) * as.numeric(factor(SC.Category)),  # Different y offsets per category
    label = label, 
    color = SC.Category  # Color the text based on SC.Category
  ), inherit.aes = FALSE, hjust = 0, size = 5, alpha = 2) +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +  
  xlab("Mean annual algae standing stock (g/m²)") +  
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C"), name = "SC Category") +  
  scale_shape_manual(values = c("Quarterly Streams" = 16, "Core Streams" = 8)) +  
  theme_bw() +  
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

Algae.lm.cat


# NMDS-------------------------------------------------------------------------

# Loading the appropariate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
library(rcartocolor)


# Running the NMDS for all taxa
aggregated.prod<- aggregate(Annual.Production ~ Site + SC.Level + SC.Category + 
                              + Genus, data = TOTALPROD_Summary, FUN = mean, na.rm = TRUE)

prod.nmds. = aggregated.prod %>% 
  pivot_wider(
    names_from = Genus, 
    values_from = Annual.Production,
  ) 

prod.nmds.[is.na(prod.nmds.)] <- 0 # Replace NAs with 0

prod.nmds.$SC.Level <- factor(prod.nmds.$SC.Level, 
                              levels = c("16","40","77","293","350","447","1048","1083","1185"), 
                              ordered = TRUE)


#  Rename the ID part of the matrix; take out the columns for streams, SC, season, genus
prod.nmds <- prod.nmds.[,-c(1:3)]



# Example environmental data (sites x environmental factors)
YSI <- read.csv("YSI.Year1.csv")

YSI <- YSI %>%
  drop_na() %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample.Month) %>%
  summarise(
    mean.Temp = mean(Temp...C., na.rm = TRUE),
    mean.pH = mean(pH, na.rm = TRUE),
    mean.DO.percent = mean(DO...., na.rm = TRUE),
    mean.DO.mg.L = mean(DO..mg.L., na.rm = TRUE)
  ) %>%
  group_by(Site) %>%
  summarise(
    annual.mean.temp = mean(mean.Temp, na.rm = TRUE),
    annual.mean.pH = mean(mean.pH, na.rm = TRUE),
    annual.mean.DO.percent = mean(mean.DO.percent, na.rm = TRUE),
    annual.mean.DO.mg.L = mean(mean.DO.mg.L, na.rm = TRUE),
  )


food.YSI <- cbind(CBOM,FBOM,Algae,YSI)
food.YSI <- CBOM %>%
  left_join(FBOM, by = "Site") %>%
  left_join(Algae, by = "Site") %>%
  left_join(YSI, by = "Site"
  )



# Run NMDS (bray-curtis)
nmds_result <- metaMDS(prod.nmds, distance = "bray", k = 2, trymax = 100)

# Check stress value (should be < 0.2 for a good fit)
nmds_result$stress

# Fit environmental variables
env_fit <- envfit(nmds_result, food.YSI, permutations = 999)

# Extract NMDS site scores
nmds_scores <- as.data.frame(scores(nmds_result, display = "sites"))
nmds_scores$Salinity <- c("25","72","78","387","402","1119","1242","1457","594")
nmds_scores$Salinity.Category <- c("REF","REF","REF","MID","MID","HIGH","HIGH","HIGH","MID")

head(nmds_scores)
str(nmds_scores)

# Extract envfit vectors
env_vectors <- as.data.frame(scores(env_fit, display = "vectors"))
env_vectors$Variable <- rownames(env_vectors)



library(ggplot2)
library(dplyr)

# Function to compute convex hull points
find_hull <- function(df) {
  df[chull(df$NMDS1, df$NMDS2), ]
}

# Compute hulls for each Salinity.Category
hulls <- nmds_scores %>%
  group_by(Salinity.Category) %>%
  do(find_hull(.))

# Plot with convex hulls instead of ellipses
ggplot(nmds_scores, aes(x = NMDS1, y = NMDS2, color = Salinity.Category)) +
  geom_polygon(data = hulls, aes(x = NMDS1, y = NMDS2, fill = Salinity.Category), 
               alpha = 0.2, linetype = 0) +  # Convex hulls
  geom_point(size = 4) +  # Sites as points
  
  # Add environmental vectors
  geom_segment(data = env_vectors, aes(x = 0, y = 0, xend = NMDS1, yend = NMDS2),
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  
  
  # Add labels for environmental vectors
  geom_text(data = env_vectors, aes(x = NMDS1, y = NMDS2, label = Variable),
            inherit.aes = FALSE, vjust = 1, hjust = 1, alpha = 2) +
  
  # Improve theme and labels
  theme_minimal() +
  scale_color_manual(values = c("REF" = "#70A494", "MID" = "#EDBB8A", "HIGH" = "#CA562C")) +  
  scale_fill_manual(values = c("REF" = "#70A494", "MID" = "#EDBB8A", "HIGH" = "#CA562C")) +   
  labs(title = "NMDS of Genus Production with Environmental Fit") +
  theme(panel.grid = element_blank())


# Close variance is why we are using hulls instead of ellipse
nmds_scores %>%
  group_by(Salinity.Category) %>%
  summarise(sd_NMDS1 = sd(NMDS1), sd_NMDS2 = sd(NMDS2))



# Permanova

library(vegan)


# If I want to keep Bray-Curtis...
# new, elizabeth's code ways
dist_matrix <- vegdist(prod.nmds, method = "bray")


permanova_m <- adonis2(
  dist_matrix ~ SC.Level + SC.Category, 
  data = prod.nmds., 
  permutations = 999, 
  method = "bray"
)
print(permanova_result) #same results as above




# More stats for environmental vectors
env_scores <- as.data.frame(scores(env_fit, display = "vectors"))  # Extract vector scores
env_scores$Variable <- rownames(env_scores)  # Add variable names
env_scores$R2 <- env_fit$vectors$r  # Extract R² values
env_scores$P_value <- env_fit$vectors$pvals  # Extract p-values

# Print results
print(env_scores)



install.packages("knitr")
install.packages("kableExtra")
library(knitr)
library(kableExtra)
# Create a pretty table using kable and kableExtra
env_scores %>%
  kable("html", caption = "Environmental Scores Table") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = FALSE)


