# Code for Kelley Sinning --- Publication figures and statistics

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

# Set working directory 
setwd("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/Data/saltyC_VirginiaTech/SUMMARY SHEETS")

# Bringing in total prod csv from 2P_2.0.R to cut out a lot of coding from previous scripts!
TOTAL_PROD_lengths <- read.csv("TOTALPROD.csv")

# Keeping only the necessary columns for totals
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

# Summarizing annual community secondary production per site
TOTALPROD_sum <- TOTALPROD_Summary %>%
  group_by(Site) %>%
  summarise(Sum.Annual.Production = sum(Annual.Production, na.rm = TRUE), .groups = 'drop')

# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
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

# Adding site characteristics like mean annual specific conductance
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="EAS"] = "16"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="CRO"] = "40"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HCN"] = "77"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HUR"] = "293"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="FRY"] = "350"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RUT"] = "447"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLW"] = "1048"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLC"] = "1083"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RIC"] = "1185"

# Specific conductance category...
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="EAS"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="CRO"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="HCN"] = "REF"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="HUR"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="FRY"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="RUT"] = "MID"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="LLW"] = "HIGH"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="LLC"] = "HIGH"
TOTALPROD_Summary$SC.Category[TOTALPROD_Summary$Site =="RIC"] = "HIGH"

# Ordering everything
TOTALPROD_Summary$Site <- factor(TOTALPROD_Summary$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
TOTALPROD_Summary$SC.Category <- factor(TOTALPROD_Summary$SC.Category, levels = c("REF","MID","HIGH"))
TOTALPROD_Summary$SC.Level <- factor(TOTALPROD_Summary$SC.Level, levels = c("16","40","77","293","350","447","1048","1083","1185"))
TOTALPROD_Summary$FFG <- factor(TOTALPROD_Summary$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))

TOTALPROD_Summary <- TOTALPROD_Summary %>%
  filter(!is.na(FFG))  # anything without an FFG assigned




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

# SECONDARY PRODUCTION ALONG SC GRADIENT-------------------------------------------------------------------------------

glm_model <- glm(Sum.Annual.Production ~ SC.Level, 
                 family = Gamma(link = "log"), # better fit than gaussian
                 #family = gaussian(link = "identity"),
                 data = TOTALPROD_sum)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


prod <- ggplot(TOTALPROD_sum, aes(x = SC.Level, y = Sum.Annual.Production, color = SC.Level)) +   
  geom_point(aes(shape = Site.Type), size = 3) +  
  geom_smooth(method = "glm", method.args = list(family = Gamma (link = "log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(TOTALPROD_sum$SC.Level), 
           y = max(TOTALPROD_sum$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) +  
  ylab(expression(Secondary~Production~(g/m^2/yr))) +   
  xlab("Specific Conductance (µS/cm)") +   
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


# FUNCTIONAL FEEDING GROUP SECONDARY PRODUCTION ALONG SALINITY GRADIENT-------------------------------
TOTALPROD_Summary_Sum <- TOTALPROD_Summary %>% # new df for FFG facet wraps
  group_by(Site,FFG, SC.Level) %>%
  summarise(
    Summed.Annual.Production = sum((Annual.Production), na.rm = TRUE),
    SC.Category = first(SC.Category)  
  )

# Adding information to df
TOTALPROD_Summary_Sum$SC.Level <- as.numeric(as.character(TOTALPROD_Summary_Sum$SC.Level))# Ensure SC.Level is numeric

TOTALPROD_Summary_Sum$Site.Type <- ifelse(TOTALPROD_Summary_Sum$Site %in% c("EAS", "FRY", "RIC"), 
                                          "Core Streams", "Quarterly Streams")# Create a categorical variable for site type

TOTALPROD_Summary_Sum$Site.Type <- factor(TOTALPROD_Summary_Sum$Site.Type, levels = c("Quarterly Streams", "Core Streams"))# Convert Site.Type to a factor for proper legend display

TOTALPROD_Summary_Sum$FFG <- factor(TOTALPROD_Summary_Sum$FFG, levels = c("Coleoptera Scraper","Scraper","Collector-Gatherer","Predator","Collector-Filterer","Shredder"))



# p-values and r2 for each FFG
glm_results <- TOTALPROD_Summary_Sum %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ SC.Level, 
                         family = Gamma(link = "log"),  # Gamma low AIC
                         #family = gaussian(link = "identity"),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )


# Fit GLM models for each FFG and extract results (the coefficients, std error, etc)
glm_results <- TOTALPROD_Summary_Sum %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ SC.Level, 
                         family = gaussian, 
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract coefficient estimates, standard errors, and p-values
    coef_table = map(glm_model, ~ broom::tidy(.x)),  # Extract model coefficients
    model_stats = map(glm_model, ~ tibble(
      null_deviance = summary(.x)$null.deviance,
      residual_deviance = summary(.x)$deviance,
      AIC = AIC(.x)
    ))  # Extract deviance and AIC
  ) %>%
  unnest(coef_table) %>%  # Expand coefficient table
  unnest(model_stats) %>%  # Expand model statistics
  select(FFG, term, estimate, std.error, statistic, p.value, 
         null_deviance, residual_deviance, AIC)  # Keep relevant columns

print(glm_results)



# At this point, p_value, pseudo_r2, p_label, and r2_label are all in the `glm_results` dataframe.

# Merge with main dataset
TOTALPROD_Summary_Sum <- TOTALPROD_Summary_Sum %>%
  left_join(glm_results, by = "FFG")

TOTALPROD_Summary_Sum$SC.Level <- as.numeric(as.character(TOTALPROD_Summary_Sum$SC.Level))


# Plot to scale
ggplot(TOTALPROD_Summary_Sum, aes(x = SC.Level, y = Summed.Annual.Production)) + 
  geom_point(aes(color = SC.Level, shape = Site.Type), size = 3, alpha = 0.8) +  # Color points by SC.Level
  geom_smooth(method = "glm", method.args = list(family = Gamma (link=log)), se = TRUE, color = "grey37") + 
  # Add p-values and R² to each facet in the bottom left corner
  geom_text(data = glm_results, aes(
    x = min(TOTALPROD_Summary_Sum$SC.Level),  # Place the text at the bottom left of each facet
    y = min(TOTALPROD_Summary_Sum$Summed.Annual.Production),  # Adjust y to the lower bound
    label = paste("R² =", r2_label, "\nP =", p_label)),
    hjust = 0, vjust = .1 , size = 3, alpha = 0, inherit.aes = FALSE) +  # Position text at bottom-left
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



# FOOD RESOURCES ALONG SALINITY GRADIENT----------------------------------------

# Adding in food resources

CBOM=read.csv("CBOM.Year1Summary.csv")
FBOM=read.csv("FBOM.Year1Summary.csv")
Algae=read.csv("Algae.Year1Summary.csv")


install.packages("stringi")
library(stringr)
# Replace the specific character "\xca" with an empty string (this was a weird error on some columns)
CBOM$Site <- stringr::str_replace_all(CBOM$Site, fixed("\xca"), "")


CBOM <- CBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample.Month) %>%
  summarise(
    mean.CBOM = mean(CBOM.AFDM.g.m2, na.rm = TRUE)
  ) %>%
  group_by(Site) %>%
  summarise(
    annual.mean.CBOM = mean(mean.CBOM, na.rm = TRUE)  # Use mean.CBOM to get the annual mean
  )


# Replace the specific character "\xca" with an empty string 
FBOM$Site <- stringr::str_replace_all(FBOM$Site, fixed("\xca"), "")

str(FBOM)


FBOM <- FBOM %>%
  mutate(
    Site = str_trim(Site),  # Remove extra spaces
    FBOM.AFDM.g.m2. = as.numeric(FBOM.AFDM.g.m2. )  # Convert to numeric if needed
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

# Replace the specific character "\xca" with an empty string 
Algae$Site <- stringr::str_replace_all(Algae$Site, fixed("\xca"), "")

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


# Combining food resources into one df
food <- cbind(CBOM,FBOM,Algae)
food <- CBOM %>%
  left_join(FBOM, by = "Site") %>%
  left_join(Algae, by = "Site")


# THIS is the "totals" dataframes...linking production with food
prod.food <- cbind(food, TOTALPROD_sum)
prod.food <- left_join(food, TOTALPROD_sum, by = c("Site"))


prod.food.ffg <-cbind(food, TOTALPROD_Summary_Sum) # for FFGs
prod.food.ffg <- left_join(food, TOTALPROD_Summary_Sum, by = c("Site"))


# Adding cbom + fbom combined column
prod.food <- prod.food %>%
  mutate(fbom.cbom = annual.mean.FBOM + annual.mean.CBOM) # column with fbom+cbom combined

#FBOM + CBOM----------------------------

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
  #annotate("text", 
  #x = min(prod.food$SC.Level), 
  #y = max(prod.food$fbom.cbom), 
  #label = paste("P =", p_label, "\n", r2_label), 
  #vjust = 1, hjust = 0, size = 5, alpha = 2) + 
  ylab(expression("Mean annual CBOM + FBOM (g/m²)")) +  
  xlab("Specific Conductance (µS/cm)") +  # Corrected X-axis label
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
  geom_smooth(method = "glm", method.args = list(family = Gamma(link = "log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.Algae), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual algae AFDM (g/m²)")) +  
  xlab("Specific Conductance (µS/cm)") +  # Corrected X-axis label
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
    axis.title = element_text(size = 15),
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

#CHL-A----------------------------

glm_model <- glm(annual.mean.chla ~ SC.Level, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


chla.sc.lm <- ggplot(prod.food, aes(x = SC.Level, y = annual.mean.chla, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = Gamma(link="log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$SC.Level), 
           y = max(prod.food$annual.mean.chla), 
           label = paste("P =", p_label, "\n", r2_label), 
           vjust = 1, hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Mean annual chlorophyll-a (g/m²)")) +  
  xlab("Specific Conductance (µS/cm)") +  # Corrected X-axis label
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
    axis.title = element_text(size = 15),
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

#FBOM + CBOM----------------------------

glm_model <- glm(Sum.Annual.Production ~ fbom.cbom, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


FBOM.CBOM.prod.lm <- ggplot(prod.food, aes(x = fbom.cbom, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = "Gamma"(link="log")), se = TRUE, color = "grey37") +  
  annotate("text", 
           x = min(prod.food$fbom.cbom), 
           y = max(prod.food$Sum.Annual.Production), 
           label = paste("P =", p_label, "\n", r2_label), 
           hjust = 0, size = 5, alpha = 0) + 
  ylab(expression("Secondary Production (g/m²/yr)")) +  
  xlab("Mean annual CBOM + FBOM (g/m²)") +  # Corrected X-axis label
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
    axis.title = element_text(size = 15),
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

glm_model <- glm(Sum.Annual.Production ~ annual.mean.Algae, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
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
    axis.title = element_text(size = 15),
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

#CHL-A----------------------------

glm_model <- glm(Sum.Annual.Production ~ annual.mean.chla, 
                 family = Gamma(link = "log"), # not as appropriate for this figure as gaussian
                 #family = gaussian(link = "identity"),
                 data = prod.food)

summary(glm_model)  # Check model summary

p_value <- summary(glm_model)$coefficients[2, 4]  # Extract p-value for SC.Level

pseudo_r2 <- 1 - (glm_model$deviance / glm_model$null.deviance) # Compute pseudo-R² (1 - (residual deviance / null deviance))

p_label <- ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value))# Format labels for the plot
r2_label <- sprintf("Pseudo-R² = %.3f", pseudo_r2)


chla.prod.lm <- ggplot(prod.food, aes(x = annual.mean.chla, y = Sum.Annual.Production, color = SC.Level)) +  
  geom_point(aes(shape = Site.Type), size = 3) +  # Use Site.Type for shape mapping
  geom_smooth(method = "glm", method.args = list(family = Gamma(link="log")), se = TRUE, color = "grey37") +  
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
    axis.title = element_text(size = 15),
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



# INVESTIGATING FFG PRODUCTION WITH INCREASING CHLOROPHYLL-A SINCE IT IS SIGNIFICANT

# Chl-a------------------------------

glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.chla, 
                         family = Gamma(link = "log"), # this yielded a very unfit model
                         #family = gaussian(link = "identity"),
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

summary(glm_results)

# Merge with main dataset
prod.food.ffg <- prod.food.ffg %>%
  left_join(glm_results, by = "FFG")


# Fit GLM models for each FFG and extract results (the coefficients, std error, etc)
glm_results <- prod.food.ffg %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Summed.Annual.Production ~ annual.mean.chla, 
                         family = Gamma(link = "log"), 
                         #family = gaussian(link = "identity"),
                         control = glm.control(maxit = 1000),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(
    # Extract coefficient estimates, standard errors, and p-values
    coef_table = map(glm_model, ~ broom::tidy(.x)),  # Extract model coefficients
    model_stats = map(glm_model, ~ tibble(
      null_deviance = summary(.x)$null.deviance,
      residual_deviance = summary(.x)$deviance,
      AIC = AIC(.x)
    ))  # Extract deviance and AIC
  ) %>%
  unnest(coef_table) %>%  # Expand coefficient table
  unnest(model_stats) %>%  # Expand model statistics
  select(FFG, term, estimate, std.error, statistic, p.value, 
         null_deviance, residual_deviance, AIC)  # Keep relevant columns

print(glm_results)


# Create the plot
production_chla_lm <- ggplot(
  data = prod.food.ffg, 
  aes(x = annual.mean.chla, y = Summed.Annual.Production, color = SC.Level)
) + 
  geom_point(aes(shape = Site.Type), size = 3, alpha = 0.8) + 
  geom_smooth(method = "glm", method.args = list(family = Gamma(link = "log")), se = TRUE, color = "grey37") + 
  #geom_text(data = glm_results, aes(
   # x = min(prod.food.ffg$annual.mean.chla) * 1,  # Adjust to move the label to the left of the plot
    #y = quantile(prod.food.ffg$Summed.Annual.Production, 0.9),  # Move label upwards to avoid overlap
    #label = paste("R² =", r2_label, "\nP =", p_label), 
    #group = FFG),
    #hjust = 0, vjust = 1, size = 3, alpha = 1, inherit.aes = FALSE) + 
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



# BIOMASS SEASONAL NMDS--------------------------

# Isolate REF sites for each quarterly---------

# Loading the appropriate packages
library(vegan) # vegan to calculate distance matrices
install.packages("ggplot2")
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)

SEC_PROD <- read.csv("SEC_PROD.csv") # Need biomass by months, not across length classes for year


aggregated.ref.filter <- subset(SEC_PROD, 
                                (Site == "EAS" & Sample.Month == "October") | 
                                  Site == "EAS" & Sample.Month == "February" |
                                  Site == "EAS" & Sample.Month == "May" |
                                  Site == "EAS" & Sample.Month == "August" |
                                  Site == "CRO" & Sample.Month == "October" | 
                                  Site == "CRO" & Sample.Month == "February" |
                                  Site == "CRO" & Sample.Month == "May" |
                                  Site == "CRO" & Sample.Month == "August"|
                                  Site == "HCN" & Sample.Month == "October" | 
                                  Site == "HCN" & Sample.Month == "February" |
                                  Site == "HCN" & Sample.Month == "May" |
                                  Site == "HCN" & Sample.Month == "August")

aggregated.ref.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + SC.Category + Sample.Month 
                                   + Genus, data = aggregated.ref.filter, FUN = mean, na.rm = TRUE)


biomass.ref.filter <- aggregated.ref.filter %>% 
  pivot_wider(
    names_from = Genus, 
    values_from = Biomass.Area.Corrected,
  )

# Define the correct order for Sample.Month and Site
biomass.ref.filter <- as.data.frame(biomass.ref.filter)

# Define levels
sample_month_levels <- c("October", "February", "May", "August")
site_levels <- c("EAS", "CRO", "HCN")

# Ensure columns are factors
biomass.ref.filter$Sample.Month <- factor(biomass.ref.filter$Sample.Month, levels = sample_month_levels)
biomass.ref.filter$Site <- factor(biomass.ref.filter$Site, levels = site_levels)

# Arrange the data frame by Sample.Month and Site
biomass.ref.filter <- biomass.ref.filter %>%
  arrange(Site, Sample.Month)


biomass.ref.filter[is.na(biomass.ref.filter)] <- 0

#  Rename the ID part of the matrix; take out the columns for streams, SC level, SC cat, and sample month
biomass.ref.ID.filter <- biomass.ref.filter[,-c(1:4)]


biomass.ref.ID.filter[is.na(biomass.ref.ID.filter)] <- 0


# Running the NMDS for all reference taxa across quarterly

#  metaMDS integrates functions from several packages to perform NMDS.....
#  ....including'vegdist' from the vegan package

biomass.ref.ID.nmds <- metaMDS(biomass.ref.ID.filter, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)

# Gives average stress
biomass.ref.ID.nmds$stress

# Gives weights that different species hold in the axis
biomass.ref.ID.nmds$species


# Basic plot of all of the points
plot(biomass.ref.ID.nmds, display=c('sites', 'species'), choices=c(1,2), type='p')

nmds_species <- scores(biomass.ref.ID.nmds, display = "species")

nmds_sites <- scores(biomass.ref.ID.nmds, display = "sites")

# Scores
site.scores <- as.data.frame(scores(nmds_sites)) #Using the scores function from vegan to extract the site scores and convert to a data.frame
site.scores$site <- rownames(site.scores)# Add site column to dataframe
head(site.scores)


species.scores <- as.data.frame(scores(nmds_species)) 
species.scores$species <- rownames(species.scores)  
head(species.scores)


rownames(site.scores) <- c("EAS.OCT", "EAS.FEB", "EAS.MAY", "EAS.AUG",
                           "CRO.OCT", "CRO.FEB", "CRO.MAY", "CRO.AUG",
                           "HCN.OCT", "HCN.FEB", "HCN.MAY", "HCN.AUG") # Change sites from numbers to categorical
site.scores$site <- rownames(site.scores) 

# Organizing the polygons
ref.oct <- subset(site.scores, site %in% c("EAS.OCT", "CRO.OCT", "HCN.OCT"))
ref.feb <- subset(site.scores, site %in% c("EAS.FEB", "CRO.FEB", "HCN.FEB"))
ref.may <- subset(site.scores, site %in% c("EAS.MAY", "CRO.MAY", "HCN.MAY"))
ref.aug <- subset(site.scores, site %in% c("EAS.AUG", "CRO.AUG", "HCN.AUG"))


# Filter data for specific colors

# geom_mark_ellipse for ellipse instead of polygon
dev.off()


REF.NMDS <- ggplot() +    
  geom_polygon(data = ref.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.5) +
  geom_polygon(data = ref.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.5) +
  geom_polygon(data = ref.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.5) +
  geom_polygon(data = ref.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.5) +
  geom_text(data = species.scores, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.0, vjust = 0.5, color = "grey23") +   
  geom_point(data = site.scores, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = site.scores, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5, alpha = 0) +
  scale_colour_manual(values = c( "EAS.OCT" = "#70A494", "EAS.FEB" = "#EDBB8A", "EAS.MAY" = "#CA562C","EAS.AUG"="#F6EDBD",
                                  "CRO.OCT" = "#70A494", "CRO.FEB" = "#EDBB8A", "CRO.MAY" = "#CA562C","CRO.AUG"="#F6EDBD",
                                  "HCN.OCT" = "#70A494", "HCN.FEB" = "#EDBB8A", "HCN.MAY" = "#CA562C","HCN.AUG"="#F6EDBD",
                                  "HUR.OCT" = "#EDBB8A00", "HUR.FEB" = "#EDBB8A00", "HUR.MAY" = "#EDBB8A00","HUR.AUG" = "#EDBB8A00",
                                  "FRY.OCT" = "#EDBB8A00", "FRY.FEB" = "#EDBB8A00", "FRY.MAY" = "#EDBB8A00","FRY.AUG" = "#EDBB8A00",
                                  "RUT.OCT" = "#EDBB8A00", "RUT.FEB" = "#EDBB8A00", "RUT.MAY" = "#EDBB8A00","RUT.AUG" = "#EDBB8A00",
                                  "RIC.OCT" = "#CA562C00", "RIC.FEB" = "#CA562C00", "RIC.MAY" = "#CA562C00","RIC.AUG"=  "#EDBB8A00",
                                  "LLW.OCT" = "#CA562C00", "LLW.FEB" = "#CA562C00", "LLW.MAY" = "#CA562C00","LLW.AUG" = "#EDBB8A00",
                                  "LLC.OCT" = "#CA562C00", "LLC.FEB" = "#CA562C00", "LLC.MAY" = "#CA562C00","LLC.MAY" = "#EDBB8A00")) +
  coord_equal() +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  #scale_x_continuous(name = "NMDS1", limits = c(-1, 1.2)) +
  #scale_y_continuous(name = "NMDS2", limits = c(-1, 1)) 
  scale_x_continuous(name = "NMDS1", limits =c(-2, 1.5)) + # to be on same scale
  scale_y_continuous(name = "NMDS2", limits = c(-1.5, 2)) 

print(REF.NMDS)



# PERMANOVA
str(biomass.ref.filter)
levels(as.factor(biomass.ref.filter$Sample.Month))

biomass.ref.filter$Sample.Month <- as.factor(biomass.ref.filter$Sample.Month)
# First, create the distance matrix using vegdist() 
dist_matrix <- vegdist(biomass.ref.filter[, -(1:4)], method = "bray")  # adjust based on your actual columns

# Then, run adonis2 using the distance matrix and relevant factors
adonis_result <- adonis2(
  dist_matrix ~ Sample.Month, 
  data = biomass.ref.filter, 
  permutations = 9999
)

print(adonis_result)



# Compute dispersion (PERMDISP)
dispersion_test <- betadisper(dist_matrix, biomass.ref.filter$Sample.Month)

# Perform permutation test for dispersion
permdisp_result <- permutest(dispersion_test, permutations = 9999)

# View results
print(permdisp_result)

# Visualize dispersion differences
boxplot(dispersion_test)
plot(dispersion_test)




# stats for genera
genera_fit <- envfit(biomass.ref.ID.nmds, biomass.ref.ID.filter, permutations = 999)  # Fit species data

# Extract species scores from the NMDS result
genera_scores <- as.data.frame(scores(biomass.ref.ID.nmds, display = "species"))
genera_scores$species <- rownames(genera_scores)  # Create a column for species names

# Extract the R² and p-values from genera_fit (envfit object)
genera_r2 <- genera_fit$vectors$r  # Extract R² values
genera_pvals <- genera_fit$vectors$pvals  # Extract p-values

# Create a data frame to hold the R² and p-values for each species
genera_fit_results <- data.frame(
  species = names(genera_r2),  # Species names
  R2 = genera_r2,  # R² values
  P_value = genera_pvals  # p-values
)

# Merge the genera scores with the R² and p-values
genera_scores <- merge(genera_scores, genera_fit_results, by.x = "species", by.y = "species", all.x = TRUE)

# Print the results
print(genera_scores)

# Plotting significant genera just to see (Ameletus and Tanytarsini)
# Filter genera that are significantly correlated (p < 0.05)
significant_genera <- genera_fit_results %>%
  filter(P_value < 0.05)

nmds_sites <- as.data.frame(scores(biomass.ref.ID.nmds, display = "sites"))
nmds_sites$Site <- rownames(nmds_sites)  


nmds_species <- as.data.frame(scores(biomass.ref.ID.nmds, display = "species"))
nmds_species$Species <- rownames(nmds_species)  


vectors <- as.data.frame(scores(genera_fit, display = "vectors"))
vectors$Species <- rownames(vectors)  

vectors <- vectors %>% filter(Species %in% significant_genera$species)# Keep only significant vectors


ggplot() +
  geom_point(data = nmds_sites, aes(x = NMDS1, y = NMDS2), color = "blue", alpha = 0.7) +
  geom_text(data = nmds_species, aes(x = NMDS1, y = NMDS2, label = Species), color = "red", size = 3) +
  geom_segment(data = vectors, aes(x = 0, y = 0, xend = NMDS1, yend = NMDS2), 
               arrow = arrow(length = unit(0.2, "cm")), color = "darkgreen") +
  geom_text(data = vectors, aes(x = NMDS1, y = NMDS2, label = Species), 
            color = "darkgreen", size = 4, hjust = 1.2, vjust = 1.2) +
  theme_minimal() +
  labs(title = "NMDS with Significant Genera Vectors", x = "NMDS1", y = "NMDS2")



# Saving vector information
install.packages("writexl")  
library(writexl)
write_xlsx(genera_scores, "generastats_biomassREFacrossSZN_NMDS.xlsx")





#Isolate MID sites for each quarterly---------

# Loading the appropriate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)

SEC_PROD <- read.csv("SEC_PROD.csv") # Need biomass by months, not across length classes for year


aggregated.mid.filter <- subset(SEC_PROD, 
                                (Site == "FRY" & Sample.Month == "October") | 
                                  Site == "FRY" & Sample.Month == "February" |
                                  Site == "FRY" & Sample.Month == "May" |
                                  Site == "FRY" & Sample.Month == "August" |
                                  Site == "HUR" & Sample.Month == "October" | 
                                  Site == "HUR" & Sample.Month == "February" |
                                  Site == "HUR" & Sample.Month == "May" |
                                  Site == "HUR" & Sample.Month == "August"|
                                  Site == "RUT" & Sample.Month == "October" | 
                                  Site == "RUT" & Sample.Month == "February" |
                                  Site == "RUT" & Sample.Month == "May" |
                                  Site == "RUT" & Sample.Month == "August")

aggregated.mid.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + SC.Category + Sample.Month 
                                   + Genus, data = aggregated.mid.filter, FUN = mean, na.rm = TRUE)


biomass.mid.filter <- aggregated.mid.filter %>% 
  pivot_wider(
    names_from = Genus, 
    values_from = Biomass.Area.Corrected,
  )

# Define the correct order for Sample.Month and Site
biomass.mid.filter <- as.data.frame(biomass.mid.filter)

# Define levels
sample_month_levels <- c("October", "February", "May", "August")
site_levels <- c("FRY", "HUR", "RUT")

# Ensure columns are factors
biomass.mid.filter$Sample.Month <- factor(biomass.mid.filter$Sample.Month, levels = sample_month_levels)
biomass.mid.filter$Site <- factor(biomass.mid.filter$Site, levels = site_levels)

# Arrange the data frame by Sample.Month and Site
biomass.mid.filter <- biomass.mid.filter %>%
  arrange(Site, Sample.Month)

biomass.mid.filter[is.na(biomass.mid.filter)] <- 0

#  Rename the ID part of the matrix; take out the columns for streams, SC level, SC cat, and sample month
biomass.mid.ID.filter <- biomass.mid.filter[,-c(1:4)]


biomass.mid.ID.filter[is.na(biomass.mid.ID.filter)] <- 0


# Running the NMDS for all reference taxa across quarterly

#  metaMDS integrates functions from several packages to perform NMDS.....
#  ....including'vegdist' from the vegan package

biomass.mid.ID.nmds <- metaMDS(biomass.mid.ID.filter, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)

# Gives average stress
biomass.mid.ID.nmds$stress

# Gives weights that different species hold in the axis
biomass.mid.ID.nmds$species


# Basic plot of all of the points
plot(biomass.mid.ID.nmds, display=c('sites', 'species'), choices=c(1,2), type='p')

nmds_species <- scores(biomass.mid.ID.nmds, display = "species")

nmds_sites <- scores(biomass.mid.ID.nmds, display = "sites")

# Scores
site.scores <- as.data.frame(scores(nmds_sites)) #Using the scores function from vegan to extract the site scores and convert to a data.frame
site.scores$site <- rownames(site.scores)# Add site column to dataframe
head(site.scores)


species.scores <- as.data.frame(scores(nmds_species)) 
species.scores$species <- rownames(species.scores)  
head(species.scores)


rownames(site.scores) <- c("FRY.OCT", "FRY.FEB", "FRY.MAY", "FRY.AUG",
                           "HUR.OCT", "HUR.FEB", "HUR.MAY", "HUR.AUG",
                           "RUT.OCT", "RUT.FEB", "RUT.MAY", "RUT.AUG") # Change sites from numbers to categorical
site.scores$site <- rownames(site.scores) 

# Organizing the polygons
mid.oct <- subset(site.scores, site %in% c("FRY.OCT", "HUR.OCT", "RUT.OCT"))
mid.feb <- subset(site.scores, site %in% c("FRY.FEB", "HUR.FEB", "RUT.FEB"))
mid.may <- subset(site.scores, site %in% c("FRY.MAY", "HUR.MAY", "RUT.MAY"))
mid.aug <- subset(site.scores, site %in% c("FRY.AUG", "HUR.AUG", "RUT.AUG"))


# Filter data for specific colors

MID.NMDS <- ggplot() +    
  geom_polygon(data = mid.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.5) +
  geom_polygon(data = mid.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.5) +
  geom_polygon(data = mid.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.5) +
  geom_polygon(data = mid.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.5) +
  geom_text(data = species.scores, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.0, vjust = 0.5, color = "grey23") +   
  geom_point(data = site.scores, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = site.scores, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5, alpha = 0) +
  scale_colour_manual(values = c(  "EAS.OCT" = "#CA562C00", "EAS.FEB" = "#CA562C00", "EAS.MAY" = "#CA562C00","EAS.AUG"="#EDBB8A00",
                                   "CRO.OCT" = "#CA562C00", "CRO.FEB" = "#CA562C00", "CRO.MAY" = "#CA562C00","CRO.AUG"="#EDBB8A00",
                                   "HCN.OCT" = "#CA562C00", "HCN.FEB" = "#CA562C00", "HCN.MAY" = "#CA562C00","HCN.AUG"="#EDBB8A00",
                                   "HUR.OCT" = "#70A494", "HUR.FEB" = "#EDBB8A", "HUR.MAY" = "#CA562C","HUR.AUG" = "#F6EDBD",
                                   "FRY.OCT" = "#70A494", "FRY.FEB" = "#EDBB8A", "FRY.MAY" = "#CA562C","FRY.AUG" = "#F6EDBD",
                                   "RUT.OCT" = "#70A494", "RUT.FEB" = "#EDBB8A", "RUT.MAY" = "#CA562C","RUT.AUG" = "#F6EDBD",
                                   "RIC.OCT" = "#CA562C00", "RIC.FEB" = "#CA562C00", "RIC.MAY" = "#CA562C00","RIC.AUG"=  "#EDBB8A00",
                                   "LLW.OCT" = "#CA562C00", "LLW.FEB" = "#CA562C00", "LLW.MAY" = "#CA562C00","LLW.AUG" = "#EDBB8A00",
                                   "LLC.OCT" = "#CA562C00", "LLC.FEB" = "#CA562C00", "LLC.MAY" = "#CA562C00","LLC.MAY" = "#EDBB8A00")) +
  coord_equal() +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-2, 1.5)) +
  scale_y_continuous(name = "NMDS2", limits = c(-1.5, 2)) 

print(MID.NMDS)



# PERMANOVA
str(biomass.mid.filter)
levels(as.factor(biomass.ref.filter$Sample.Month))

biomass.mid.filter$Sample.Month <- as.factor(biomass.mid.filter$Sample.Month)
# First, create the distance matrix using vegdist() 
dist_matrix <- vegdist(biomass.mid.filter[, -(1:4)], method = "bray")  # adjust based on your actual columns

# Then, run adonis2 using the distance matrix and relevant factors
adonis_result <- adonis2(
  dist_matrix ~ Sample.Month, 
  data = biomass.mid.filter, 
  permutations = 9999
)

print(adonis_result)



# Compute dispersion (PERMDISP)
dispersion_test <- betadisper(dist_matrix, biomass.mid.filter$Sample.Month)

# Perform permutation test for dispersion
permdisp_result <- permutest(dispersion_test, permutations = 9999)

# View results
print(permdisp_result)

# Visualize dispersion differences
boxplot(dispersion_test)
plot(dispersion_test)




# stats for genera
genera_fit <- envfit(biomass.mid.ID.nmds, biomass.mid.ID.filter, permutations = 999)  # Fit species data

# Extract species scores from the NMDS result
genera_scores <- as.data.frame(scores(biomass.mid.ID.nmds, display = "species"))
genera_scores$species <- rownames(genera_scores)  # Create a column for species names

# Extract the R² and p-values from genera_fit (envfit object)
genera_r2 <- genera_fit$vectors$r  # Extract R² values
genera_pvals <- genera_fit$vectors$pvals  # Extract p-values

# Create a data frame to hold the R² and p-values for each species
genera_fit_results <- data.frame(
  species = names(genera_r2),  # Species names
  R2 = genera_r2,  # R² values
  P_value = genera_pvals  # p-values
)

# Merge the genera scores with the R² and p-values
genera_scores <- merge(genera_scores, genera_fit_results, by.x = "species", by.y = "species", all.x = TRUE)

# Print the results
print(genera_scores)

# Plotting significant genera just to see (Ameletus and Tanytarsini)
# Filter genera that are significantly correlated (p < 0.05)
significant_genera <- genera_fit_results %>%
  filter(P_value < 0.05)

nmds_sites <- as.data.frame(scores(biomass.mid.ID.nmds, display = "sites"))
nmds_sites$Site <- rownames(nmds_sites)  


nmds_species <- as.data.frame(scores(biomass.mid.ID.nmds, display = "species"))
nmds_species$Species <- rownames(nmds_species)  


vectors <- as.data.frame(scores(genera_fit, display = "vectors"))
vectors$Species <- rownames(vectors)  

vectors <- vectors %>% filter(Species %in% significant_genera$species)# Keep only significant vectors


ggplot() +
  geom_point(data = nmds_sites, aes(x = NMDS1, y = NMDS2), color = "blue", alpha = 0.7) +
  geom_text(data = nmds_species, aes(x = NMDS1, y = NMDS2, label = Species), color = "red", size = 3) +
  geom_segment(data = vectors, aes(x = 0, y = 0, xend = NMDS1, yend = NMDS2), 
               arrow = arrow(length = unit(0.2, "cm")), color = "darkgreen") +
  geom_text(data = vectors, aes(x = NMDS1, y = NMDS2, label = Species), 
            color = "darkgreen", size = 4, hjust = 1.2, vjust = 1.2) +
  theme_minimal() +
  labs(title = "NMDS with Significant Genera Vectors", x = "NMDS1", y = "NMDS2")



# Saving vector information
install.packages("writexl")  
library(writexl)
write_xlsx(genera_scores, "generastats_biomassMIDacrossSZN_NMDS.xlsx")



# Isolate HIGH sites for each quarterly---------

# Loading the appropriate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)

SEC_PROD <- read.csv("SEC_PROD.csv") # Need biomass by months, not across length classes for year

aggregated.high.filter <- subset(SEC_PROD, 
                                 (Site == "RIC" & Sample.Month == "October") | 
                                   Site == "RIC" & Sample.Month == "February" |
                                   Site == "RIC" & Sample.Month == "May" |
                                   Site == "RIC" & Sample.Month == "August" |
                                   Site == "LLW" & Sample.Month == "October" | 
                                   Site == "LLW" & Sample.Month == "February" |
                                   Site == "LLW" & Sample.Month == "May" |
                                   Site == "LLW" & Sample.Month == "August"|
                                   Site == "LLC" & Sample.Month == "October" | 
                                   Site == "LLC" & Sample.Month == "February" |
                                   Site == "LLC" & Sample.Month == "May" |
                                   Site == "LLC" & Sample.Month == "August")

aggregated.high.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + SC.Category + Sample.Month 
                                    + Genus, data = aggregated.high.filter, FUN = mean, na.rm = TRUE)


biomass.high.filter <- aggregated.high.filter %>% 
  pivot_wider(
    names_from = Genus, 
    values_from = Biomass.Area.Corrected,
  )

# Define the correct order for Sample.Month and Site
biomass.high.filter <- as.data.frame(biomass.high.filter)

# Define levels
sample_month_levels <- c("October", "February", "May", "August")
site_levels <- c("RIC", "LLW", "LLC")

# Ensure columns are factors
biomass.high.filter$Sample.Month <- factor(biomass.high.filter$Sample.Month, levels = sample_month_levels)
biomass.high.filter$Site <- factor(biomass.high.filter$Site, levels = site_levels)

# Arrange the data frame by Sample.Month and Site
biomass.high.filter <- biomass.high.filter %>%
  arrange(Site, Sample.Month)


biomass.high.filter[is.na(biomass.high.filter)] <- 0


#  Rename the ID part of the matrix; take out the columns for streams, SC level, SC cat, and sample month
biomass.high.ID.filter <- biomass.high.filter[,-c(1:4)]


biomass.high.ID.filter[is.na(biomass.high.ID.filter)] <- 0


# Running the NMDS for all reference taxa across quarterly

#  metaMDS integrates functions from several packages to perform NMDS.....
#  ....including'vegdist' from the vegan package

biomass.high.ID.nmds <- metaMDS(biomass.high.ID.filter, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)

# Gives average stress
biomass.high.ID.nmds$stress

# Gives weights that different species hold in the axis
biomass.high.ID.nmds$species



# Basic plot of all of the points
plot(biomass.high.ID.nmds, display=c('sites', 'species'), choices=c(1,2), type='p')

nmds_species <- scores(biomass.high.ID.nmds, display = "species")

nmds_sites <- scores(biomass.high.ID.nmds, display = "sites")

# Scores
site.scores <- as.data.frame(scores(nmds_sites)) #Using the scores function from vegan to extract the site scores and convert to a data.frame
site.scores$site <- rownames(site.scores)# Add site column to dataframe
head(site.scores)


species.scores <- as.data.frame(scores(nmds_species)) 
species.scores$species <- rownames(species.scores)  
head(species.scores)


rownames(site.scores) <- c("RIC.OCT", "RIC.FEB", "RIC.MAY", "RIC.AUG",
                           "LLW.OCT", "LLW.FEB", "LLW.MAY", "LLW.AUG",
                           "LLC.OCT", "LLC.FEB", "LLC.MAY", "LLC.AUG") # Change sites from numbers to categorical
site.scores$site <- rownames(site.scores) 

# Organizing the polygons
high.oct <- subset(site.scores, site %in% c("RIC.OCT", "LLW.OCT", "LLC.OCT"))
high.feb <- subset(site.scores, site %in% c("RIC.FEB", "LLW.FEB", "LLC.FEB"))
high.may <- subset(site.scores, site %in% c("RIC.MAY", "LLW.MAY", "LLC.MAY"))
high.aug <- subset(site.scores, site %in% c("RIC.AUG", "LLW.AUG", "LLC.AUG"))

# Filter data for specific colors

HIGH.NMDS <- ggplot() +    
  geom_polygon(data = high.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.5) +
  geom_polygon(data = high.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.5) +
  geom_polygon(data = high.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.5) +
  geom_polygon(data = high.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.5) +
  geom_text(data = species.scores, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.2, vjust = 0.5, color = "grey23") +   
  geom_point(data = site.scores, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = site.scores, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5, alpha = 0) +
  scale_colour_manual(values = c(  "EAS.OCT" = "#CA562C00", "EAS.FEB" = "#CA562C00", "EAS.MAY" = "#CA562C00","EAS.AUG"="#EDBB8A00",
                                   "CRO.OCT" = "#CA562C00", "CRO.FEB" = "#CA562C00", "CRO.MAY" = "#CA562C00","CRO.AUG"="#EDBB8A00",
                                   "HCN.OCT" = "#CA562C00", "HCN.FEB" = "#CA562C00", "HCN.MAY" = "#CA562C00","HCN.AUG"="#EDBB8A00",
                                   "HUR.OCT" = "#CA562C00", "HUR.FEB" = "#CA562C00", "HUR.MAY" = "#CA562C00","HUR.AUG" = "#EDBB8A00",
                                   "FRY.OCT" = "#CA562C00", "FRY.FEB" = "#CA562C00", "FRY.MAY" = "#CA562C00","FRY.AUG" = "#EDBB8A00",
                                   "RUT.OCT" = "#CA562C00", "RUT.FEB" = "#CA562C00", "RUT.MAY" = "#CA562C00","RUT.AUG" = "#EDBB8A00",
                                   "RIC.OCT" = "#70A494", "RIC.FEB" = "#EDBB8A", "RIC.MAY" = "#CA562C","RIC.AUG"=  "#F6EDBD",
                                   "LLW.OCT" = "#70A494", "LLW.FEB" = "#EDBB8A", "LLW.MAY" = "#CA562C","LLW.AUG" = "#F6EDBD",
                                   "LLC.OCT" = "#70A494", "LLC.FEB" = "#EDBB8A", "LLC.MAY" = "#CA562C","LLC.AUG" = "#F6EDBD")) +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-0.12, 0.15)) +
  scale_y_continuous(name = "NMDS2", limits = c(-0.15, 0.15)) 
#scale_x_continuous(name = "NMDS1", limits =c(-2, 1.5)) + 
#scale_y_continuous(name = "NMDS2", limits = c(-1.5, 2)) 

print(HIGH.NMDS)



# PERMANOVA
str(biomass.high.filter)
levels(as.factor(biomass.high.filter$Sample.Month))

biomass.high.filter$Sample.Month <- as.factor(biomass.high.filter$Sample.Month)
# First, create the distance matrix using vegdist() 
dist_matrix <- vegdist(biomass.high.filter[, -(1:4)], method = "bray")  # adjust based on your actual columns

# Then, run adonis2 using the distance matrix and relevant factors
adonis_result <- adonis2(
  dist_matrix ~ Sample.Month, 
  data = biomass.high.filter, 
  permutations = 9999
)

print(adonis_result)



# Compute dispersion (PERMDISP)
dispersion_test <- betadisper(dist_matrix, biomass.high.filter$Sample.Month)

# Perform permutation test for dispersion
permdisp_result <- permutest(dispersion_test, permutations = 9999)

# View results
print(permdisp_result)

# Visualize dispersion differences
boxplot(dispersion_test)
plot(dispersion_test)


# stats for genera
genera_fit <- envfit(biomass.high.ID.nmds, biomass.high.ID.filter, permutations = 999)  # Fit species data

# Extract species scores from the NMDS result
genera_scores <- as.data.frame(scores(biomass.high.ID.nmds, display = "species"))
genera_scores$species <- rownames(genera_scores)  # Create a column for species names

# Extract the R² and p-values from genera_fit (envfit object)
genera_r2 <- genera_fit$vectors$r  # Extract R² values
genera_pvals <- genera_fit$vectors$pvals  # Extract p-values

# Create a data frame to hold the R² and p-values for each species
genera_fit_results <- data.frame(
  species = names(genera_r2),  # Species names
  R2 = genera_r2,  # R² values
  P_value = genera_pvals  # p-values
)

# Merge the genera scores with the R² and p-values
genera_scores <- merge(genera_scores, genera_fit_results, by.x = "species", by.y = "species", all.x = TRUE)

# Print the results
print(genera_scores)

# Plotting significant genera just to see (Ameletus and Tanytarsini)
# Filter genera that are significantly correlated (p < 0.05)
significant_genera <- genera_fit_results %>%
  filter(P_value < 0.05)

nmds_sites <- as.data.frame(scores(biomass.high.ID.nmds, display = "sites"))
nmds_sites$Site <- rownames(nmds_sites)  


nmds_species <- as.data.frame(scores(biomass.high.ID.nmds, display = "species"))
nmds_species$Species <- rownames(nmds_species)  


vectors <- as.data.frame(scores(genera_fit, display = "vectors"))
vectors$Species <- rownames(vectors)  

vectors <- vectors %>% filter(Species %in% significant_genera$species)# Keep only significant vectors


ggplot() +
  geom_point(data = nmds_sites, aes(x = NMDS1, y = NMDS2), color = "blue", alpha = 0.7) +
  geom_text(data = nmds_species, aes(x = NMDS1, y = NMDS2, label = Species), color = "red", size = 3) +
  geom_segment(data = vectors, aes(x = 0, y = 0, xend = NMDS1, yend = NMDS2), 
               arrow = arrow(length = unit(0.2, "cm")), color = "darkgreen") +
  geom_text(data = vectors, aes(x = NMDS1, y = NMDS2, label = Species), 
            color = "darkgreen", size = 4, hjust = 1.2, vjust = 1.2) +
  theme_minimal() +
  labs(title = "NMDS with Significant Genera Vectors", x = "NMDS1", y = "NMDS2")



# Saving vector information
install.packages("writexl")  
library(writexl)
write_xlsx(genera_scores, "generastats_biomassHIGHacrossSZN_NMDS.xlsx")


# SPEARMANS CORRELATION MATRIX---------------------------------------------------
library(dbplyr)

covariates <- read.csv("covariates.csv")

str(covariates)

covariates <- covariates %>%
  mutate(
    X78Se..ppb. = as.numeric(X78Se..ppb.),
    TN..mg.L.N. = as.numeric(TN..mg.L.N.),
    TP..mg.L.P. = as.numeric(TP..mg.L.P.),
    NH3..mg.L. = as.numeric(NH3..mg.L.),
    NO3.NO2.mg.L. = as.numeric(NO3.NO2.mg.L.),
    oPO4.mg.L. = as.numeric(oPO4.mg.L.),
    CaCO3..mg.L. = as.numeric(CaCO3..mg.L.),
  )


# Averaging available data to get yearly values
covariates <- covariates %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site) %>%
  summarise(
    annual.mean.NPOC = mean(NPOC..mg.C.L., na.rm = TRUE),
    annual.mean.Cl = mean(Cl..mg.Cl.L., na.rm = TRUE),
    annual.mean.SO4 = mean(SO4..mg.SO4.L., na.rm = TRUE),
    annual.mean.Se = mean(X78Se..ppb., na.rm = TRUE),
    annual.mean.TN = mean(TN..mg.L.N., na.rm = TRUE),
    annual.mean.TP = mean(TP..mg.L.P., na.rm = TRUE),
    annual.mean.NH3 = mean(NH3..mg.L., na.rm = TRUE),
    annual.mean.NO3.NO2 = mean(NO3.NO2.mg.L., na.rm = TRUE),
    annual.mean.oPO4 = mean(oPO4.mg.L., na.rm = TRUE),
    annual.mean.CaCO3 = mean(CaCO3..mg.L., na.rm = TRUE)
  ) 

# Manually giving LLC an annual average of 0.005, RIC and LLW are 0.006 and 0.004, so 
# averaging those bc LLC have no oPO4 values for the year that were detected and could be used 
covariates <- covariates %>% 
  mutate(
    annual.mean.oPO4 = if_else(
      is.na(annual.mean.oPO4) & Site == "LLC",  # Fix the condition here
      0.005,  # Value to replace NAs with
      annual.mean.oPO4  # Keep original value if condition is not met
    )
  )


# Adding in other YSI 
total.covariates <- covariates %>%
  left_join(YSI, by = "Site")


# Adding SC columns
total.covariates <- total.covariates %>%
  mutate(SC.Level = case_when(
    Site %in% c("EAS") ~ 16,
    Site %in% c("CRO") ~ 40,
    Site %in% c("HCN") ~ 77,
    Site %in% c("HUR") ~ 293,
    Site %in% c("FRY") ~ 350,
    Site %in% c("RUT") ~ 447,
    Site %in% c("LLW") ~ 1048,
    Site %in% c("LLC") ~ 1083,
    Site %in% c("RIC") ~ 1185,
    TRUE ~ NA_real_  # Use NA_real_ to ensure numeric output
  ))


str(total.covariates)

# Making the correlation matrix
total.covariates.matrix <- total.covariates %>%
  select(-c(Site, Type, Sample.Month, Date)) # Removing site so that it is all numeric, necessary for matrix

cor_matrix <- cor(total.covariates.matrix, method = "spearman")
print(cor_matrix)

# p-values along with correlations
install.packages("Hmisc")
library(Hmisc)

result <- rcorr(as.matrix(total.covariates.matrix), type = "spearman")
result$r     # Correlation matrix
result$P     # P-value matrix

# Plotting
install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot(cor_matrix, lab = TRUE, type = "lower")

# Check for missing values in the correlation matrix
any(is.na(cor_matrix))

# Check for missing values in the p-value matrix
any(is.na(result$P))


# Custom color scheme for ggcorrplot
# Using ggcorrplot with asterisks for significant correlations
ggcorrplot(
  cor_matrix,           # Correlation matrix
  lab = TRUE,           # Show correlation values inside the plot
  type = "lower",       # Display only the lower triangle
  colors = c("#CA562C", "white", "#70A494"),  # Custom color gradient (from red to white to green)
  #p.mat = result$P,     # P-value matrix from rcorr()
  sig.level = 0.05,     # Significance level for asterisks
  insig = "pch"         # Use asterisks for insignificant correlations
)


# GGRIDGE PLOTS


library(tidyverse)
library(readxl)
library(lubridate)
library(ggridges)

Total_Lengths <- read.csv("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/Data/saltyC_VirginiaTech/SUMMARY SHEETS/SECPROD_FFGadjusted.csv")

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

ggplot(TotalLengths_stenonema, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_y_discrete(limits = rev(levels(TotalLengths_stenonema$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()


# Subsetting for Leuctra--------------------------------------------------------
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

ggplot(TotalLengths_leuctra, aes(Length, y = Sample.Month, fill = after_stat(x))) +
  facet_wrap(~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) +
  scale_y_discrete(limits = rev(levels(TotalLengths_leuctra$Sample.Month)))+
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

# Subsetting for Scrapers and shredders--------------------------------------------------------

# Subsetting for FFGS----------------------
TotalLengths_FFG <- Total_Lengths %>%
  filter(FFG %in% c("Scraper", "Scraper - Coleoptera", "Shredder") & Site %in% c("EAS", "FRY", "RIC"))

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
TotalLengths_FFG$FFG <- factor(TotalLengths_FFG$FFG, levels = c("Scraper", "Scraper - Coleoptera", "Shredder"))
TotalLengths_FFG$SC.Category <- factor(TotalLengths_FFG$SC.Category, levels = c("REF", "MID", "HIGH"))

# Make ggridges plot

ggplot(TotalLengths_FFG, aes(Length, y = Sample.Month, fill = after_stat(x))) + # after_stat let's you reference a computer variable (length) during plotting...maps length values to fill aesthetic
  facet_wrap(FFG~SC.Category)+
  geom_density_ridges_gradient(scale = 1.5, alpha=.4) + # computation of densities, kernal density estimations to get smoothed ridgelines
  scale_x_continuous(limits = c(0, 10)) +
  scale_y_discrete(limits = rev(levels(TotalLengths_FFG$Sample.Month)))+ # reverses order of months so it read top to bottom easier
  scale_fill_gradient(name = "Length (mm)", low= "skyblue", high="darkgoldenrod1") +
  theme_classic()

