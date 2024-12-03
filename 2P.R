# Secondary production code for Kelley Sinning Salty Carbon Data

# Updated >1 mm biomass data for Kelley Sinning Salty Carbon Data

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

# Setting the working directory to "SUMMARY SHEETS" where I store my biomass
setwd("~/Library/CloudStorage/GoogleDrive-ksinning@vt.edu/My Drive/Data/saltyC_VirginiaTech/SUMMARY SHEETS")

# Ok, bring in the csv summary sheets for each site and month
# September monthly
EASsept=read.csv("EAS_Sept.2023_SUMMARY.csv")
FRYsept=read.csv("FRY_Sept.2023_SUMMARY.csv")
RICsept=read.csv("RIC_Sept.2023_SUMMARY.csv")
# October quarterly
CROoct=read.csv("CRO_Oct.2023_SUMMARY.csv")
EASoct=read.csv("EAS_Oct.2023_SUMMARY.csv")
HCNoct=read.csv("HCN_Oct.2023_SUMMARY.csv")
FRYoct=read.csv("FRY_Oct.2023_SUMMARY.csv")
HURoct=read.csv("HUR_Oct.2023_SUMMARY.csv")
RUToct=read.csv("RUT_Oct.2023_SUMMARY.csv")
LLWoct=read.csv("LLW_Oct.2023_SUMMARY.csv")
LLCoct=read.csv("LLC_Oct.2023_SUMMARY.csv")
RICoct=read.csv("RIC_Oct.2023_SUMMARY.csv")
# November monthly
EASnov=read.csv("EAS_Nov.2023_SUMMARY.csv")
FRYnov=read.csv("FRY_Nov.2023_SUMMARY.csv")
RICnov=read.csv("RIC_Nov.2023_SUMMARY.csv")
# December monthly
EASdec=read.csv("EAS_Dec.2023_SUMMARY.csv")
FRYdec=read.csv("FRY_Dec.2023_SUMMARY.csv")
RICdec=read.csv("RIC_Dec.2023_SUMMARY.csv")
# January monthly
EASjan=read.csv("EAS_Jan.2024_SUMMARY.csv")
FRYjan=read.csv("FRY_Jan.2024_SUMMARY.csv")
RICjan=read.csv("RIC_Jan.2024_SUMMARY.csv")
# February quarterly
CROfeb=read.csv("CRO_Feb.2024_SUMMARY.csv")
EASfeb=read.csv("EAS_Feb.2024_SUMMARY.csv")
HCNfeb=read.csv("HCN_Feb.2024_SUMMARY.csv")
FRYfeb=read.csv("FRY_Feb.2024_SUMMARY.csv")
HURfeb=read.csv("HUR_Feb.2024_SUMMARY.csv")
RUTfeb=read.csv("RUT_Feb.2024_SUMMARY.csv")
LLWfeb=read.csv("LLW_Feb.2024_SUMMARY.csv")
LLCfeb=read.csv("LLC_Feb.2024_SUMMARY.csv")
RICfeb=read.csv("RIC_Feb.2024_SUMMARY.csv")
# March monthly
EASmarch=read.csv("EAS_March.2024_SUMMARY.csv")
FRYmarch=read.csv("FRY_March.2024_SUMMARY.csv")
RICmarch=read.csv("RIC_March.2024_SUMMARY.csv")
# April monthly
EASapril=read.csv("EAS_April.2024_SUMMARY.csv")
FRYapril=read.csv("FRY_April.2024_SUMMARY.csv")
RICapril=read.csv("RIC_April.2024_SUMMARY.csv")
# May quarterly
CROmay=read.csv("CRO_May.2024_SUMMARY.csv")
EASmay=read.csv("EAS_May.2024_SUMMARY.csv")
HCNmay=read.csv("HCN_May.2024_SUMMARY.csv")
FRYmay=read.csv("FRY_May.2024_SUMMARY.csv")
HURmay=read.csv("HUR_May.2024_SUMMARY.csv")
RUTmay=read.csv("RUT_May.2024_SUMMARY.csv")
LLWmay=read.csv("LLW_May.2024_SUMMARY.csv")
LLCmay=read.csv("LLC_May.2024_SUMMARY.csv")
RICmay=read.csv("RIC_May.2024_SUMMARY.csv")
# June monthly
EASjune=read.csv("EAS_June.2024_SUMMARY.csv")
FRYjune=read.csv("FRY_June.2024_SUMMARY.csv")
RICjune=read.csv("RIC_June.2024_SUMMARY.csv")
# July monthly
EASjuly=read.csv("EAS_July.2024_SUMMARY.csv")
FRYjuly=read.csv("FRY_July.2024_SUMMARY.csv")
RICjuly=read.csv("RIC_July.2024_SUMMARY.csv")
# August quarterly
CROaug=read.csv("CRO_Aug.2024_SUMMARY.csv")
EASaug=read.csv("EAS_Aug.2024_SUMMARY.csv")
HCNaug=read.csv("HCN_Aug.2024_SUMMARY.csv")
FRYaug=read.csv("FRY_Aug.2024_SUMMARY.csv")
HURaug=read.csv("HUR_Aug.2024_SUMMARY.csv")
RUTaug=read.csv("RUT_Aug.2024_SUMMARY.csv")
LLWaug=read.csv("LLW_Aug.2024_SUMMARY.csv")
LLCaug=read.csv("LLC_Aug.2024_SUMMARY.csv")
RICaug=read.csv("RIC_Aug.2024_SUMMARY.csv")



# Adding a column with site name bc once we merge we won't know
# September monthly
EASsept$Site <- c("EAS")
FRYsept$Site <- c("FRY")
RICsept$Site <- c("RIC")
# October quarterly
CROoct$Site <- c("CRO")
EASoct$Site <- c("EAS")
HCNoct$Site <- c("HCN")
FRYoct$Site <- c("FRY")
HURoct$Site <- c("HUR")
RUToct$Site <- c("RUT")
LLWoct$Site <- c("LLW")
LLCoct$Site <- c("LLC")
RICoct$Site <- c("RIC")
# November monthly
EASnov$Site <- c("EAS")
FRYnov$Site <- c("FRY")
RICnov$Site <- c("RIC")
# December monthly
EASdec$Site <- c("EAS")
FRYdec$Site <- c("FRY")
RICdec$Site <- c("RIC")
# January monthly
EASjan$Site <- c("EAS")
FRYjan$Site <- c("FRY")
RICjan$Site <- c("RIC")
# February quarterly
CROfeb$Site <- c("CRO")
EASfeb$Site <- c("EAS")
HCNfeb$Site <- c("HCN")
FRYfeb$Site <- c("FRY")
HURfeb$Site <- c("HUR")
RUTfeb$Site <- c("RUT")
LLWfeb$Site <- c("LLW")
LLCfeb$Site <- c("LLC")
RICfeb$Site <- c("RIC")
# March monthly
EASmarch$Site <- c("EAS")
FRYmarch$Site <- c("FRY")
RICmarch$Site <- c("RIC")
# April monthly
EASapril$Site <- c("EAS")
FRYapril$Site <- c("FRY")
RICapril$Site <- c("RIC")
# May quarterly
CROmay$Site <- c("CRO")
EASmay$Site <- c("EAS")
HCNmay$Site <- c("HCN")
FRYmay$Site <- c("FRY")
HURmay$Site <- c("HUR")
RUTmay$Site <- c("RUT")
LLWmay$Site <- c("LLW")
LLCmay$Site <- c("LLC")
RICmay$Site <- c("RIC")
# June monthly
EASjune$Site <- c("EAS")
FRYjune$Site <- c("FRY")
RICjune$Site <- c("RIC")
# July monthly
EASjuly$Site <- c("EAS")
FRYjuly$Site <- c("FRY")
RICjuly$Site <- c("RIC")
# August quarterly
CROaug$Site <- c("CRO")
EASaug$Site <- c("EAS")
HCNaug$Site <- c("HCN")
FRYaug$Site <- c("FRY")
HURaug$Site <- c("HUR")
RUTaug$Site <- c("RUT")
LLWaug$Site <- c("LLW")
LLCaug$Site <- c("LLC")
RICaug$Site <- c("RIC")



# Adding a column with sample month so the dates aren't weird
# September monthly
EASsept$Sample.Month <- c("September")
FRYsept$Sample.Month <- c("September")
RICsept$Sample.Month <- c("September")
# October quarterly
CROoct$Sample.Month <- c("October")
EASoct$Sample.Month <- c("October")
HCNoct$Sample.Month <- c("October")
FRYoct$Sample.Month <- c("October")
HURoct$Sample.Month <- c("October")
RUToct$Sample.Month <- c("October")
LLWoct$Sample.Month <- c("October")
LLCoct$Sample.Month <- c("October")
RICoct$Sample.Month <- c("October")
# November monthly
EASnov$Sample.Month <- c("November")
FRYnov$Sample.Month <- c("November")
RICnov$Sample.Month <- c("November")
# December monthly
EASdec$Sample.Month <- c("December")
FRYdec$Sample.Month <- c("December")
RICdec$Sample.Month <- c("December")
# January monthly
EASjan$Sample.Month <- c("January")
FRYjan$Sample.Month <- c("January")
RICjan$Sample.Month <- c("January")
# February quarterly
CROfeb$Sample.Month <- c("February")
EASfeb$Sample.Month <- c("February")
HCNfeb$Sample.Month <- c("February")
FRYfeb$Sample.Month <- c("February")
HURfeb$Sample.Month <- c("February")
RUTfeb$Sample.Month <- c("February")
LLWfeb$Sample.Month <- c("February")
LLCfeb$Sample.Month <- c("February")
RICfeb$Sample.Month <- c("February")
# March monthly
EASmarch$Sample.Month <- c("March")
FRYmarch$Sample.Month <- c("March")
RICmarch$Sample.Month <- c("March")
# April monthly
EASapril$Sample.Month <- c("April")
FRYapril$Sample.Month <- c("April")
RICapril$Sample.Month <- c("April")
# May quarterly
CROmay$Sample.Month <- c("May")
EASmay$Sample.Month <- c("May")
HCNmay$Sample.Month <- c("May")
FRYmay$Sample.Month <- c("May")
HURmay$Sample.Month <- c("May")
RUTmay$Sample.Month <- c("May")
LLWmay$Sample.Month <- c("May")
LLCmay$Sample.Month <- c("May")
RICmay$Sample.Month <- c("May")
# June monthly
EASjune$Sample.Month <- c("June")
FRYjune$Sample.Month <- c("June")
RICjune$Sample.Month <- c("June")
# July monthly
EASjuly$Sample.Month <- c("July")
FRYjuly$Sample.Month <- c("July")
RICjuly$Sample.Month <- c("July")
# August quarterly
CROaug$Sample.Month <- c("August")
EASaug$Sample.Month <- c("August")
HCNaug$Sample.Month <- c("August")
FRYaug$Sample.Month <- c("August")
HURaug$Sample.Month <- c("August")
RUTaug$Sample.Month <- c("August")
LLWaug$Sample.Month <- c("August")
LLCaug$Sample.Month <- c("August")
RICaug$Sample.Month <- c("August")




# Adding a column with SC level bc once we merge we won't know
# September monthly
EASsept$SC.Level <- c("25")
FRYsept$SC.Level <- c("402")
RICsept$SC.Level <- c("1457")
# October quarterly
CROoct$SC.Level <- c("72")
EASoct$SC.Level <- c("25")
HCNoct$SC.Level <- c("78")
FRYoct$SC.Level <- c("402")
HURoct$SC.Level <- c("387")
RUToct$SC.Level <- c("594")
LLWoct$SC.Level <- c("1119")
LLCoct$SC.Level <- c("1242")
RICoct$SC.Level <- c("1457")
# November monthly
EASnov$SC.Level <- c("25")
FRYnov$SC.Level <- c("402")
RICnov$SC.Level <- c("1457")
# December monthly
EASdec$SC.Level <- c("25")
FRYdec$SC.Level <- c("402")
RICdec$SC.Level <- c("1457")
# January monthly
EASjan$SC.Level <- c("25")
FRYjan$SC.Level <- c("402")
RICjan$SC.Level <- c("1457")
# February quarterly
CROfeb$SC.Level <- c("72")
EASfeb$SC.Level <- c("25")
HCNfeb$SC.Level <- c("78")
FRYfeb$SC.Level <- c("402")
HURfeb$SC.Level <- c("387")
RUTfeb$SC.Level <- c("594")
LLWfeb$SC.Level <- c("1119")
LLCfeb$SC.Level <- c("1242")
RICfeb$SC.Level <- c("1457")
# March monthly
EASmarch$SC.Level <- c("25")
FRYmarch$SC.Level <- c("402")
RICmarch$SC.Level <- c("1457")
# April monthly
EASapril$SC.Level <- c("25")
FRYapril$SC.Level <- c("402")
RICapril$SC.Level <- c("1457")
# May quarterly
CROmay$SC.Level <- c("72")
EASmay$SC.Level <- c("25")
HCNmay$SC.Level <- c("78")
FRYmay$SC.Level <- c("402")
HURmay$SC.Level <- c("387")
RUTmay$SC.Level <- c("594")
LLWmay$SC.Level <- c("1119")
LLCmay$SC.Level <- c("1242")
RICmay$SC.Level <- c("1457")
# June monthly
EASjune$SC.Level <- c("25")
FRYjune$SC.Level <- c("402")
RICjune$SC.Level <- c("1457")
# July monthly
EASjuly$SC.Level <- c("25")
FRYjuly$SC.Level <- c("402")
RICjuly$SC.Level <- c("1457")
# August quarterly
CROaug$SC.Level <- c("72")
EASaug$SC.Level <- c("25")
HCNaug$SC.Level <- c("78")
FRYaug$SC.Level <- c("402")
HURaug$SC.Level <- c("387")
RUTaug$SC.Level <- c("594")
LLWaug$SC.Level <- c("1119")
LLCaug$SC.Level <- c("1242")
RICaug$SC.Level <- c("1457")



# Adding a column with SC Category bc once we merge we won't know
# September monthly
EASsept$SC.Category <- c("REF")
FRYsept$SC.Category <- c("MID")
RICsept$SC.Category <- c("HIGH")
# October quarterly
CROoct$SC.Category <- c("REF")
EASoct$SC.Category <- c("REF")
HCNoct$SC.Category <- c("REF")
FRYoct$SC.Category <- c("MID")
HURoct$SC.Category <- c("MID")
RUToct$SC.Category <- c("MID")
LLWoct$SC.Category <- c("HIGH")
LLCoct$SC.Category <- c("HIGH")
RICoct$SC.Category <- c("HIGH")
# November monthly
EASnov$SC.Category <- c("REF")
FRYnov$SC.Category <- c("MID")
RICnov$SC.Category <- c("HIGH")
# December monthly
EASdec$SC.Category <- c("REF")
FRYdec$SC.Category <- c("MID")
RICdec$SC.Category <- c("HIGH")
# January monthly
EASjan$SC.Category <- c("REF")
FRYjan$SC.Category <- c("MID")
RICjan$SC.Category <- c("HIGH")
# February quarterly
CROfeb$SC.Category <- c("REF")
EASfeb$SC.Category <- c("REF")
HCNfeb$SC.Category <- c("REF")
FRYfeb$SC.Category <- c("MID")
HURfeb$SC.Category <- c("MID")
RUTfeb$SC.Category <- c("MID")
LLWfeb$SC.Category <- c("HIGH")
LLCfeb$SC.Category <- c("HIGH")
RICfeb$SC.Category <- c("HIGH")
# March monthly
EASmarch$SC.Category <- c("REF")
FRYmarch$SC.Category <- c("MID")
RICmarch$SC.Category <- c("HIGH")
# April monthly
EASapril$SC.Category <- c("REF")
FRYapril$SC.Category <- c("MID")
RICapril$SC.Category <- c("HIGH")
# May quarterly
CROmay$SC.Category <- c("REF")
EASmay$SC.Category <- c("REF")
HCNmay$SC.Category <- c("REF")
FRYmay$SC.Category <- c("MID")
HURmay$SC.Category <- c("MID")
RUTmay$SC.Category <- c("MID")
LLWmay$SC.Category <- c("HIGH")
LLCmay$SC.Category <- c("HIGH")
RICmay$SC.Category <- c("HIGH")
# June monthly
EASjune$SC.Category <- c("REF")
FRYjune$SC.Category <- c("MID")
RICjune$SC.Category <- c("HIGH")
# July monthly
EASjuly$SC.Category <- c("REF")
FRYjuly$SC.Category <- c("MID")
RICjuly$SC.Category <- c("HIGH")
# August quarterly
CROaug$SC.Category <- c("REF")
EASaug$SC.Category <- c("REF")
HCNaug$SC.Category <- c("REF")
FRYaug$SC.Category <- c("MID")
HURaug$SC.Category <- c("MID")
RUTaug$SC.Category <- c("MID")
LLWaug$SC.Category <- c("HIGH")
LLCaug$SC.Category <- c("HIGH")
RICaug$SC.Category <- c("HIGH")



# Let's re-arrange the columns so these new additions are at the front-------
# September monthly
EASsept<- EASsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month", "Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYsept<- FRYsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICsept<- RICsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# October quarterly
CROoct <- CROoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASoct <- EASoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNoct <- HCNoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYoct <- FRYoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURoct <- HURoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUToct <- RUToct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICoct <- RICoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCoct <- LLCoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWoct <- LLWoct %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# November monthly
EASnov<- EASnov %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYnov<- FRYnov %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICnov<- RICnov %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# December monthly
EASdec<- EASdec %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYdec<- FRYdec %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICdec<- RICdec %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# January monthly
EASjan<- EASjan %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjan<- FRYjan %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjan<- RICjan %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# February quarterly
CROfeb<- CROfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASfeb<- EASfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNfeb<- HCNfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYfeb<- FRYfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURfeb<- HURfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTfeb<- RUTfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWfeb<- LLWfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCfeb<- LLCfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICfeb<- RICfeb %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# March monthly
EASmarch<- EASmarch %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYmarch<- FRYmarch %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICmarch<- RICmarch %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# April monthly
EASapril<- EASapril %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYapril<- FRYapril %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICapril<- RICapril %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# May quarterly
CROmay<- CROmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASmay<- EASmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNmay<- HCNmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYmay<- FRYmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURmay<- HURmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTmay<- RUTmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWmay<- LLWmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCmay<- LLCmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICmay<- RICmay %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# June monthly
EASjune<- EASjune %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjune<- FRYjune %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjune<- RICjune %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# July monthly
EASjuly<- EASjuly %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjuly<- FRYjuly %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjuly<- RICjuly %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
# August quarterly
CROaug<- CROaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASaug<- EASaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNaug<- HCNaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYaug<- FRYaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURaug<- HURaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTaug<- RUTaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWaug<- LLWaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCaug<- LLCaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICaug<- RICaug %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())


# Take out Totals columns (abundance, density, and biomass bc we will look at individual
# taxon size classes, not all size classes totalled together), order and family 
# since we just want genus ---------------
library(dplyr)
# September monthly
EASsept <- EASsept %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYsept <- FRYsept %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICsept <- RICsept %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# October quarterly
CROoct <- CROoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASoct <- EASoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNoct <- HCNoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYoct <- FRYoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURoct <- HURoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUToct <- RUToct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWoct <- LLWoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCoct <- LLCoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICoct <- RICoct %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# November monthly
EASnov <- EASnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYnov <- FRYnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICnov <- RICnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# December monthly
EASdec <- EASdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYdec <- FRYdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICdec <- RICdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# January monthly
EASjan <- EASjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjan <- FRYjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjan <- RICjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# February quarterly
CROfeb <- CROfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASfeb <- EASfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNfeb <- HCNfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYfeb <- FRYfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURfeb <- HURfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTfeb <- RUTfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWfeb <- LLWfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCfeb <- LLCfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICfeb <- RICfeb %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# March monthly
EASmarch <- EASmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYmarch <- FRYmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICmarch <- RICmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# April monthly
EASapril <- EASapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYapril <- FRYapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICapril <- RICapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# May quarterly
CROmay <- CROmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASmay <- EASmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNmay <- HCNmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYmay <- FRYmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURmay <- HURmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTmay <- RUTmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWmay <- LLWmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCmay <- LLCmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICmay <- RICmay %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# June monthly
EASjune <- EASjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjune <- FRYjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjune <- RICjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# July monthly
EASjuly <- EASjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjuly <- FRYjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjuly <- RICjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# August quarterly
CROaug <- CROaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASaug <- EASaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNaug <- HCNaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYaug <- FRYaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURaug <- HURaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTaug <- RUTaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWaug <- LLWaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCaug <- LLCaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICaug <- RICaug %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))




# Renaming Abundance columns as Abundance.Length1,2,3, etc. instead of X1.1, X2.2, etc.
# This is so I can see what length classes have what abundance----------

# September monthly
EASsept <- EASsept %>%
  rename_with(
    .cols = (match("Genus", names(EASsept)) + 1):(match("BIOMASS.STARTS.HERE", names(EASsept)) - 1), # Abundance columns begin after Genus is identified and goes until "BIOMASS STARTS HERE"
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYsept <- FRYsept %>%
  rename_with(
    .cols = (match("Genus", names(FRYsept)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYsept)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICsept <- RICsept %>%
  rename_with(
    .cols = (match("Genus", names(RICsept)) + 1):(match("BIOMASS.STARTS.HERE", names(RICsept)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# October quarterly
CROoct <- CROoct %>%
  rename_with(
    .cols = (match("Genus", names(CROoct)) + 1):(match("BIOMASS.STARTS.HERE", names(CROoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASoct <- EASoct %>%
  rename_with(
    .cols = (match("Genus", names(EASoct)) + 1):(match("BIOMASS.STARTS.HERE", names(EASoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNoct <- HCNoct %>%
  rename_with(
    .cols = (match("Genus", names(HCNoct)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYoct <- FRYoct %>%
  rename_with(
    .cols = (match("Genus", names(FRYoct)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURoct <- HURoct %>%
  rename_with(
    .cols = (match("Genus", names(HURoct)) + 1):(match("BIOMASS.STARTS.HERE", names(HURoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUToct <- RUToct %>%
  rename_with(
    .cols = (match("Genus", names(RUToct)) + 1):(match("BIOMASS.STARTS.HERE", names(RUToct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWoct <- LLWoct %>%
  rename_with(
    .cols = (match("Genus", names(LLWoct)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCoct <- LLCoct %>%
  rename_with(
    .cols = (match("Genus", names(LLCoct)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICoct <- RICoct %>%
  rename_with(
    .cols = (match("Genus", names(RICoct)) + 1):(match("BIOMASS.STARTS.HERE", names(RICoct)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )

# November monthly
EASnov <- EASnov %>%
  rename_with(
    .cols = (match("Genus", names(EASnov)) + 1):(match("BIOMASS.STARTS.HERE", names(EASnov)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYnov <- FRYnov %>%
  rename_with(
    .cols = (match("Genus", names(FRYnov)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYnov)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICnov <- RICnov %>%
  rename_with(
    .cols = (match("Genus", names(RICnov)) + 1):(match("BIOMASS.STARTS.HERE", names(RICnov)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# December monthly
EASdec <- EASdec %>%
  rename_with(
    .cols = (match("Genus", names(EASdec)) + 1):(match("BIOMASS.STARTS.HERE", names(EASdec)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYdec <- FRYdec %>%
  rename_with(
    .cols = (match("Genus", names(FRYdec)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYdec)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICdec <- RICdec %>%
  rename_with(
    .cols = (match("Genus", names(RICdec)) + 1):(match("BIOMASS.STARTS.HERE", names(RICdec)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# January monthly
EASjan <- EASjan %>%
  rename_with(
    .cols = (match("Genus", names(EASjan)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjan)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjan <- FRYjan %>%
  rename_with(
    .cols = (match("Genus", names(FRYjan)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjan)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjan <- RICjan %>%
  rename_with(
    .cols = (match("Genus", names(RICjan)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjan)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# February quarterly
CROfeb <- CROfeb %>%
  rename_with(
    .cols = (match("Genus", names(CROfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(CROfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASfeb <- EASfeb %>%
  rename_with(
    .cols = (match("Genus", names(EASfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(EASfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNfeb <- HCNfeb %>%
  rename_with(
    .cols = (match("Genus", names(HCNfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYfeb <- FRYfeb %>%
  rename_with(
    .cols = (match("Genus", names(FRYfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURfeb <- HURfeb %>%
  rename_with(
    .cols = (match("Genus", names(HURfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(HURfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTfeb <- RUTfeb %>%
  rename_with(
    .cols = (match("Genus", names(RUTfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWfeb <- LLWfeb %>%
  rename_with(
    .cols = (match("Genus", names(LLWfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCfeb <- LLCfeb %>%
  rename_with(
    .cols = (match("Genus", names(LLCfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICfeb <- RICfeb %>%
  rename_with(
    .cols = (match("Genus", names(RICfeb)) + 1):(match("BIOMASS.STARTS.HERE", names(RICfeb)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )

# March monthly
EASmarch <- EASmarch %>%
  rename_with(
    .cols = (match("Genus", names(EASmarch)) + 1):(match("BIOMASS.STARTS.HERE", names(EASmarch)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYmarch <- FRYmarch %>%
  rename_with(
    .cols = (match("Genus", names(FRYmarch)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYmarch)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICmarch <- RICmarch %>%
  rename_with(
    .cols = (match("Genus", names(RICmarch)) + 1):(match("BIOMASS.STARTS.HERE", names(RICmarch)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# April monthly
EASapril <- EASapril %>%
  rename_with(
    .cols = (match("Genus", names(EASapril)) + 1):(match("BIOMASS.STARTS.HERE", names(EASapril)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYapril <- FRYapril %>%
  rename_with(
    .cols = (match("Genus", names(FRYapril)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYapril)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICapril <- RICapril %>%
  rename_with(
    .cols = (match("Genus", names(RICapril)) + 1):(match("BIOMASS.STARTS.HERE", names(RICapril)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# May quarterly
CROmay <- CROmay %>%
  rename_with(
    .cols = (match("Genus", names(CROmay)) + 1):(match("BIOMASS.STARTS.HERE", names(CROmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASmay <- EASmay %>%
  rename_with(
    .cols = (match("Genus", names(EASmay)) + 1):(match("BIOMASS.STARTS.HERE", names(EASmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNmay <- HCNmay %>%
  rename_with(
    .cols = (match("Genus", names(HCNmay)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYmay <- FRYmay %>%
  rename_with(
    .cols = (match("Genus", names(FRYmay)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURmay <- HURmay %>%
  rename_with(
    .cols = (match("Genus", names(HURmay)) + 1):(match("BIOMASS.STARTS.HERE", names(HURmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTmay <- RUTmay %>%
  rename_with(
    .cols = (match("Genus", names(RUTmay)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWmay <- LLWmay %>%
  rename_with(
    .cols = (match("Genus", names(LLWmay)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCmay <- LLCmay %>%
  rename_with(
    .cols = (match("Genus", names(LLCmay)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICmay <- RICmay %>%
  rename_with(
    .cols = (match("Genus", names(RICmay)) + 1):(match("BIOMASS.STARTS.HERE", names(RICmay)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )

# June monthly
EASjune <- EASjune %>%
  rename_with(
    .cols = (match("Genus", names(EASjune)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjune)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjune <- FRYjune %>%
  rename_with(
    .cols = (match("Genus", names(FRYjune)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjune)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjune <- RICjune %>%
  rename_with(
    .cols = (match("Genus", names(RICjune)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjune)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# July monthly
EASjuly <- EASjuly %>%
  rename_with(
    .cols = (match("Genus", names(EASjuly)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjuly)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjuly <- FRYjuly %>%
  rename_with(
    .cols = (match("Genus", names(FRYjuly)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjuly)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjuly <- RICjuly %>%
  rename_with(
    .cols = (match("Genus", names(RICjuly)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjuly)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
# August quarterly
CROaug <- CROaug %>%
  rename_with(
    .cols = (match("Genus", names(CROaug)) + 1):(match("BIOMASS.STARTS.HERE", names(CROaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASaug <- EASaug %>%
  rename_with(
    .cols = (match("Genus", names(EASaug)) + 1):(match("BIOMASS.STARTS.HERE", names(EASaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNaug <- HCNaug %>%
  rename_with(
    .cols = (match("Genus", names(HCNaug)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYaug <- FRYaug %>%
  rename_with(
    .cols = (match("Genus", names(FRYaug)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURaug <- HURaug %>%
  rename_with(
    .cols = (match("Genus", names(HURaug)) + 1):(match("BIOMASS.STARTS.HERE", names(HURaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTaug <- RUTaug %>%
  rename_with(
    .cols = (match("Genus", names(RUTaug)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWaug <- LLWaug %>%
  rename_with(
    .cols = (match("Genus", names(LLWaug)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCaug <- LLCaug %>%
  rename_with(
    .cols = (match("Genus", names(LLCaug)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICaug <- RICaug %>%
  rename_with(
    .cols = (match("Genus", names(RICaug)) + 1):(match("BIOMASS.STARTS.HERE", names(RICaug)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )



# Renaming Biomass length columns as Biomass.Length1,2,3, etc. instead of X1.1, X2.2, etc.
# This is so I can the biomass for each length class --------

# September monthly
EASsept <- EASsept %>%
  rename_with(
    .cols = (which(names(EASsept) == "BIOMASS.STARTS.HERE") + 1):ncol(EASsept), # Biomass columbs begin after "BIOMASS STARTS HERE" column
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYsept <- FRYsept %>%
  rename_with(
    .cols = (which(names(FRYsept) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYsept),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICsept <- RICsept %>%
  rename_with(
    .cols = (which(names(RICsept) == "BIOMASS.STARTS.HERE") + 1):ncol(RICsept),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# October quarterly
CROoct <- CROoct %>%
  rename_with(
    .cols = (which(names(CROoct) == "BIOMASS.STARTS.HERE") + 1):ncol(CROoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASoct <- EASoct %>%
  rename_with(
    .cols = (which(names(EASoct) == "BIOMASS.STARTS.HERE") + 1):ncol(EASoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNoct <- HCNoct %>%
  rename_with(
    .cols = (which(names(HCNoct) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYoct <- FRYoct %>%
  rename_with(
    .cols = (which(names(FRYoct) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURoct <- HURoct %>%
  rename_with(
    .cols = (which(names(HURoct) == "BIOMASS.STARTS.HERE") + 1):ncol(HURoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUToct <- RUToct %>%
  rename_with(
    .cols = (which(names(RUToct) == "BIOMASS.STARTS.HERE") + 1):ncol(RUToct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWoct <- LLWoct %>%
  rename_with(
    .cols = (which(names(LLWoct) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCoct <- LLCoct %>%
  rename_with(
    .cols = (which(names(LLCoct) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICoct <- RICoct %>%
  rename_with(
    .cols = (which(names(RICoct) == "BIOMASS.STARTS.HERE") + 1):ncol(RICoct),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# November monthly
EASnov <- EASnov %>%
  rename_with(
    .cols = (which(names(EASnov) == "BIOMASS.STARTS.HERE") + 1):ncol(EASnov),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYnov <- FRYnov %>%
  rename_with(
    .cols = (which(names(FRYnov) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYnov),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICnov <- RICnov %>%
  rename_with(
    .cols = (which(names(RICnov) == "BIOMASS.STARTS.HERE") + 1):ncol(RICnov),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# December monthly
EASdec <- EASdec %>%
  rename_with(
    .cols = (which(names(EASdec) == "BIOMASS.STARTS.HERE") + 1):ncol(EASdec),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYdec <- FRYdec %>%
  rename_with(
    .cols = (which(names(FRYdec) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYdec),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICdec <- RICdec %>%
  rename_with(
    .cols = (which(names(RICdec) == "BIOMASS.STARTS.HERE") + 1):ncol(RICdec),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# January monthly
EASjan <- EASjan %>%
  rename_with(
    .cols = (which(names(EASjan) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjan),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjan <- FRYjan %>%
  rename_with(
    .cols = (which(names(FRYjan) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjan),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjan <- RICjan %>%
  rename_with(
    .cols = (which(names(RICjan) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjan),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# February quarterly
CROfeb <- CROfeb %>%
  rename_with(
    .cols = (which(names(CROfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(CROfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASfeb <- EASfeb %>%
  rename_with(
    .cols = (which(names(EASfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(EASfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNfeb <- HCNfeb %>%
  rename_with(
    .cols = (which(names(HCNfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYfeb <- FRYfeb %>%
  rename_with(
    .cols = (which(names(FRYfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURfeb <- HURfeb %>%
  rename_with(
    .cols = (which(names(HURfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(HURfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTfeb <- RUTfeb %>%
  rename_with(
    .cols = (which(names(RUTfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWfeb <- LLWfeb %>%
  rename_with(
    .cols = (which(names(LLWfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCfeb <- LLCfeb %>%
  rename_with(
    .cols = (which(names(LLCfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICfeb <- RICfeb %>%
  rename_with(
    .cols = (which(names(RICfeb) == "BIOMASS.STARTS.HERE") + 1):ncol(RICfeb),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# March monthly
EASmarch <- EASmarch %>%
  rename_with(
    .cols = (which(names(EASmarch) == "BIOMASS.STARTS.HERE") + 1):ncol(EASmarch),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYmarch <- FRYmarch %>%
  rename_with(
    .cols = (which(names(FRYmarch) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYmarch),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICmarch <- RICmarch %>%
  rename_with(
    .cols = (which(names(RICmarch) == "BIOMASS.STARTS.HERE") + 1):ncol(RICmarch),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# April monthly
EASapril <- EASapril %>%
  rename_with(
    .cols = (which(names(EASapril) == "BIOMASS.STARTS.HERE") + 1):ncol(EASapril),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYapril <- FRYapril %>%
  rename_with(
    .cols = (which(names(FRYapril) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYapril),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICapril <- RICapril %>%
  rename_with(
    .cols = (which(names(RICapril) == "BIOMASS.STARTS.HERE") + 1):ncol(RICapril),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# May quarterly
CROmay <- CROmay %>%
  rename_with(
    .cols = (which(names(CROmay) == "BIOMASS.STARTS.HERE") + 1):ncol(CROmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASmay <- EASmay %>%
  rename_with(
    .cols = (which(names(EASmay) == "BIOMASS.STARTS.HERE") + 1):ncol(EASmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNmay <- HCNmay %>%
  rename_with(
    .cols = (which(names(HCNmay) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYmay <- FRYmay %>%
  rename_with(
    .cols = (which(names(FRYmay) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURmay <- HURmay %>%
  rename_with(
    .cols = (which(names(HURmay) == "BIOMASS.STARTS.HERE") + 1):ncol(HURmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTmay <- RUTmay %>%
  rename_with(
    .cols = (which(names(RUTmay) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWmay <- LLWmay %>%
  rename_with(
    .cols = (which(names(LLWmay) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCmay <- LLCmay %>%
  rename_with(
    .cols = (which(names(LLCmay) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICmay <- RICmay %>%
  rename_with(
    .cols = (which(names(RICmay) == "BIOMASS.STARTS.HERE") + 1):ncol(RICmay),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# June monthly
EASjune <- EASjune %>%
  rename_with(
    .cols = (which(names(EASjune) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjune),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjune <- FRYjune %>%
  rename_with(
    .cols = (which(names(FRYjune) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjune),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjune <- RICjune %>%
  rename_with(
    .cols = (which(names(RICjune) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjune),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# July monthly
EASjuly <- EASjuly %>%
  rename_with(
    .cols = (which(names(EASjuly) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjuly),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjuly <- FRYjuly %>%
  rename_with(
    .cols = (which(names(FRYjuly) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjuly),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjuly <- RICjuly %>%
  rename_with(
    .cols = (which(names(RICjuly) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjuly),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
# August quarterly
CROaug <- CROaug %>%
  rename_with(
    .cols = (which(names(CROaug) == "BIOMASS.STARTS.HERE") + 1):ncol(CROaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASaug <- EASaug %>%
  rename_with(
    .cols = (which(names(EASaug) == "BIOMASS.STARTS.HERE") + 1):ncol(EASaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNaug <- HCNaug %>%
  rename_with(
    .cols = (which(names(HCNaug) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYaug <- FRYaug %>%
  rename_with(
    .cols = (which(names(FRYaug) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURaug <- HURaug %>%
  rename_with(
    .cols = (which(names(HURaug) == "BIOMASS.STARTS.HERE") + 1):ncol(HURaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTaug <- RUTaug %>%
  rename_with(
    .cols = (which(names(RUTaug) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWaug <- LLWaug %>%
  rename_with(
    .cols = (which(names(LLWaug) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCaug <- LLCaug %>%
  rename_with(
    .cols = (which(names(LLCaug) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICaug <- RICaug %>%
  rename_with(
    .cols = (which(names(RICaug) == "BIOMASS.STARTS.HERE") + 1):ncol(RICaug),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )





# Now, remove the "BIOMASS STARTS HERE" columns for the next move--------------

# September monthly
EASsept <- EASsept %>% select(-c("BIOMASS.STARTS.HERE"))
FRYsept <- FRYsept %>% select(-c("BIOMASS.STARTS.HERE"))
RICsept <- RICsept %>% select(-c("BIOMASS.STARTS.HERE"))
# October quarterly
CROoct <- CROoct %>% select(-c("BIOMASS.STARTS.HERE"))
EASoct <- EASoct %>% select(-c("BIOMASS.STARTS.HERE"))
HCNoct <- HCNoct %>% select(-c("BIOMASS.STARTS.HERE"))
FRYoct <- FRYoct %>% select(-c("BIOMASS.STARTS.HERE"))
HURoct <- HURoct %>% select(-c("BIOMASS.STARTS.HERE"))
RUToct <- RUToct %>% select(-c("BIOMASS.STARTS.HERE"))
LLWoct <- LLWoct %>% select(-c("BIOMASS.STARTS.HERE"))
LLCoct <- LLCoct %>% select(-c("BIOMASS.STARTS.HERE"))
RICoct <- RICoct %>% select(-c("BIOMASS.STARTS.HERE"))
# November monthly
EASnov <- EASnov %>% select(-c("BIOMASS.STARTS.HERE"))
FRYnov <- FRYnov %>% select(-c("BIOMASS.STARTS.HERE"))
RICnov <- RICnov %>% select(-c("BIOMASS.STARTS.HERE"))
# December monthly
EASdec <- EASdec %>% select(-c("BIOMASS.STARTS.HERE"))
FRYdec <- FRYdec %>% select(-c("BIOMASS.STARTS.HERE"))
RICdec <- RICdec %>% select(-c("BIOMASS.STARTS.HERE"))
# January monthly
EASjan <- EASjan %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjan <- FRYjan %>% select(-c("BIOMASS.STARTS.HERE"))
RICjan <- RICjan %>% select(-c("BIOMASS.STARTS.HERE"))
# February quarterly
CROfeb <- CROfeb %>% select(-c("BIOMASS.STARTS.HERE"))
EASfeb <- EASfeb %>% select(-c("BIOMASS.STARTS.HERE"))
HCNfeb <- HCNfeb %>% select(-c("BIOMASS.STARTS.HERE"))
FRYfeb <- FRYfeb %>% select(-c("BIOMASS.STARTS.HERE"))
HURfeb <- HURfeb %>% select(-c("BIOMASS.STARTS.HERE"))
RUTfeb <- RUTfeb %>% select(-c("BIOMASS.STARTS.HERE"))
LLWfeb <- LLWfeb %>% select(-c("BIOMASS.STARTS.HERE"))
LLCfeb <- LLCfeb %>% select(-c("BIOMASS.STARTS.HERE"))
RICfeb <- RICfeb %>% select(-c("BIOMASS.STARTS.HERE"))
# March monthly
EASmarch <- EASmarch %>% select(-c("BIOMASS.STARTS.HERE"))
FRYmarch <- FRYmarch %>% select(-c("BIOMASS.STARTS.HERE"))
RICmarch <- RICmarch %>% select(-c("BIOMASS.STARTS.HERE"))
# April monthly
EASapril <- EASapril %>% select(-c("BIOMASS.STARTS.HERE"))
FRYapril <- FRYapril %>% select(-c("BIOMASS.STARTS.HERE"))
RICapril <- RICapril %>% select(-c("BIOMASS.STARTS.HERE"))
# May quarterly
CROmay <- CROmay %>% select(-c("BIOMASS.STARTS.HERE"))
EASmay <- EASmay %>% select(-c("BIOMASS.STARTS.HERE"))
HCNmay <- HCNmay %>% select(-c("BIOMASS.STARTS.HERE"))
FRYmay <- FRYmay %>% select(-c("BIOMASS.STARTS.HERE"))
HURmay <- HURmay %>% select(-c("BIOMASS.STARTS.HERE"))
RUTmay <- RUTmay %>% select(-c("BIOMASS.STARTS.HERE"))
LLWmay <- LLWmay %>% select(-c("BIOMASS.STARTS.HERE"))
LLCmay <- LLCmay %>% select(-c("BIOMASS.STARTS.HERE"))
RICmay <- RICmay %>% select(-c("BIOMASS.STARTS.HERE"))
# June monthly
EASjune <- EASjune %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjune <- FRYjune %>% select(-c("BIOMASS.STARTS.HERE"))
RICjune <- RICjune %>% select(-c("BIOMASS.STARTS.HERE"))
# July monthly
EASjuly <- EASjuly %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjuly <- FRYjuly %>% select(-c("BIOMASS.STARTS.HERE"))
RICjuly <- RICjuly %>% select(-c("BIOMASS.STARTS.HERE"))
# August quarterly
CROaug <- CROaug %>% select(-c("BIOMASS.STARTS.HERE"))
EASaug <- EASaug %>% select(-c("BIOMASS.STARTS.HERE"))
HCNaug <- HCNaug %>% select(-c("BIOMASS.STARTS.HERE"))
FRYaug <- FRYaug %>% select(-c("BIOMASS.STARTS.HERE"))
HURaug <- HURaug %>% select(-c("BIOMASS.STARTS.HERE"))
RUTaug <- RUTaug %>% select(-c("BIOMASS.STARTS.HERE"))
LLWaug <- LLWaug %>% select(-c("BIOMASS.STARTS.HERE"))
LLCaug <- LLCaug %>% select(-c("BIOMASS.STARTS.HERE"))
RICaug <- RICaug %>% select(-c("BIOMASS.STARTS.HERE"))


# Transform the data frame so that I can see the abundance and biomass for each length class for each taxa------
library(tidyr)

# September monthly
EASsept_long <- EASsept %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  # Select abundance and biomass columns and convert from wide to long
    names_to = c(".value", "Length"),       # `.value` for abundance/biomass values, 'Length' for the lengths
    names_pattern = "(.*)\\.Length_(\\d+)"  # Separate 'abundance'/'biomass' and the numeric length suffix
  ) %>%
  mutate(Length = as.numeric(Length))       # Convert Length column to numeric

FRYsept_long <- FRYsept %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICsept_long <- RICsept %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

# October quarterly
CROoct_long <- CROoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASoct_long <- EASoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNoct_long <- HCNoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYoct_long <- FRYoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURoct_long <- HURoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUToct_long <- RUToct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWoct_long <- LLWoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCoct_long <- LLCoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICoct_long <- RICoct %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

# November monthly
EASnov_long <- EASnov %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYnov_long <- FRYnov %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICnov_long <- RICnov %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

# December monthly
EASdec_long <- EASdec %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYdec_long <- FRYdec %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICdec_long <- RICdec %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

# January monthly
EASjan_long <- EASjan %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYjan_long <- FRYjan %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjan_long <- RICjan %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

# February quarterly
CROfeb_long <- CROfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASfeb_long <- EASfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNfeb_long <- HCNfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYfeb_long <- FRYfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURfeb_long <- HURfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTfeb_long <- RUTfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWfeb_long <- LLWfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCfeb_long <- LLCfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICfeb_long <- RICfeb %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

# March monthly
EASmarch_long <- EASmarch %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYmarch_long <- FRYmarch %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICmarch_long <- RICmarch %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    
# April monthly
EASapril_long <- EASapril %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYapril_long <- FRYapril %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICapril_long <- RICapril %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))   

# May quarterly
CROmay_long <- CROmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASmay_long <- EASmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNmay_long <- HCNmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYmay_long <- FRYmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURmay_long <- HURmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTmay_long <- RUTmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWmay_long <- LLWmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCmay_long <- LLCmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICmay_long <- RICmay %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

# June monthly
EASjune_long <- EASjune %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYjune_long <- FRYjune %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjune_long <- RICjune %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

# July monthly
EASjuly_long <- EASjuly %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYjuly_long <- FRYjuly %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjuly_long <- RICjuly %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

# August quarterly
CROaug_long <- CROaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASaug_long <- EASaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNaug_long <- HCNaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYaug_long <- FRYaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURaug_long <- HURaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTaug_long <- RUTaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWaug_long <- LLWaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCaug_long <- LLCaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICaug_long <- RICaug %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 


# Merge data frames based on trimmed/transformed columns from above (lengths, abundance, etc.)
list_of_greater_secprod <- list(EASsept_long, FRYsept_long, RICsept_long,
                               CROoct_long, EASoct_long,HCNoct_long, FRYoct_long,
                               HURoct_long, RUToct_long, LLWoct_long, LLCoct_long,
                               RICoct_long, EASnov_long, FRYnov_long, RICnov_long,
                               EASdec_long, FRYdec_long,RICdec_long,EASjan_long, 
                               FRYjan_long,RICjan_long, CROfeb_long, EASfeb_long,
                               HCNfeb_long, FRYfeb_long, HURfeb_long, RUTfeb_long, 
                               LLWfeb_long, LLCfeb_long, RICfeb_long, EASmarch_long, 
                               FRYmarch_long, RICmarch_long, EASapril_long, FRYapril_long,
                               RICapril_long, CROmay_long, EASmay_long, HCNmay_long, 
                               FRYmay_long, HURmay_long, RUTmay_long, LLWmay_long, LLCmay_long,
                               RICmay_long, EASjune_long, FRYjune_long, RICjune_long, 
                               EASjuly_long, FRYjuly_long, RICjuly_long, CROaug_long, 
                               EASaug_long, HCNaug_long, FRYaug_long, HURaug_long, RUTaug_long, 
                               LLWaug_long, LLCaug_long, RICaug_long) 

 SECPROD<- do.call(rbind, list_of_greater_secprod) #THIS WORKS
 
 
 # Cleaning up data sheet (typos, equations...)--------
 
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Stylogomphurus", "Stylogomphus", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Hydratophylax", "Hydatophylax", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Oulimnius(L)", "Oulimnius", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Optioservus(L)", "Optioservus", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Stenelmis (L)", "Stenelmis", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Paraleptophlebiidae", "Paraleptophlebia", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Fraction = ifelse(Fraction == ">1", "> 1", Fraction))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Allocapnia", "Paracapnia", Genus)) 
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Allocapnia" & Sample.Month == "October" & Fraction == "> 1" & Site == "EAS", 
                         "Paracapnia", # Allocapnia were actually paracapnia
                         Genus))
 
 # Realized i had decimal in wrong place and needed to move one spot to the left
 SECPROD <- SECPROD %>%
   mutate(Biomass = ifelse(Genus == "Acroneuria", Biomass / 10, Biomass)) 
 SECPROD <- SECPROD %>%
   mutate(Biomass = ifelse(Genus == "Alloperla", Biomass / 10, Biomass)) 
 SECPROD <- SECPROD %>%
   mutate(Biomass = ifelse(Genus == "Atherix", Biomass / 10, Biomass)) 
 SECPROD <- SECPROD %>%
   mutate(Biomass = ifelse(Genus == "Paraleptophlebia", Biomass / 10, Biomass))
 SECPROD <- SECPROD %>%
   mutate(Biomass = ifelse(Genus == "Probezzia", Biomass / 10, Biomass))

 # Taking out zeroes in biomass too
 library(dplyr)
 
SECPROD <- SECPROD %>% filter(Biomass != 0)

# Saving as a CSV for geom_ridge code
write.csv(SECPROD, "SEC_PROD.csv", row.names = FALSE)


# 2P FOR SPECIFIC TAXA----------------------------------------------------------
# Taxa filtering and arranging lengths from lowest to highest

library(dplyr)

# Filter for Leuctra taxa in EAS across the year and arrange by Length in ascending order, and add a column for density---

SECPROD_leuctra.EAS <- SECPROD %>%
  filter(Genus == "Leuctra", Site == "EAS") %>%        # Filter for Leuctra genus
  arrange(factor(Sample.Month, levels = c("September", "October", "November", "December",
                                          "January", "February", "March", "April", "May", "June", "July", "August")), Sample.Month) %>%                   # Arrange by Length in ascending order
  mutate(Density = Abundance / 0.0929) # Add new column for Density

# View the result
SECPROD_leuctra.EAS

# Exporting to excel 
install.packages("writexl")
library(writexl)
write_xlsx(SECPROD_leuctra.EAS, path = "SECPROD_leuctra.EAS.xlsx")



# First, sum the density and biomass for each replicate for each size class
# aka 1 density and biomass value for each length/stream/month
# don't divide by abundance bc we already accounted for abundance when calculating density (note to self bc i got confused earlier)
# Add a individual mass column that takes the average biomass / avg. density and then deletes the 
# biomass column because we don't need it anymore

leuctra.EAS <- SECPROD_leuctra.EAS %>% 
  group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>% 
  summarise(
    Sum.Density = sum(Density, na.rm = TRUE),  # Summing density for each replicate for each length class
    Sum.Biomass = sum(Biomass, na.rm = TRUE)   # Summing biomass for each replicate for each length class
  ) %>%
  mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%  # Calculating individual mass
  select(-Sum.Biomass) %>%  # Removing Sum.Biomass column after calculating individual mass
                       # Note to self: this is the same df as SECPROD_leuctra.EAS bc except that
                       # it makes the individual mass column. The SECPROD df is already arranged with
                       # each length class in each rep. I keep this code though for transparency of 
                       # how the data should be handled and avoiding confusing people (me) by leaving it out
  
  # Now, average replicates for each length class for each stream/month
  # Note to self: you took sum of each replicate's density and mass first and now are averaging them...you get confused by this sometimes
  group_by(Site, Genus,Sample.Month, Sample.Date, Length) %>%
  summarise(
    Mean.Density = mean(Sum.Density, na.rm = TRUE),  # Averaging the summed density by Sample.Month
    Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE) ) %>%  # Averaging the individual mass by Sample.Month
                  
  # Lastly, summing the density and individual mass for all length classes across the year, since the replicates for each site
  # have been averaged in previous step. This step gives up the total across the year
  # So, don't want to be categorized by site descriptor(s), just length class
  # Note to self: we summed the reps for each stream for each length class. Then, averaged the reps to
  # get one density and individual mass value for each length class for each stream. Now, we are
  # summing across the whole year for each size class. Stop gaslighting yourself this makes sense
  group_by(Genus, Length, Site) %>% 
  summarise(
    Density.Final = sum(Mean.Density, na.rm = TRUE),
    Individual.Mass.Final = sum(Mean.Individual.Mass, na.rm = TRUE),
  ) %>% 
  arrange(Length)



# Plot a bell curve (density plot) for Length vs Biomass after averaging things...just for fun
ggplot(leuctra.EAS, aes(x = Length, y = Individual.Mass.Final)) +
  geom_point(alpha = 0.5) +  # Points to show individual values
  geom_smooth(method = "loess", color = "blue", se = FALSE) +  # Smoothed line to approximate a bell curve
  labs(x = "Length", y = "Individual Mass", title = "Biomass Distribution by Length for Leuctra Taxa") +
  theme_minimal() # Doesn't look too bad 


# Exporting to excel 
install.packages("writexl")
library(writexl)
write_xlsx(leuctra.EAS, path = "leuctra.EAS.xlsx")


# Filter for Stenonema taxa in EAS across the year and arrange by Length in ascending order, and add a column for density---

SECPROD_stenonema.EAS <- SECPROD %>%
  filter(Genus == "Stenonema", Site == "EAS") %>%        # Filter for Leuctra genus
  arrange(Length) %>%                   # Arrange by Length in ascending order
  mutate(Density = Abundance / 0.0929) # Add new column for Density

# View the result
SECPROD_stenonema.EAS


# First, sum the density and biomass for each replicate for each size class
# aka 1 density and biomass value for each length/stream/month
# don't divide by abundance bc we already accounted for abundance when calculating density (note to self bc i got confused earlier)
# Add a individual mass column that takes the average biomass / avg. density and then deletes the 
# biomass column because we don't need it anymore

stenonema.EAS <- SECPROD_stenonema.EAS %>% 
  group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>% 
  summarise(
    Sum.Density = sum(Density, na.rm = TRUE),  # Summing density for each replicate for each length class
    Sum.Biomass = sum(Biomass, na.rm = TRUE)   # Summing biomass for each replicate for each length class
  ) %>%
  mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%  # Calculating individual mass
  select(-Sum.Biomass) %>% # Removing Sum.Biomass column after calculating individual mass
  
  # Now, average replicates for each length class for each stream/month
  # Note to self: you took sum of each replicate's density and mass first and now are averaging them...you get confused by this sometimes
  group_by(Site, Genus,Sample.Month, Sample.Date, Length) %>%
  summarise(
    Mean.Density = mean(Sum.Density, na.rm = TRUE),  # Averaging the summed density by Sample.Month
    Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE) ) %>%# Averaging the individual mass by Sample.Month
  
  # Lastly, summing the density and individual mass for all length classes across the year, since the replicates for each site
  # have been averaged in previous step. This step gives up the total across the year
  # So, don't want to be categorized by site descriptor(s), just length class
  # Note to self: we summed the reps for each stream for each length class. Then, averaged the reps to
  # get one density and individual mass value for each length class for each stream. Now, we are
  # summing across the whole year for each size class. Stop gaslighting yourself this makes sense
  group_by(Genus, Length, Site) %>% 
  summarise(
    Density.Final = sum(Mean.Density, na.rm = TRUE),
    Individual.Mass.Final = sum(Mean.Individual.Mass, na.rm = TRUE),
  ) %>% 
  arrange(Length)




# Plot a bell curve (density plot) for Length vs Biomass after averaging things...just for fun
ggplot(stenonema.EAS, aes(x = Length, y = Individual.Mass.Final)) +
  geom_point(alpha = 0.5) +  # Points to show individual values
  geom_smooth(method = "loess", color = "blue", se = FALSE) +  # Smoothed line to approximate a bell curve
  labs(x = "Length", y = "Individual Mass", title = "Biomass Distribution by Length for Stenonema Taxa") +
  theme_minimal() # Doesn't look too bad 


# Exporting to excel 
install.packages("writexl")
library(writexl)
write_xlsx(stenonema.EAS, path = "stenonema.EAS.xlsx")



# Instantaneous Growth Method----------------

# This is a little bit easier to understand than size-frequency bc I don't have to average the length classes
# for each stream and then sum them across the year, I just sum each rep and then avg them for each month 

# First, sum the density and biomass for each replicate (all size classes lumped in this method)
# aka 1 density and biomass value for each length/stream/month
# don't divide by abundance bc we already accounted for abundance when calculating density (note to self bc i got confused earlier)
# Add a individual mass column that takes the average biomass / avg. density and then deletes the 
# biomass column because we don't need it anymore

IGM_leuctra.EAS<- SECPROD_leuctra.EAS %>% 
  group_by(Site, Genus, Sample.Month, Sample.Date, Replicate) %>% 
  summarise(
    Sum.Density = sum(Density, na.rm = TRUE),  # Summing density for each replicate
    Sum.Biomass = sum(Biomass, na.rm = TRUE)   # Summing biomass for each replicate
  ) %>%
mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%  # Calculating individual mass
  select(-Sum.Biomass) %>%   # Removing Sum.Biomass column after calculating individual mass
  
  # Now, average by Sample.Month across all replicates
  group_by(Site, Genus, Sample.Month, Sample.Date) %>%
  summarise(
    Mean.Density = mean(Sum.Density, na.rm = TRUE),  # Averaging the summed density by Sample.Month
    Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE)  # Averaging the individual mass by Sample.Month
  ) %>%
  arrange(factor(Sample.Month, levels = c("September", "October", "November", "December",
    "January", "February", "March", "April", "May", "June", "July", "August")), Sample.Month)  # Sorting by Sample.Month



# Exporting to excel 
install.packages("writexl")
library(writexl)
write_xlsx(IGM_leuctra.EAS, path = "IGM_leuctra.EAS.xlsx")









# Automating 2P for every taxa in EAS---------

SECPROD_EAS <- function(SECPROD, site_filter = "EAS") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "September", "October", "November", "December",
      "January", "February", "March", "April",
      "May", "June", "July", "August"
    )), Sample.Month) %>%
    
    # Calculate Density
    mutate(Density = Abundance / 0.0929) %>%
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass, na.rm = TRUE)      # Sum Biomass
    ) %>%
    
    # Calculate Individual Mass
    mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Length) %>%
    summarise(
      Mean.Density = mean(Sum.Density, na.rm = TRUE),  # Average Density
      Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE)  # Average Individual Mass
    ) %>%
    
    # Group by Genus, Length, Site to calculate final densities and biomass per genus
    group_by(Genus, Length, Site) %>%
    summarise(
      Density.Final = sum(Mean.Density, na.rm = TRUE),  # Final Density across the year
      Individual.Mass.Final = sum(Mean.Individual.Mass, na.rm = TRUE)  # Final Mass across the year
    ) %>%
    
    # Arrange by Length for correct ordering of size classes
    arrange(Length)
}

# Create a list of dataframes, one for each genus, for the "EAS" site
EAS_genus_2P <- SECPROD %>%
  filter(Site == "EAS") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_EAS(SECPROD %>% filter(Genus == .x))) # Apply the function per genus

# Check if Density.Final exists for each genus
str(EAS_genus_2P[[1]])  # Inspect the first genus dataframe


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    mutate(
      No.Lost = Density.Final - lead(Density.Final),  # Subtract next row's density
      No.Lost = ifelse(is.na(No.Lost), 0, No.Lost)    # Replace NA with 0 (only for the last row)
    ) %>%
    ungroup()  # Ungroup after calculation
}

# Apply Production_Columns to each genus dataframe in the list

EAS_genus_2P_Final <- map(EAS_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
install.packages("openxlsx")
library(openxlsx)

wb <- createWorkbook()

# Add each genus dataframe to a separate sheet
iwalk(EAS_genus_2P_Final, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Step 4: Save the workbook to an Excel file
saveWorkbook(wb, "EAS_Genus_Summary.xlsx", overwrite = TRUE)






# Check results for one genus
EAS_genus_2P_Final[[1]] %>% 
  select(Genus, Length, Density.Final, No.Lost) %>%
  print()


# Apply Production_Columns and print a preview
Production_Columns(EAS_genus_2P[[1]]) %>%
  select(Length, Density.Final, No.Lost) %>%
  print()

