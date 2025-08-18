


# ADDING IN LENGTH-MASS EQUATIONS
SECPROD <- SECPROD %>%
  mutate(
    Biomass.mg = case_when(
      Genus == "Acentrella" ~ (0.00962 * (Length ^ 2.75)) * Abundance,
      Genus == "Acerpenna" ~ (0.0076 * (Length ^ 2.691)) * Abundance,
      Genus == "Acroneuria" ~ (0.0019 * (Length ^ 3.232)) * Abundance,
      Genus == "Allocapnia" ~ (0.004 * (Length ^ 2.487)) * Abundance,
      Genus == "Allognasta" ~ (0.0032 * (Length ^ 2.61)) * Abundance,
      Genus == "Alloperla" ~ (0.0062 * (Length ^ 2.724)) * Abundance,
      Genus == "Ameletus" ~ (0.0077 * (Length ^ 2.588)) * Abundance,
      Genus == "Amphinemura" ~ (0.004 * (Length ^ 2.975)) * Abundance,
      Genus == "Antocha" ~ (0.0041 * (Length ^ 2.4439)) * Abundance,
      Genus == "Atherix" ~ (0.0038 * (Length ^ 2.586)) * Abundance,
      Genus == "Attenella" ~ (0.00928 * (Length ^ 2.9)) * Abundance,
      Genus == "Baetis" ~ (0.0076 * (Length ^ 2.691)) * Abundance,
      Genus == "Baetidae" ~ (0.0076 * (Length ^ 2.691)) * Abundance,
      Genus == "Baetisca" ~ (0.0116 * (Length ^ 2.905)) * Abundance,
      Genus == "Boyeria" ~ (0.0082 * (Length ^ 2.813)) * Abundance,
      Genus == "Calopteryx" ~ (0.005 * (Length ^ 2.742)) * Abundance,
      Genus == "Cernotina" ~ (0.0071 * (Length ^ 2.531)) * Abundance, # Polycentropodidae family
      Genus == "Chauliodes" ~ (0.0062 * (Length ^ 2.691)) * Abundance,
      Genus == "Chelifera" ~ (0.004 * (Length ^ 2.655)) * Abundance,
      Genus == "Cheumatopsyche" ~ (0.0045 * (Length ^ 2.721)) * Abundance,
      Genus == "Chimarra" ~ (0.0044 * (Length ^ 2.652)) * Abundance,
      Genus == "Chironomini" ~ (0.0007 * (Length ^ 2.952)) * Abundance,
      Genus == "Collembola" ~ (0.0024 * (Length ^ 3.676)) * Abundance,
      Genus == "Cordulegaster" ~ (0.0067 * (Length ^ 2.782)) * Abundance,
      Genus == "Cyrnellus" ~ (0.0071 * (Length ^ 2.531)) * Abundance,
      Genus == "Dicranota" ~ (0.0027 * (Length ^ 2.637)) * Abundance,
      Genus == "Diplectrona" ~ (0.0049 * (Length ^ 2.62)) * Abundance,
      Genus == "Discocerina" ~ (0.00033 * (Length ^ 3.55)) * Abundance,
      Genus == "Dixa" ~ (0.0433 * (Length ^ 0)) * Abundance,
      Genus == "Dixella" ~ (0.0433 * (Length ^ 0)) * Abundance,
      Genus == "Dolophilodes" ~ (0.00408 * (Length ^ 2.82)) * Abundance,
      Genus == "Ectopria" ~ (0.0164 * (Length ^ 2.929)) * Abundance,
      Genus == "Eloeophila" ~ (0.0014 * (Length ^ 2.667)) * Abundance,
      Genus == "Ephemera" ~ (0.0021 * (Length ^ 2.737)) * Abundance,
      Genus == "Epeorus" ~ (0.0121 * (Length ^ 2.667)) * Abundance,
      Genus == "Eriopterini" ~ (0.0016 * (Length ^ 2.914)) * Abundance, # Limoniidae family
      Genus == "Eurylophella" ~ (0.008 * (Length ^ 2.663)) * Abundance,
      Genus == "Gerris" ~ (0.015 * (Length ^ 2.596)) * Abundance,
      Genus == "Glossosoma" ~ (0.0092 * (Length ^ 2.888)) * Abundance,
      Genus == "Goera" ~ (0.00156 * (Length ^ 2.75)) * Abundance,
      Genus == "Gomphus" ~ (00.044 * (Length ^ 3.124)) * Abundance,
      Genus == "Gyrinus" ~ (0.0531 * (Length ^ 2.586)) * Abundance, # Dineutes sp. from Benke
      Genus == "Hagenella" ~ (0.0054 * (Length ^ 2.811)) * Abundance, # Ptilostomis from Benke
      Genus == "Hemiptera" ~ (0.00836 * (Length ^ 3.075)) * Abundance,
      Genus == "Hetaerina" ~ (0.005 * (Length ^ 2.742)) * Abundance,
      Genus == "Helichus" ~ (0.0011 * (Length ^ 3.1)) * Abundance,
      Genus == "Hexatoma" ~ (0.0042 * (Length ^ 2.596)) * Abundance,
      Genus == "Hydatophylax" ~ (0.0049 * (Length ^ 2.85)) * Abundance,
      Genus == "Hydropsyche" ~ (0.0051 * (Length ^ 2.824)) * Abundance,
      Genus == "Isonychia" ~ (0.0031 * (Length ^ 3.167)) * Abundance,
      Genus == "Isoperla" ~ (0.01 * (Length ^ 2.658)) * Abundance,
      Genus == "Langessa" ~ (0.00271 * (Length ^ 2.959)) * Abundance, # Lepidoptera from Greg's sheet 
      Genus == "Lanthus" ~ (0.0097 * (Length ^ 2.895)) * Abundance,
      Genus == "Lepidostoma" ~ (0.0079 * (Length ^ 2.649)) * Abundance,
      Genus == "Leuctra" ~ (0.003 * (Length ^ 2.761)) * Abundance,
      Genus == "Limnephilidae" ~ (0.0049 * (Length ^ 2.85)) * Abundance,
      Genus == "Limnophila" ~ (0.0014 * (Length ^ 2.667)) * Abundance,
      Genus == "Limoniidae" ~ (0.0016 * (Length ^ 2.914)) * Abundance,
      Genus == "Lypodiversa" ~ (0.0039 * (Length ^ 2.873)) * Abundance, # Polycentropodidae family
      Genus == "Micrasema" ~ (0.0181 * (Length ^ 2.410)) * Abundance,
      Genus == "Microvelia" ~ (0.0083 * (Length ^ 2.777)) * Abundance,
      Genus == "Molophilus" ~ (0.0016 * (Length ^ 2.914)) * Abundance, 
      Genus == "Neocleon" ~ (0.0076 * (Length ^ 2.691)) * Abundance,# Baetis formula
      Genus == "Neophylax" ~ (0.0049 * (Length ^ 2.85)) * Abundance,
      Genus == "Neoplasta" ~ (0.004 * (Length ^ 2.655)) * Abundance,
      Genus == "Nigronia" ~ (0.0062 * (Length ^ 2.691)) * Abundance,
      Genus == "Optioservus" ~ (0.0039 * (Length ^ 2.96)) * Abundance,
      Genus == "Oreogeton" ~ (0.0033 * (Length ^ 2.392)) * Abundance,
      Genus == "Orthocladine" ~ (0.002 * (Length ^ 2.254)) * Abundance,
      Genus == "Oulimnius" ~ (0.0138 * (Length ^ 2.5548)) * Abundance,
      Genus == "Paracapnia" ~ (0.004 * (Length ^ 2.487)) * Abundance,
      Genus == "Paraleptophlebia" ~ (0.0038 * (Length ^ 2.918)) * Abundance,
      Genus == "Polycentropodidae" ~ (0.0071 * (Length ^ 2.531)) * Abundance,
      Genus == "Polycentropus" ~ (0.0071 * (Length ^ 2.531)) * Abundance,
      Genus == "Probezzia" ~ (0.0033 * (Length ^ 2.392)) * Abundance,
      Genus == "Prodaticus" ~ (0.1029 * (Length ^ 0)) * Abundance,
      Genus == "Prosimulium" ~ (0.0012 * (Length ^ 3.19)) * Abundance, 
      Genus == "Prostoia" ~ (0.004 * (Length ^ 2.975)) * Abundance,
      Genus == "Psephenus" ~ (0.0077 * (Length ^ 2.883)) * Abundance,
      Genus == "Pseudolimnophila" ~ (0.0014 * (Length ^ 2.667)) * Abundance,
      Genus == "Pteronarcys" ~ (0.0064 * (Length ^ 2.845)) * Abundance,
      Genus == "Pycnopsyche" ~ (0.0049 * (Length ^ 2.85)) * Abundance,
      Genus == "Psychodini" ~ (0.0007 * (Length ^ 2.592)) * Abundance, # Chironomini equation
      Genus == "Remenus" ~ (0.0119 * (Length ^ 2.695)) * Abundance,
      Genus == "Rhagovelia" ~ (0.0083 * (Length ^ 2.777)) * Abundance,
      Genus == "Rhyacophila" ~ (0.0099 * (Length ^ 2.48)) * Abundance,
      Genus == "Sialis" ~ (0.0031 * (Length ^ 2.801)) * Abundance,
      Genus == "Simulium" ~ (0.004 * (Length ^ 2.807)) * Abundance,
      Genus == "Stenelmis" ~ (0.0111 * (Length ^ 2.49)) * Abundance,
      Genus == "Stenonema" ~ (0.0128 * (Length ^ 2.616)) * Abundance, 
      Genus == "Stratiomyidae" ~ (0.005 * (Length ^ 2.591)) * Abundance,
      Genus == "Stylogomphus" ~ (0.0097 * (Length ^ 2.895)) * Abundance,
      Genus == "Tallaperla" ~ (0.0194 * (Length ^ 2.853)) * Abundance,
      Genus == "Taeniopteryx" ~ (0.0067 * (Length ^ 2.711)) * Abundance,
      Genus == "Tanypodinae" ~ (0.0038 * (Length ^ 0.0006)) * Abundance,
      Genus == "Tanytarsini" ~ (0.0008 * (Length ^ 2.728)) * Abundance,
      Genus == "Tipula" ~ (0.0064 * (Length ^ 2.443)) * Abundance, 
      Genus == "Triacanthagyna" ~ (0.0082 * (Length ^ 2.813)) * Abundance, # Using Boyeria from Benke
      Genus == "Wormaldia" ~ (0.0044 * (Length ^ 2.652)) * Abundance,
      Genus == "Zoraena" ~ (0.0067 * (Length ^ 2.782)) * Abundance, # Family Cordulegaster
      TRUE ~ NA_real_  # Assign NA for genera not specified
    ))

# checking for NAs, should be zero!
sum(is.na(SECPROD$Biomass.mg))


# Finally, let's add a new Density column, then use it to correct biomass by area
SECPROD <- SECPROD %>% 
  mutate(Density = Abundance / 0.0929) %>% # Making density column
  mutate(Biomass.g = Biomass.mg / 1000) %>% # Biomass was in mg bc of the length mass regressions, divide by 1000 to get to g
  mutate(Biomass.Area.Corrected = Biomass.g*Density) # Making biomass.area.corrected column



SECPROD$FFG[SECPROD$Genus=="Acerpenna"] ="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Acentrella"] = "Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Acroneuria"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Allocapnia"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Allognasta"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Alloperla"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Ameletus"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Amphinemura"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Antocha"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Atherix"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Attenella"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Baetidae"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Baetis"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Baetisca"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Boyeria"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Calopteryx"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Capniidae"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Ceratopogonidae"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Cernotina"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Chauliodes"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Chelifera"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Chimarra"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Cheumatopsyche"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Chironomidae"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Chironomini"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Circulionidae"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Collembola"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Cordulegaster"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Cyrnellus"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Dicranota"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Diplectrona"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Discocerina"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Dixa"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Dixella"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Dolophilodes"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Ectopria"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Eloeophila"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Epeorus"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Eriopterini"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Ephemera"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Ephemerellidae"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Eurylophella"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Gerris"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Glossosoma"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Goera"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Gomphus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Gomphurus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Gyrinus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Hagenella"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Helichus"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Hemiptera"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Heptageniidae"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Hetaerina"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Hexatoma"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Hydrachnia"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Hydatophylax"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Hydropsyche"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Isonychia"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Isoperla"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Langessa"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Lanthus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Leptophlebiidae"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Lepidostoma"]= "Shredder"
SECPROD$FFG[SECPROD$Genus=="Leuctra"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Leuctridae"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Limnephilidae"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Limnophila"]= "Predator"
SECPROD$FFG[SECPROD$Genus=="Limoniidae"]= "Shredder"
SECPROD$FFG[SECPROD$Genus=="Lypodiversa"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Micrasema"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Microvelia"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Molophilus"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Neocleon"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Neophylax"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Neoplasta"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Nigronia"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Oligochaeta"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Optioservus"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Oreogeton"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Orthocladine"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Oulimnius"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Paracapnia"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Paraleptophlebia"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Polycentropodidae"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Polycentropus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Probezzia"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Prodaticus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Prosimulium"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Psephenus"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Pseudolimnophila"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Psychodini"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Pteronarcys"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Pycnopsyche"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Remenus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Rhagovelia"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Rhyacophila"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Prostoia"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Sialis"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Simulium"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Stratiomyidae"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Stylogomphus"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Tallaperla"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Stenelmis"]="Scraper"
SECPROD$FFG[SECPROD$Genus=="Stenonema"]="Scraper" 
SECPROD$FFG[SECPROD$Genus=="Taeniopteryx"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Tanypodinae"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Tanytarsini"]="Collector-Gatherer"
SECPROD$FFG[SECPROD$Genus=="Tipula"]="Shredder"
SECPROD$FFG[SECPROD$Genus=="Triacanthagyna"]="Predator"
SECPROD$FFG[SECPROD$Genus=="Wormaldia"]="Collector-Filterer"
SECPROD$FFG[SECPROD$Genus=="Zoraena"]="Predator"


# If you want to remove any terrestrials, etc.
SECPROD <- SECPROD %>%
  filter(
    Biomass != 0,  # Filter out rows where Biomass is zero
    !str_detect(Genus, "Hydrachnia|Circulionidae|Oligochaeta|Stagnicola|Terrestrial|Pupa|Adult|\\(A\\)|\\(terrestrial\\)")  # Exclude rows with "Pupa", "Adult", or "(A)", Stagnicola, etc.
  )
