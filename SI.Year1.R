# Stable Isotopes code for year 1 of Salty C

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
setwd("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/2023-2025 VT/Data/saltyC_VirginiaTech/SUMMARY SHEETS")

SI <- read.csv ("SI Macros Year 1 New.csv") # Adults removed preemptively


# Fixing up some taxa "duplicates"
SI <- SI %>%
  mutate(Taxa = ifelse(Taxa == "Tipula ", "Tipula", Taxa))

SI <- SI %>%
  mutate(Taxa = ifelse(Taxa == "Acroneuria ", "Acroneuria", Taxa))

SI <- SI %>%
  mutate(Month = ifelse(Month == "October ", "October", Month))

# Averaging replicates across seasons
SI.Season <- SI %>%
  group_by(Site, Month, Taxa) %>%
  summarise(
    season.wtN = mean(wt..N, na.rm = TRUE),
    season.wtC = mean(wt..C, na.rm = TRUE),
    season.Atomic.CN = mean(Atomic.C.N, na.rm = TRUE),
    season.d15N = mean(d15N.permil.AIR, na.rm = TRUE),
    season.d13C = mean(d13C.permil.VPDB, na.rm = TRUE))

# Averaging replicates across year

SI.year1 <- SI.Season %>%
  group_by(Site, Taxa) %>%
  summarise(
    wtN = mean(season.wtN, na.rm = TRUE),
    wtC = mean(season.wtC, na.rm = TRUE),
    Atomic.CN = mean(season.Atomic.CN, na.rm = TRUE),
    d15N = mean(season.d15N, na.rm = TRUE),
    d13C = mean(season.d13C, na.rm = TRUE))


# Removing taxa I never saw in the benthic samples and not confident in IDs or relevance

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Arcynopteryx dichroa")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Carabidae")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Helobata/Helocombus")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Helophorus")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Hydrochus")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Hydraena")

SI.year1 <- SI.year1 %>%
  filter(Taxa != "Sciaridae")


SI.Season <- SI.Season %>%
  filter(Taxa != "Arcynopteryx dichroa")

SI.Season <- SI.Season %>%
  filter(Taxa != "Carabidae")

SI.Season <- SI.Season %>%
  filter(Taxa != "Helobata/Helocombus")

SI.Season <- SI.Season %>%
  filter(Taxa != "Helophorus")

SI.Season <- SI.Season %>%
  filter(Taxa != "Hydrochus")

SI.Season <- SI.Season %>%
  filter(Taxa != "Hydraena")

SI.Season <- SI.Season %>%
  filter(Taxa != "Sciaridae")

# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
# CONUS primary feeding mode was how FFG was determined

SI.year1$FFG[SI.year1$Taxa=="Acroneuria"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Amphinemura"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Atherix"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Baetis"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Boyeria"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Cheumatopsyche"]="Collector-Filterer"
SI.year1$FFG[SI.year1$Taxa=="Chironomini"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Collembola"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Dicranota"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Diplectrona"]="Collector-Filterer"
SI.year1$FFG[SI.year1$Taxa=="Dixa"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Drunella"]="Scraper"
SI.year1$FFG[SI.year1$Taxa=="Dolophilodes"]="Collector-Filterer"
SI.year1$FFG[SI.year1$Taxa=="Ectopria"]="Coleoptera Scraper"
SI.year1$FFG[SI.year1$Taxa=="Ephemera"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Ephemerella"]="Collector-Gatherer" 
SI.year1$FFG[SI.year1$Taxa=="Ephemerellidae"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Eurylophella"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Glossosoma"]="Scraper"
SI.year1$FFG[SI.year1$Taxa=="Helichus"]="Scraper"
SI.year1$FFG[SI.year1$Taxa=="Hydatophylax"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Hydropsyche"]="Collector-Filterer" 
SI.year1$FFG[SI.year1$Taxa=="Hydropsychidae"]="Collector-Filterer" 
SI.year1$FFG[SI.year1$Taxa=="Isoperla"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Lanthus"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Lepidostoma"]= "Shredder"
SI.year1$FFG[SI.year1$Taxa=="Leuctra"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Molophilus"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Macronychus"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Neophylax"]="Scraper"
SI.year1$FFG[SI.year1$Taxa=="Nigronia"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Oligochaeta"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Orthocladiinae"]="Collector-Gatherer"
SI.year1$FFG[SI.year1$Taxa=="Peltoperla"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Peltoperlidae"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Perlesta"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Platycentropus"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Prosimulium"]="Collector-Filterer"
SI.year1$FFG[SI.year1$Taxa=="Psephenus"]="Coleoptera Scraper" 
SI.year1$FFG[SI.year1$Taxa=="Psephenidae"]="Coleoptera Scraper"
SI.year1$FFG[SI.year1$Taxa=="Pteronarcys"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Pycnopsyche"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Rhagovelia"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Rhyacophila"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Sialis"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Simulium"]="Collector-Filterer"
SI.year1$FFG[SI.year1$Taxa=="Tallaperla"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Stenonema"]="Scraper" 
SI.year1$FFG[SI.year1$Taxa=="Taeniopteryx"]="Shredder"
SI.year1$FFG[SI.year1$Taxa=="Tanypodinae"]="Predator"
SI.year1$FFG[SI.year1$Taxa=="Tipula"]="Shredder"


# Adding site characteristics like mean annual specific conductance
SI.year1$SC.Level[SI.year1$Site =="EAS"] = "16"
SI.year1$SC.Level[SI.year1$Site =="CRO"] = "40"
SI.year1$SC.Level[SI.year1$Site =="HCN"] = "77"
SI.year1$SC.Level[SI.year1$Site =="HUR"] = "293"
SI.year1$SC.Level[SI.year1$Site =="FRY"] = "350"
SI.year1$SC.Level[SI.year1$Site =="RUT"] = "447"
SI.year1$SC.Level[SI.year1$Site =="LLW"] = "1048"
SI.year1$SC.Level[SI.year1$Site =="LLC"] = "1083"
SI.year1$SC.Level[SI.year1$Site =="RIC"] = "1185"

# Specific conductance category...
SI.year1$SC.Category[SI.year1$Site =="EAS"] = "REF"
SI.year1$SC.Category[SI.year1$Site =="CRO"] = "REF"
SI.year1$SC.Category[SI.year1$Site =="HCN"] = "REF"
SI.year1$SC.Category[SI.year1$Site =="HUR"] = "MID"
SI.year1$SC.Category[SI.year1$Site =="FRY"] = "MID"
SI.year1$SC.Category[SI.year1$Site =="RUT"] = "MID"
SI.year1$SC.Category[SI.year1$Site =="LLW"] = "HIGH"
SI.year1$SC.Category[SI.year1$Site =="LLC"] = "HIGH"
SI.year1$SC.Category[SI.year1$Site =="RIC"] = "HIGH"

# Ordering everything
SI.year1$Site <- factor(SI.year1$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
SI.year1$SC.Category <- factor(SI.year1$SC.Category, levels = c("REF","MID","HIGH"))
SI.year1$SC.Level <- factor(SI.year1$SC.Level, levels = c("16","40","77","293","350","447","1048","1083","1185"))
SI.year1$FFG <- factor(SI.year1$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))





# Now for seasonal taxa 

# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
# CONUS primary feeding mode was how FFG was determined

SI.Season$FFG[SI.Season$Taxa=="Acroneuria"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Amphinemura"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Atherix"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Baetis"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Boyeria"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Cheumatopsyche"]="Collector-Filterer"
SI.Season$FFG[SI.Season$Taxa=="Chironomini"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Collembola"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Dicranota"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Diplectrona"]="Collector-Filterer"
SI.Season$FFG[SI.Season$Taxa=="Dixa"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Drunella"]="Scraper"
SI.Season$FFG[SI.Season$Taxa=="Dolophilodes"]="Collector-Filterer"
SI.Season$FFG[SI.Season$Taxa=="Ectopria"]="Coleoptera Scraper"
SI.Season$FFG[SI.Season$Taxa=="Ephemera"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Ephemerella"]="Collector-Gatherer" 
SI.Season$FFG[SI.Season$Taxa=="Ephemerellidae"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Eurylophella"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Glossosoma"]="Scraper"
SI.Season$FFG[SI.Season$Taxa=="Helichus"]="Scraper"
SI.Season$FFG[SI.Season$Taxa=="Hydatophylax"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Hydropsyche"]="Collector-Filterer" 
SI.Season$FFG[SI.Season$Taxa=="Hydropsychidae"]="Collector-Filterer" 
SI.Season$FFG[SI.Season$Taxa=="Isoperla"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Lanthus"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Lepidostoma"]= "Shredder"
SI.Season$FFG[SI.Season$Taxa=="Leuctra"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Molophilus"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Macronychus"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Neophylax"]="Scraper"
SI.Season$FFG[SI.Season$Taxa=="Nigronia"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Oligochaeta"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Orthocladiinae"]="Collector-Gatherer"
SI.Season$FFG[SI.Season$Taxa=="Peltoperla"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Peltoperlidae"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Perlesta"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Platycentropus"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Prosimulium"]="Collector-Filterer"
SI.Season$FFG[SI.Season$Taxa=="Psephenus"]="Coleoptera Scraper" 
SI.Season$FFG[SI.Season$Taxa=="Psephenidae"]="Coleoptera Scraper"
SI.Season$FFG[SI.Season$Taxa=="Pteronarcys"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Pycnopsyche"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Rhagovelia"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Rhyacophila"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Sialis"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Simulium"]="Collector-Filterer"
SI.Season$FFG[SI.Season$Taxa=="Tallaperla"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Stenonema"]="Scraper" 
SI.Season$FFG[SI.Season$Taxa=="Taeniopteryx"]="Shredder"
SI.Season$FFG[SI.Season$Taxa=="Tanypodinae"]="Predator"
SI.Season$FFG[SI.Season$Taxa=="Tipula"]="Shredder"


# Adding site characteristics like mean annual specific conductance
SI.Season$SC.Level[SI.Season$Site =="EAS"] = "16"
SI.Season$SC.Level[SI.Season$Site =="CRO"] = "40"
SI.Season$SC.Level[SI.Season$Site =="HCN"] = "77"
SI.Season$SC.Level[SI.Season$Site =="HUR"] = "293"
SI.Season$SC.Level[SI.Season$Site =="FRY"] = "350"
SI.Season$SC.Level[SI.Season$Site =="RUT"] = "447"
SI.Season$SC.Level[SI.Season$Site =="LLW"] = "1048"
SI.Season$SC.Level[SI.Season$Site =="LLC"] = "1083"
SI.Season$SC.Level[SI.Season$Site =="RIC"] = "1185"

# Specific conductance category...
SI.Season$SC.Category[SI.Season$Site =="EAS"] = "REF"
SI.Season$SC.Category[SI.Season$Site =="CRO"] = "REF"
SI.Season$SC.Category[SI.Season$Site =="HCN"] = "REF"
SI.Season$SC.Category[SI.Season$Site =="HUR"] = "MID"
SI.Season$SC.Category[SI.Season$Site =="FRY"] = "MID"
SI.Season$SC.Category[SI.Season$Site =="RUT"] = "MID"
SI.Season$SC.Category[SI.Season$Site =="LLW"] = "HIGH"
SI.Season$SC.Category[SI.Season$Site =="LLC"] = "HIGH"
SI.Season$SC.Category[SI.Season$Site =="RIC"] = "HIGH"

# Ordering everything
SI.Season$Site <- factor(SI.Season$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
SI.Season$SC.Category <- factor(SI.Season$SC.Category, levels = c("REF","MID","HIGH"))
SI.Season$SC.Level <- factor(SI.Season$SC.Level, levels = c("16","40","77","293","350","447","1048","1083","1185"))
SI.Season$FFG <- factor(SI.Season$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))

# What taxa could we compare across season
common_taxa <- SI.year1 %>%
  filter(Site %in% c("EAS", "FRY", "RIC")) %>%
  group_by(Site) %>%
  summarise(taxa = list(unique(Taxa)), .groups = "drop") %>%
  summarise(common = Reduce(intersect, taxa)) %>%
  pull(common)


# These are the top and bottom target taxa that I know have SI for them and 
# only want to include (see SECPROD_SUMMARY_TOTAL excel)
taxa_EAS <- c("Amphinemura", "Glossosoma","Pteronarcys","Stenonema",
              "Tallaperla")

taxa_FRY <- c("Amphinemura","Leuctra", "Neophylax", "Psephenus", "Pteronarcys",
              "Stenonema", "Tallaperla", "Tipula")

taxa_RIC <- c("Amphinemura","Ectopria", "Hydatophylax","Leuctra", "Pycnopsyche",
              "Taeniopteryx", "Tipula")

filterSI.year1 <- SI.year1 %>%
  filter(
      (Site == "EAS" & Taxa %in% taxa_EAS) |
      (Site == "FRY" & Taxa %in% taxa_FRY) |
      (Site == "RIC" & Taxa %in% taxa_RIC)
  )

filterSI.season <- SI.Season %>%
  filter(
      (Site == "EAS" & Taxa %in% taxa_EAS) |
      (Site == "FRY" & Taxa %in% taxa_FRY) |
      (Site == "RIC" & Taxa %in% taxa_RIC)
  )


# Color Scheme stuff
library(RColorBrewer)
display.brewer.all()
display_carto_all()
my_colors = carto_pal(7, "Geyser") #to get hex codes
library(rcartocolor)

# Plots for taxa signatures
#can easily sub SI.year1 for filterSI.year1 to see original plots
ggplot(filterSI.year1, aes(x = d13C, y = d15N, color = SC.Category, shape = FFG)) +
  geom_point(size = 3) +
  labs(
    x = "d13C",
    y = "d15N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  )


# With names of taxa
library(ggrepel)

ggplot(filterSI.year1, aes(x = d13C, y = d15N, color = SC.Category, shape = FFG)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = Taxa), size = 3, show.legend = FALSE, max.overlaps = 50) +
  labs(
    x = "d13C",
    y = "d15N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal()


# For Season

ggplot(filterSI.season, aes(x = season.d13C, y = season.d15N,
                      color = SC.Category, shape = FFG)) +
  facet_wrap(~Month) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = Taxa), size = 3, show.legend = FALSE, max.overlaps = 50) +
  labs(
    x = "d13C",
    y = "d15N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)  # ✅ adds border
  )



# Summarizing average isotope signatures for each FFG
FFGsummary_df <- filterSI.year1 %>%
  group_by(SC.Category, SC.Level, FFG) %>%
  summarise(
    mean_d13C = mean(d13C, na.rm = TRUE),
    mean_d15N = mean(d15N, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  pivot_longer(cols = c(mean_d13C, mean_d15N),
               names_to = "Isotope",
               values_to = "Value")


ggplot(FFGsummary_df, aes(x = FFG, y = Value, fill = SC.Category)) +
  geom_col(position = "dodge") +
  facet_wrap(~ Isotope, scales = "free_y") +
  labs(
    x = "Functional Feeding Group",
    y = "Mean Isotope Value",
    fill = "SC Category"
  ) +
  scale_fill_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )) +
  theme_minimal()


library(ggplot2)

# Now as LM

FFGsummary_df$SC.Level <- as.numeric(as.character(FFGsummary_df$SC.Level))


ggplot(FFGsummary_df, aes(x = as.numeric(SC.Level), y = Value, color = FFG)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ Isotope, scales = "free_y") +
  labs(
    x = "SC Level",
    y = "Mean Isotope Value",
    color = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "Scraper" = "#1b9e77",
      "Coleoptera Scraper" = "#d95f02",
      "Shredder" = "#7570b3",
      "Predator" = "#e7298a",
      "Collector-Gatherer" = "#66a61e",
      "Collector-Filterer" = "#e6ab02") ) + 
  theme_minimal()




# LM stats for d13C

library(dplyr)
library(tidyr)
library(purrr)
library(broom)


# Filter for d13C isotope
FFGsummary_d13C <- FFGsummary_df %>%
  filter(Isotope %in% c("mean_d13C")) %>%
  mutate(SC.Level = as.numeric(as.character(SC.Level)))  # Ensure numeric


# p-values and r2 for each FFG
Cglm_results <- FFGsummary_d13C %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Value ~ SC.Level, 
                         #family = Gamma(link = "log"),  # Gamma low AIC
                         family = gaussian(link = "identity"),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )

print(Cglm_results)

# Filter for d15N isotope
FFGsummary_d15N <- FFGsummary_df %>%
  filter(Isotope %in% c("mean_d15N")) %>%
  mutate(SC.Level = as.numeric(as.character(SC.Level)))  # Ensure numeric


# p-values and r2 for each FFG
Nglm_results <- FFGsummary_d15N %>%
  group_by(FFG) %>%
  summarise(
    glm_model = list(glm(Value ~ SC.Level, 
                         #family = Gamma(link = "log"),  # Gamma low AIC
                         family = gaussian(link = "identity"),
                         data = cur_data())),
    .groups = "drop"
  ) %>%
  mutate(    # Extract p-values and R² values from each model
    p_value = sapply(glm_model, function(model) summary(model)$coefficients[2, 4]),
    pseudo_r2 = sapply(glm_model, function(model) 1 - (model$deviance / model$null.deviance)),
    p_label = ifelse(p_value < 0.001, "< 0.001", sprintf("%.3f", p_value)),  # Format p-values
    r2_label = sprintf("R² = %.3f", pseudo_r2)  # Format R²
  )

print(Nglm_results)



# Adding food resources---------------------------------------------------------
CBOM <- read.csv("FilteredYear1CBOM.csv")
FBOM <- read.csv("FilteredYear1FBOM.csv")
Algae <- read.csv("FilteredYear1Algae.csv")

Algae <- Algae %>%
  mutate(Sample_Type = ifelse(Sample_Type == "Algae ", "Algae", Sample_Type))


# Seasonal and Annual CBOM
CBOM <- CBOM %>%
  group_by(Site, Replicate, Month, Sample_Type) %>%  # or Sample_ID, or any relevant combo
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)), .groups = "drop")


Season.CBOM <- CBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Month, Sample_Type) %>%
  summarise(
    season.mean.d13C = mean(d13C, na.rm = TRUE),
    season.mean.d15N = mean(d15N, na.rm = TRUE),
    season.mean.wt.C = mean(wt..C, na.rm = TRUE),
     season.mean.wt.N = mean(wt..N, na.rm = TRUE))
    
    
Annual.CBOM <- Season.CBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample_Type) %>%
  summarise(
    annual.mean.d13C = mean(season.mean.d13C, na.rm = TRUE),
    annual.mean.d15N = mean(season.mean.d15N, na.rm = TRUE),
    annual.mean.wt.C = mean(season.mean.wt.C, na.rm = TRUE),
    annual.mean.wt.N = mean(season.mean.wt.N, na.rm = TRUE))


# Seasonal and Annual FBOM
FBOM <- FBOM %>%
  group_by(Site, Replicate, Month, Sample_Type) %>%  # or Sample_ID, or any relevant combo
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)), .groups = "drop")


Season.FBOM <- FBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Month, Sample_Type) %>%
  summarise(
    season.mean.d13C = mean(d13C, na.rm = TRUE),
    season.mean.d15N = mean(d15N, na.rm = TRUE),
    season.mean.wt.C = mean(wt..C, na.rm = TRUE),
    season.mean.wt.N = mean(wt..N, na.rm = TRUE))


Annual.FBOM <- Season.FBOM %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample_Type) %>%
  summarise(
    annual.mean.d13C = mean(season.mean.d13C, na.rm = TRUE),
    annual.mean.d15N = mean(season.mean.d15N, na.rm = TRUE),
    annual.mean.wt.C = mean(season.mean.wt.C, na.rm = TRUE),
    annual.mean.wt.N = mean(season.mean.wt.N, na.rm = TRUE))

# Seasonal and Annual Algae
Algae <- Algae %>%
  group_by(Site, Replicate, Month, Sample_Type) %>%  # or Sample_ID, or any relevant combo
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)), .groups = "drop")


Season.Algae <- Algae %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Month, Sample_Type) %>%
  summarise(
    season.mean.d13C = mean(d13C, na.rm = TRUE),
    season.mean.d15N = mean(d15N, na.rm = TRUE),
    season.mean.wt.C = mean(wt..C, na.rm = TRUE),
    season.mean.wt.N = mean(wt..N, na.rm = TRUE))


Annual.Algae <- Season.Algae %>%
  mutate(Site = str_trim(Site)) %>%  # Trim whitespace from Site names
  group_by(Site, Sample_Type) %>%
  summarise(
    annual.mean.d13C = mean(season.mean.d13C, na.rm = TRUE),
    annual.mean.d15N = mean(season.mean.d15N, na.rm = TRUE),
    annual.mean.wt.C = mean(season.mean.wt.C, na.rm = TRUE),
    annual.mean.wt.N = mean(season.mean.wt.N, na.rm = TRUE))

# Combining food resources
food.season <- rbind(Season.CBOM,Season.FBOM,Season.Algae)
food.annual <- rbind(Annual.CBOM, Annual.FBOM, Annual.Algae)

# Cleaning up dataframes

Clean.SI.Season <- filterSI.season %>%
  dplyr::select(Site, Month, d13C = season.d13C, d15N = season.d15N, Label = Taxa)

Clean.food.season <- food.season %>%
  dplyr::select(Site, Month, d13C = season.mean.d13C, d15N = season.mean.d15N, Label = Sample_Type)

SI.season.macro.food <- bind_rows(Clean.food.season, Clean.SI.Season)

unique(SI.season.macro.food$Month)

SI.season.macro.food <- SI.season.macro.food %>% # Fixing typos
  mutate(Month = ifelse(Month == "February ", "February", Month))


# Adding back in information
# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
# CONUS primary feeding mode was how FFG was determined

SI.season.macro.food$FFG[SI.season.macro.food$Label=="Acroneuria"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Amphinemura"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Atherix"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Baetis"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Boyeria"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Cheumatopsyche"]="Collector-Filterer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Chironomini"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Collembola"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Dicranota"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Diplectrona"]="Collector-Filterer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Dixa"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Drunella"]="Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Dolophilodes"]="Collector-Filterer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Ectopria"]="Coleoptera Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Ephemera"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Ephemerella"]="Collector-Gatherer" 
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Ephemerellidae"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Eurylophella"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Glossosoma"]="Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Helichus"]="Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Hydatophylax"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Hydropsyche"]="Collector-Filterer" 
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Hydropsychidae"]="Collector-Filterer" 
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Isoperla"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Lanthus"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Lepidostoma"]= "Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Leuctra"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Molophilus"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Macronychus"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Neophylax"]="Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Nigronia"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Oligochaeta"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Orthocladiinae"]="Collector-Gatherer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Peltoperla"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Peltoperlidae"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Perlesta"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Platycentropus"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Prosimulium"]="Collector-Filterer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Psephenus"]="Coleoptera Scraper" 
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Psephenidae"]="Coleoptera Scraper"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Pteronarcys"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Pycnopsyche"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Rhagovelia"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Rhyacophila"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Sialis"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Simulium"]="Collector-Filterer"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Tallaperla"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Stenonema"]="Scraper" 
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Taeniopteryx"]="Shredder"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Tanypodinae"]="Predator"
SI.season.macro.food$FFG[SI.season.macro.food$Label=="Tipula"]="Shredder"


# Adding site characteristics like mean annual specific conductance
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="EAS"] = "16"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="CRO"] = "40"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="HCN"] = "77"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="HUR"] = "293"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="FRY"] = "350"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="RUT"] = "447"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="LLW"] = "1048"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="LLC"] = "1083"
SI.season.macro.food$SC.Level[SI.season.macro.food$Site =="RIC"] = "1185"

# Specific conductance category...
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="EAS"] = "REF"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="CRO"] = "REF"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="HCN"] = "REF"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="HUR"] = "MID"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="FRY"] = "MID"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="RUT"] = "MID"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="LLW"] = "HIGH"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="LLC"] = "HIGH"
SI.season.macro.food$SC.Category[SI.season.macro.food$Site =="RIC"] = "HIGH"

# Ordering everything
SI.season.macro.food$Site <- factor(SI.season.macro.food$Site, levels = c("EAS", "FRY","RIC"))
SI.season.macro.food$SC.Category <- factor(SI.season.macro.food$SC.Category, levels = c("REF","MID","HIGH"))
SI.season.macro.food$SC.Level <- factor(SI.season.macro.food$SC.Level, levels = c("16","350","1185"))
SI.season.macro.food$FFG <- factor(SI.season.macro.food$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
SI.season.macro.food$Month <- factor(SI.season.macro.food$Month, levels = c("October","February", "May","August"))

# Adding years back in
SI.season.macro.food <- SI.season.macro.food %>%
  mutate(Month = case_when(
    Month == "October"   ~ "October 2023",
    Month == "February"  ~ "February 2024",
    Month == "May"       ~ "May 2024",
    Month == "August"    ~ "August 2024",
    TRUE ~ as.character(Month)
  )) %>%
  mutate(Month = factor(Month, 
                              levels = c("October 2023", "February 2024", "May 2024", "August 2024")))

# Plotting!
SI.season.macro.food <- SI.season.macro.food %>%
  mutate(font_label = ifelse(Label %in% c("Algae", "CBOM", "FBOM"), "bold", "plain")) # Ensuring that food resources are bolded

ggplot(SI.season.macro.food, aes(x = d13C, y = d15N,
                                 color = SC.Category, shape = FFG)) +
  facet_wrap(~Month, scales = "free") +
  geom_point(size = 3) +
  geom_text_repel(aes(label = Label, fontface = font_label),
                  size = 3, show.legend = FALSE, max.overlaps = 50) +
  labs(
    x = "d13C",
    y = "d15N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)
  )



# Do this again but for annual values--------------------------

# Cleaning up dataframes

Clean.SI.Annual <- filterSI.year1 %>%
  dplyr::select(Site, d13C, d15N, Label = Taxa)

Clean.food.annual <- food.annual %>%
  dplyr::select(Site, d13C = annual.mean.d13C, d15N = annual.mean.d15N, Label = Sample_Type)

SI.annual.macro.food <- bind_rows(Clean.food.annual, Clean.SI.Annual)


# Adding back in information
# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
# CONUS primary feeding mode was how FFG was determined

SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Acroneuria"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Amphinemura"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Atherix"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Baetis"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Boyeria"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Cheumatopsyche"]="Collector-Filterer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Chironomini"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Collembola"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Dicranota"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Diplectrona"]="Collector-Filterer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Dixa"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Drunella"]="Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Dolophilodes"]="Collector-Filterer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Ectopria"]="Coleoptera Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Ephemera"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Ephemerella"]="Collector-Gatherer" 
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Ephemerellidae"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Eurylophella"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Glossosoma"]="Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Helichus"]="Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Hydatophylax"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Hydropsyche"]="Collector-Filterer" 
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Hydropsychidae"]="Collector-Filterer" 
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Isoperla"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Lanthus"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Lepidostoma"]= "Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Leuctra"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Molophilus"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Macronychus"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Neophylax"]="Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Nigronia"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Oligochaeta"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Orthocladiinae"]="Collector-Gatherer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Peltoperla"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Peltoperlidae"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Perlesta"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Platycentropus"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Prosimulium"]="Collector-Filterer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Psephenus"]="Coleoptera Scraper" 
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Psephenidae"]="Coleoptera Scraper"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Pteronarcys"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Pycnopsyche"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Rhagovelia"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Rhyacophila"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Sialis"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Simulium"]="Collector-Filterer"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Tallaperla"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Stenonema"]="Scraper" 
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Taeniopteryx"]="Shredder"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Tanypodinae"]="Predator"
SI.annual.macro.food$FFG[SI.annual.macro.food$Label=="Tipula"]="Shredder"


# Adding site characteristics like mean annual specific conductance
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="EAS"] = "16"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="CRO"] = "40"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="HCN"] = "77"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="HUR"] = "293"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="FRY"] = "350"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="RUT"] = "447"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="LLW"] = "1048"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="LLC"] = "1083"
SI.annual.macro.food$SC.Level[SI.annual.macro.food$Site =="RIC"] = "1185"

# Specific conductance category...
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="EAS"] = "REF"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="CRO"] = "REF"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="HCN"] = "REF"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="HUR"] = "MID"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="FRY"] = "MID"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="RUT"] = "MID"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="LLW"] = "HIGH"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="LLC"] = "HIGH"
SI.annual.macro.food$SC.Category[SI.annual.macro.food$Site =="RIC"] = "HIGH"

# Ordering everything
SI.annual.macro.food$Site <- factor(SI.annual.macro.food$Site, levels = c("EAS", "FRY","RIC"))
SI.annual.macro.food$SC.Category <- factor(SI.annual.macro.food$SC.Category, levels = c("REF","MID","HIGH"))
SI.annual.macro.food$SC.Level <- factor(SI.annual.macro.food$SC.Level, levels = c("16","350","1185"))
SI.annual.macro.food$FFG <- factor(SI.annual.macro.food$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))


# Plotting!
SI.annual.macro.food <- SI.annual.macro.food %>%
  mutate(font_label = ifelse(Label %in% c("Algae", "CBOM", "FBOM"), "bold", "plain")) # Ensuring that food resources are bolded

SI.annual.macro.food <- SI.annual.macro.food %>%
  mutate(is_food = Label %in% c("Algae", "CBOM", "FBOM"))


ggplot(SI.annual.macro.food, aes(x = d13C, y = d15N, color = SC.Category, shape = FFG)) +
  geom_point(size = 3) +
  
  # Food resource labels (bold, larger)
  geom_text_repel(
    data = subset(SI.annual.macro.food, is_food),
    aes(label = Label),
    fontface = "bold",
    size = 4,
    show.legend = FALSE,
    max.overlaps = 50,
    box.padding = 1.0,     # more space around text box
    point.padding = 0.7,   # more space around points
    segment.size = 0.0
  ) +
  
  # Taxa labels (plain, slightly smaller)
  geom_text_repel(
    data = subset(SI.annual.macro.food, !is_food),
    aes(label = Label),
    fontface = "plain",
    size = 2.9,
    show.legend = FALSE,
    max.overlaps = 50
  ) +
  
  labs(
    x = "d13C",
    y = "d15N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c("REF" = "#1b9e77", "MID" = "#d95f02", "HIGH" = "#7570b3")
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)
  )



# Looking at C:N ratios-----------------------------------------------------------

food.season <- food.season %>% 
  mutate(Atomic.CN = ((season.mean.wt.C/season.mean.wt.N) * (14/12)))

filterSI.season <- filterSI.season %>% 
  mutate(season.Atomic.CN = ((season.wtC/season.wtN) * (14/12))) 

Clean.SI.Season.Atomic <- filterSI.season %>%
  dplyr::select(Site, Month, season.wtN, season.wtC, season.Atomic.CN, Label = Taxa) 

Clean.food.season.Atomic <- food.season %>%
  dplyr::select(Site, Month, season.wtN = season.mean.wt.N, season.wtC = season.mean.wt.C,
                season.Atomic.CN = Atomic.CN, Label = Sample_Type)

SI.season.macro.food.Atomic <- bind_rows(Clean.SI.Season.Atomic, Clean.food.season.Atomic)

SI.season.macro.food.Atomic <- SI.season.macro.food.Atomic %>% # Fixing typos
  mutate(Month = ifelse(Month == "February ", "February", Month))



# Adding back in information
# Assigning functional feeding groups to genera (note: some "genera" are family or the lowest taxonomic resolution possible)
# CONUS primary feeding mode was how FFG was determined

SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Acroneuria"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Amphinemura"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Atherix"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Baetis"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Boyeria"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Cheumatopsyche"]="Collector-Filterer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Chironomini"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Collembola"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Dicranota"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Diplectrona"]="Collector-Filterer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Dixa"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Drunella"]="Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Dolophilodes"]="Collector-Filterer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Ectopria"]="Coleoptera Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Ephemera"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Ephemerella"]="Collector-Gatherer" 
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Ephemerellidae"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Eurylophella"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Glossosoma"]="Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Helichus"]="Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Hydatophylax"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Hydropsyche"]="Collector-Filterer" 
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Hydropsychidae"]="Collector-Filterer" 
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Isoperla"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Lanthus"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Lepidostoma"]= "Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Leuctra"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Molophilus"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Macronychus"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Neophylax"]="Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Nigronia"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Oligochaeta"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Orthocladiinae"]="Collector-Gatherer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Peltoperla"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Peltoperlidae"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Perlesta"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Platycentropus"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Prosimulium"]="Collector-Filterer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Psephenus"]="Coleoptera Scraper" 
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Psephenidae"]="Coleoptera Scraper"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Pteronarcys"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Pycnopsyche"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Rhagovelia"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Rhyacophila"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Sialis"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Simulium"]="Collector-Filterer"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Tallaperla"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Stenonema"]="Scraper" 
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Taeniopteryx"]="Shredder"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Tanypodinae"]="Predator"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label=="Tipula"]="Shredder"
# For each case where FFG is NA, set it to the correct Label value
SI.season.macro.food.Atomic$FFG <- as.character(SI.season.macro.food.Atomic$FFG)

SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "CBOM"] <- "CBOM"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "FBOM"] <- "FBOM"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "Algae"] <- "Algae"

# If you still want FFG as a factor afterward:
SI.season.macro.food.Atomic$FFG <- factor(SI.season.macro.food.Atomic$FFG)

SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "CBOM"] <- "CBOM"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "FBOM"] <- "FBOM"
SI.season.macro.food.Atomic$FFG[SI.season.macro.food.Atomic$Label == "Algae"] <- "Algae"



# Adding site characteristics like mean annual specific conductance
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="EAS"] = "16"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="CRO"] = "40"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="HCN"] = "77"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="HUR"] = "293"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="FRY"] = "350"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="RUT"] = "447"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="LLW"] = "1048"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="LLC"] = "1083"
SI.season.macro.food.Atomic$SC.Level[SI.season.macro.food.Atomic$Site =="RIC"] = "1185"

# Specific conductance category...
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="EAS"] = "REF"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="CRO"] = "REF"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="HCN"] = "REF"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="HUR"] = "MID"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="FRY"] = "MID"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="RUT"] = "MID"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="LLW"] = "HIGH"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="LLC"] = "HIGH"
SI.season.macro.food.Atomic$SC.Category[SI.season.macro.food.Atomic$Site =="RIC"] = "HIGH"

# Ordering everything
SI.season.macro.food.Atomic$Site <- factor(SI.season.macro.food.Atomic$Site, levels = c("EAS", "FRY","RIC"))
SI.season.macro.food.Atomic$SC.Category <- factor(SI.season.macro.food.Atomic$SC.Category, levels = c("REF","MID","HIGH"))
SI.season.macro.food.Atomic$SC.Level <- factor(SI.season.macro.food.Atomic$SC.Level, levels = c("16","350","1185"))
SI.season.macro.food.Atomic$FFG <- factor(SI.season.macro.food.Atomic$FFG, levels = c("Scraper","Coleoptera Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
SI.season.macro.food.Atomic$Month <- factor(SI.season.macro.food.Atomic$Month, levels = c("October","February", "May","August"))

# Adding years back in
SI.season.macro.food.Atomic <- SI.season.macro.food.Atomic %>%
  mutate(Month = case_when(
    Month == "October"   ~ "October 2023",
    Month == "February"  ~ "February 2024",
    Month == "May"       ~ "May 2024",
    Month == "August"    ~ "August 2024",
    TRUE ~ as.character(Month)
  )) %>%
  mutate(Month = factor(Month, 
                        levels = c("October 2023", "February 2024", "May 2024", "August 2024")))


# Plotting!
SI.season.macro.food.Atomic <- SI.season.macro.food.Atomic %>%
  mutate(font_label = ifelse(Label %in% c("Algae", "CBOM", "FBOM"), "bold", "plain")) # Ensuring that food resources are bolded

ggplot(SI.season.macro.food.Atomic, aes(x = season.wtC, y = season.wtN,
                                 color = SC.Category, shape = FFG)) +
  facet_wrap(~Month, scales = "free") +
  geom_point(size = 3) +
  geom_text_repel(aes(label = Label, fontface = font_label),
                  size = 3, segment.size = 0.9,show.legend = FALSE, max.overlaps = 50) +
  labs(
    x = "wt % C",
    y = "wt % N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)
  )


# this is ugly
ggplot(SI.season.macro.food.Atomic, aes(x = FFG, y = season.Atomic.CN,
                                        color = SC.Category, shape = FFG)) +
  facet_wrap(~Month, scales = "free") +
  geom_point(size = 3) +
  geom_text_repel(aes(label = Label, fontface = font_label),
                  size = 3, show.legend = FALSE, max.overlaps = 50) +
  labs(
    x = "wt % C",
    y = "wt % N",
    color = "SC Category",
    shape = "FFG"
  ) +
  scale_color_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)
  )


library(ggplot2)
library(dplyr)

ggplot(SI.season.macro.food.Atomic, 
       aes(x = FFG, y = season.Atomic.CN, fill = SC.Category)) +
  facet_wrap(~Month, scales = "free") +
  stat_summary(fun = mean, geom = "bar", 
               position = position_dodge(width = 0.9), width = 0.7) +
  stat_summary(fun.data = mean_se, geom = "errorbar", 
               position = position_dodge(width = 0.9), width = 0.3) +
  labs(
    x = "Feeding Functional Group",
    y = "Atomic C:N",
    fill = "SC Category"
  ) +
  scale_fill_manual(
    values = c(
      "REF" = "#1b9e77",
      "MID" = "#d95f02",
      "HIGH" = "#7570b3"
    )
  ) +
  theme_minimal(base_size = 12) +
  theme(
    strip.background = element_rect(fill = "gray90", color = "black", linewidth = 0.5),
    strip.text = element_text(face = "bold"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5)
  )




# Attempting a mixing model

install.packages("MixSIAR")
library(MixSIAR)




