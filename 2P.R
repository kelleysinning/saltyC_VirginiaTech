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

# Ok, bring in the csv summary sheets for each site and month-------------------
# September monthly
EASsept=read.csv("EAS_Sept.2023_SUMMARY.csv")
FRYsept=read.csv("FRY_Sept.2023_SUMMARY.csv")
RICsept=read.csv("RIC_Sept.2023_SUMMARY.csv")
EASsept_less=read.csv("EAS_Sept.2023_SUMMARYless.csv")
FRYsept_less=read.csv("FRY_Sept.2023_SUMMARYless.csv")
RICsept_less=read.csv("RIC_Sept.2023_SUMMARYless.csv")
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
CROoct_less=read.csv("CRO_Oct.2023_SUMMARYless.csv")
EASoct_less=read.csv("EAS_Oct.2023_SUMMARYless.csv")
HCNoct_less=read.csv("HCN_Oct.2023_SUMMARYless.csv")
FRYoct_less=read.csv("FRY_Oct.2023_SUMMARYless.csv")
HURoct_less=read.csv("HUR_Oct.2023_SUMMARYless.csv")
RUToct_less=read.csv("RUT_Oct.2023_SUMMARYless.csv")
LLWoct_less=read.csv("LLW_Oct.2023_SUMMARYless.csv")
LLCoct_less=read.csv("LLC_Oct.2023_SUMMARYless.csv")
RICoct_less=read.csv("RIC_Oct.2023_SUMMARYless.csv")
# November monthly
EASnov=read.csv("EAS_Nov.2023_SUMMARY.csv")
FRYnov=read.csv("FRY_Nov.2023_SUMMARY.csv")
RICnov=read.csv("RIC_Nov.2023_SUMMARY.csv")
EASnov_less=read.csv("EAS_Nov.2023_SUMMARYless.csv")
FRYnov_less=read.csv("FRY_Nov.2023_SUMMARYless.csv")
RICnov_less=read.csv("RIC_Nov.2023_SUMMARYless.csv")
# December monthly
EASdec=read.csv("EAS_Dec.2023_SUMMARY.csv")
FRYdec=read.csv("FRY_Dec.2023_SUMMARY.csv")
RICdec=read.csv("RIC_Dec.2023_SUMMARY.csv")
EASdec_less=read.csv("EAS_Dec.2023_SUMMARYless.csv")
FRYdec_less=read.csv("FRY_Dec.2023_SUMMARYless.csv")
RICdec_less=read.csv("RIC_Dec.2023_SUMMARYless.csv")
# January monthly
EASjan=read.csv("EAS_Jan.2024_SUMMARY.csv")
FRYjan=read.csv("FRY_Jan.2024_SUMMARY.csv")
RICjan=read.csv("RIC_Jan.2024_SUMMARY.csv")
EASjan_less=read.csv("EAS_Jan.2024_SUMMARYless.csv")
FRYjan_less=read.csv("FRY_Jan.2024_SUMMARYless.csv")
RICjan_less=read.csv("RIC_Jan.2024_SUMMARYless.csv")
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
CROfeb_less=read.csv("CRO_Feb.2024_SUMMARYless.csv")
EASfeb_less=read.csv("EAS_Feb.2024_SUMMARYless.csv")
HCNfeb_less=read.csv("HCN_Feb.2024_SUMMARYless.csv")
FRYfeb_less=read.csv("FRY_Feb.2024_SUMMARYless.csv")
HURfeb_less=read.csv("HUR_Feb.2024_SUMMARYless.csv")
RUTfeb_less=read.csv("RUT_Feb.2024_SUMMARYless.csv")
LLWfeb_less=read.csv("LLW_Feb.2024_SUMMARYless.csv")
LLCfeb_less=read.csv("LLC_Feb.2024_SUMMARYless.csv")
RICfeb_less=read.csv("RIC_Feb.2024_SUMMARYless.csv")
# March monthly
EASmarch=read.csv("EAS_March.2024_SUMMARY.csv")
FRYmarch=read.csv("FRY_March.2024_SUMMARY.csv")
RICmarch=read.csv("RIC_March.2024_SUMMARY.csv")
EASmarch_less=read.csv("EAS_March.2024_SUMMARYless.csv")
FRYmarch_less=read.csv("FRY_March.2024_SUMMARYless.csv")
RICmarch_less=read.csv("RIC_March.2024_SUMMARYless.csv")
# April monthly
EASapril=read.csv("EAS_April.2024_SUMMARY.csv")
FRYapril=read.csv("FRY_April.2024_SUMMARY.csv")
RICapril=read.csv("RIC_April.2024_SUMMARY.csv")
EASapril_less=read.csv("EAS_April.2024_SUMMARYless.csv")
FRYapril_less=read.csv("FRY_April.2024_SUMMARYless.csv")
RICapril_less=read.csv("RIC_April.2024_SUMMARYless.csv")
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
CROmay_less=read.csv("CRO_May.2024_SUMMARYless.csv")
EASmay_less=read.csv("EAS_May.2024_SUMMARYless.csv")
HCNmay_less=read.csv("HCN_May.2024_SUMMARYless.csv")
FRYmay_less=read.csv("FRY_May.2024_SUMMARYless.csv")
HURmay_less=read.csv("HUR_May.2024_SUMMARYless.csv")
RUTmay_less=read.csv("RUT_May.2024_SUMMARYless.csv")
LLWmay_less=read.csv("LLW_May.2024_SUMMARYless.csv")
LLCmay_less=read.csv("LLC_May.2024_SUMMARYless.csv")
RICmay_less=read.csv("RIC_May.2024_SUMMARYless.csv")
# June monthly
EASjune=read.csv("EAS_June.2024_SUMMARY.csv")
FRYjune=read.csv("FRY_June.2024_SUMMARY.csv")
RICjune=read.csv("RIC_June.2024_SUMMARY.csv")
EASjune_less=read.csv("EAS_June.2024_SUMMARYless.csv")
FRYjune_less=read.csv("FRY_June.2024_SUMMARYless.csv")
RICjune_less=read.csv("RIC_June.2024_SUMMARYless.csv")
# July monthly
EASjuly=read.csv("EAS_July.2024_SUMMARY.csv")
FRYjuly=read.csv("FRY_July.2024_SUMMARY.csv")
RICjuly=read.csv("RIC_July.2024_SUMMARY.csv")
EASjuly_less=read.csv("EAS_July.2024_SUMMARYless.csv")
FRYjuly_less=read.csv("FRY_July.2024_SUMMARYless.csv")
RICjuly_less=read.csv("RIC_July.2024_SUMMARYless.csv")
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
CROaug_less=read.csv("CRO_Aug.2024_SUMMARYless.csv")
EASaug_less=read.csv("EAS_Aug.2024_SUMMARYless.csv")
HCNaug_less=read.csv("HCN_Aug.2024_SUMMARYless.csv")
FRYaug_less=read.csv("FRY_Aug.2024_SUMMARYless.csv")
HURaug_less=read.csv("HUR_Aug.2024_SUMMARYless.csv")
RUTaug_less=read.csv("RUT_Aug.2024_SUMMARYless.csv")
LLWaug_less=read.csv("LLW_Aug.2024_SUMMARYless.csv")
LLCaug_less=read.csv("LLC_Aug.2024_SUMMARYless.csv")
RICaug_less=read.csv("RIC_Aug.2024_SUMMARYless.csv")



# Adding a column with site name bc once we merge we won't know
# September monthly
EASsept$Site <- c("EAS")
FRYsept$Site <- c("FRY")
RICsept$Site <- c("RIC")
EASsept_less$Site <- c("EAS")
FRYsept_less$Site <- c("FRY")
RICsept_less$Site <- c("RIC")
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
CROoct_less$Site <- c("CRO")
EASoct_less$Site <- c("EAS")
HCNoct_less$Site <- c("HCN")
FRYoct_less$Site <- c("FRY")
HURoct_less$Site <- c("HUR")
RUToct_less$Site <- c("RUT")
LLWoct_less$Site <- c("LLW")
LLCoct_less$Site <- c("LLC")
RICoct_less$Site <- c("RIC")
# November monthly
EASnov$Site <- c("EAS")
FRYnov$Site <- c("FRY")
RICnov$Site <- c("RIC")
EASnov_less$Site <- c("EAS")
FRYnov_less$Site <- c("FRY")
RICnov_less$Site <- c("RIC")
# December monthly
EASdec$Site <- c("EAS")
FRYdec$Site <- c("FRY")
RICdec$Site <- c("RIC")
EASdec_less$Site <- c("EAS")
FRYdec_less$Site <- c("FRY")
RICdec_less$Site <- c("RIC")
# January monthly
EASjan$Site <- c("EAS")
FRYjan$Site <- c("FRY")
RICjan$Site <- c("RIC")
EASjan_less$Site <- c("EAS")
FRYjan_less$Site <- c("FRY")
RICjan_less$Site <- c("RIC")
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
CROfeb_less$Site <- c("CRO")
EASfeb_less$Site <- c("EAS")
HCNfeb_less$Site <- c("HCN")
FRYfeb_less$Site <- c("FRY")
HURfeb_less$Site <- c("HUR")
RUTfeb_less$Site <- c("RUT")
LLWfeb_less$Site <- c("LLW")
LLCfeb_less$Site <- c("LLC")
RICfeb_less$Site <- c("RIC")
# March monthly
EASmarch$Site <- c("EAS")
FRYmarch$Site <- c("FRY")
RICmarch$Site <- c("RIC")
EASmarch_less$Site <- c("EAS")
FRYmarch_less$Site <- c("FRY")
RICmarch_less$Site <- c("RIC")
# April monthly
EASapril$Site <- c("EAS")
FRYapril$Site <- c("FRY")
RICapril$Site <- c("RIC")
EASapril_less$Site <- c("EAS")
FRYapril_less$Site <- c("FRY")
RICapril_less$Site <- c("RIC")
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
CROmay_less$Site <- c("CRO")
EASmay_less$Site <- c("EAS")
HCNmay_less$Site <- c("HCN")
FRYmay_less$Site <- c("FRY")
HURmay_less$Site <- c("HUR")
RUTmay_less$Site <- c("RUT")
LLWmay_less$Site <- c("LLW")
LLCmay_less$Site <- c("LLC")
RICmay_less$Site <- c("RIC")
# June monthly
EASjune$Site <- c("EAS")
FRYjune$Site <- c("FRY")
RICjune$Site <- c("RIC")
EASjune_less$Site <- c("EAS")
FRYjune_less$Site <- c("FRY")
RICjune_less$Site <- c("RIC")
# July monthly
EASjuly$Site <- c("EAS")
FRYjuly$Site <- c("FRY")
RICjuly$Site <- c("RIC")
EASjuly_less$Site <- c("EAS")
FRYjuly_less$Site <- c("FRY")
RICjuly_less$Site <- c("RIC")
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
CROaug_less$Site <- c("CRO")
EASaug_less$Site <- c("EAS")
HCNaug_less$Site <- c("HCN")
FRYaug_less$Site <- c("FRY")
HURaug_less$Site <- c("HUR")
RUTaug_less$Site <- c("RUT")
LLWaug_less$Site <- c("LLW")
LLCaug_less$Site <- c("LLC")
RICaug_less$Site <- c("RIC")



# Adding a column with sample month so the dates aren't weird
# September monthly
EASsept$Sample.Month <- c("September")
FRYsept$Sample.Month <- c("September")
RICsept$Sample.Month <- c("September")
EASsept_less$Sample.Month <- c("September")
FRYsept_less$Sample.Month <- c("September")
RICsept_less$Sample.Month <- c("September")
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
CROoct_less$Sample.Month <- c("October")
EASoct_less$Sample.Month <- c("October")
HCNoct_less$Sample.Month <- c("October")
FRYoct_less$Sample.Month <- c("October")
HURoct_less$Sample.Month <- c("October")
RUToct_less$Sample.Month <- c("October")
LLWoct_less$Sample.Month <- c("October")
LLCoct_less$Sample.Month <- c("October")
RICoct_less$Sample.Month <- c("October")
# November monthly
EASnov$Sample.Month <- c("November")
FRYnov$Sample.Month <- c("November")
RICnov$Sample.Month <- c("November")
EASnov_less$Sample.Month <- c("November")
FRYnov_less$Sample.Month <- c("November")
RICnov_less$Sample.Month <- c("November")
# December monthly
EASdec$Sample.Month <- c("December")
FRYdec$Sample.Month <- c("December")
RICdec$Sample.Month <- c("December")
EASdec_less$Sample.Month <- c("December")
FRYdec_less$Sample.Month <- c("December")
RICdec_less$Sample.Month <- c("December")
# January monthly
EASjan$Sample.Month <- c("January")
FRYjan$Sample.Month <- c("January")
RICjan$Sample.Month <- c("January")
EASjan_less$Sample.Month <- c("January")
FRYjan_less$Sample.Month <- c("January")
RICjan_less$Sample.Month <- c("January")
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
CROfeb_less$Sample.Month <- c("February")
EASfeb_less$Sample.Month <- c("February")
HCNfeb_less$Sample.Month <- c("February")
FRYfeb_less$Sample.Month <- c("February")
HURfeb_less$Sample.Month <- c("February")
RUTfeb_less$Sample.Month <- c("February")
LLWfeb_less$Sample.Month <- c("February")
LLCfeb_less$Sample.Month <- c("February")
RICfeb_less$Sample.Month <- c("February")
# March monthly
EASmarch$Sample.Month <- c("March")
FRYmarch$Sample.Month <- c("March")
RICmarch$Sample.Month <- c("March")
EASmarch_less$Sample.Month <- c("March")
FRYmarch_less$Sample.Month <- c("March")
RICmarch_less$Sample.Month <- c("March")
# April monthly
EASapril$Sample.Month <- c("April")
FRYapril$Sample.Month <- c("April")
RICapril$Sample.Month <- c("April")
EASapril_less$Sample.Month <- c("April")
FRYapril_less$Sample.Month <- c("April")
RICapril_less$Sample.Month <- c("April")
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
CROmay_less$Sample.Month <- c("May")
EASmay_less$Sample.Month <- c("May")
HCNmay_less$Sample.Month <- c("May")
FRYmay_less$Sample.Month <- c("May")
HURmay_less$Sample.Month <- c("May")
RUTmay_less$Sample.Month <- c("May")
LLWmay_less$Sample.Month <- c("May")
LLCmay_less$Sample.Month <- c("May")
RICmay_less$Sample.Month <- c("May")
# June monthly
EASjune$Sample.Month <- c("June")
FRYjune$Sample.Month <- c("June")
RICjune$Sample.Month <- c("June")
EASjune_less$Sample.Month <- c("June")
FRYjune_less$Sample.Month <- c("June")
RICjune_less$Sample.Month <- c("June")
# July monthly
EASjuly$Sample.Month <- c("July")
FRYjuly$Sample.Month <- c("July")
RICjuly$Sample.Month <- c("July")
EASjuly_less$Sample.Month <- c("July")
FRYjuly_less$Sample.Month <- c("July")
RICjuly_less$Sample.Month <- c("July")
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
CROaug_less$Sample.Month <- c("August")
EASaug_less$Sample.Month <- c("August")
HCNaug_less$Sample.Month <- c("August")
FRYaug_less$Sample.Month <- c("August")
HURaug_less$Sample.Month <- c("August")
RUTaug_less$Sample.Month <- c("August")
LLWaug_less$Sample.Month <- c("August")
LLCaug_less$Sample.Month <- c("August")
RICaug_less$Sample.Month <- c("August")




# Adding a column with SC level bc once we merge we won't know
# September monthly
EASsept$SC.Level <- c("25")
FRYsept$SC.Level <- c("402")
RICsept$SC.Level <- c("1457")
EASsept_less$SC.Level <- c("25")
FRYsept_less$SC.Level <- c("402")
RICsept_less$SC.Level <- c("1457")
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
CROoct_less$SC.Level <- c("72")
EASoct_less$SC.Level <- c("25")
HCNoct_less$SC.Level <- c("78")
FRYoct_less$SC.Level <- c("402")
HURoct_less$SC.Level <- c("387")
RUToct_less$SC.Level <- c("594")
LLWoct_less$SC.Level <- c("1119")
LLCoct_less$SC.Level <- c("1242")
RICoct_less$SC.Level <- c("1457")
# November monthly
EASnov$SC.Level <- c("25")
FRYnov$SC.Level <- c("402")
RICnov$SC.Level <- c("1457")
EASnov_less$SC.Level <- c("25")
FRYnov_less$SC.Level <- c("402")
RICnov_less$SC.Level <- c("1457")
# December monthly
EASdec$SC.Level <- c("25")
FRYdec$SC.Level <- c("402")
RICdec$SC.Level <- c("1457")
EASdec_less$SC.Level <- c("25")
FRYdec_less$SC.Level <- c("402")
RICdec_less$SC.Level <- c("1457")
# January monthly
EASjan$SC.Level <- c("25")
FRYjan$SC.Level <- c("402")
RICjan$SC.Level <- c("1457")
EASjan_less$SC.Level <- c("25")
FRYjan_less$SC.Level <- c("402")
RICjan_less$SC.Level <- c("1457")
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
CROfeb_less$SC.Level <- c("72")
EASfeb_less$SC.Level <- c("25")
HCNfeb_less$SC.Level <- c("78")
FRYfeb_less$SC.Level <- c("402")
HURfeb_less$SC.Level <- c("387")
RUTfeb_less$SC.Level <- c("594")
LLWfeb_less$SC.Level <- c("1119")
LLCfeb_less$SC.Level <- c("1242")
RICfeb_less$SC.Level <- c("1457")
# March monthly
EASmarch$SC.Level <- c("25")
FRYmarch$SC.Level <- c("402")
RICmarch$SC.Level <- c("1457")
EASmarch_less$SC.Level <- c("25")
FRYmarch_less$SC.Level <- c("402")
RICmarch_less$SC.Level <- c("1457")
# April monthly
EASapril$SC.Level <- c("25")
FRYapril$SC.Level <- c("402")
RICapril$SC.Level <- c("1457")
EASapril_less$SC.Level <- c("25")
FRYapril_less$SC.Level <- c("402")
RICapril_less$SC.Level <- c("1457")
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
CROmay_less$SC.Level <- c("72")
EASmay_less$SC.Level <- c("25")
HCNmay_less$SC.Level <- c("78")
FRYmay_less$SC.Level <- c("402")
HURmay_less$SC.Level <- c("387")
RUTmay_less$SC.Level <- c("594")
LLWmay_less$SC.Level <- c("1119")
LLCmay_less$SC.Level <- c("1242")
RICmay_less$SC.Level <- c("1457")
# June monthly
EASjune$SC.Level <- c("25")
FRYjune$SC.Level <- c("402")
RICjune$SC.Level <- c("1457")
EASjune_less$SC.Level <- c("25")
FRYjune_less$SC.Level <- c("402")
RICjune_less$SC.Level <- c("1457")
# July monthly
EASjuly$SC.Level <- c("25")
FRYjuly$SC.Level <- c("402")
RICjuly$SC.Level <- c("1457")
EASjuly_less$SC.Level <- c("25")
FRYjuly_less$SC.Level <- c("402")
RICjuly_less$SC.Level <- c("1457")
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
CROaug_less$SC.Level <- c("72")
EASaug_less$SC.Level <- c("25")
HCNaug_less$SC.Level <- c("78")
FRYaug_less$SC.Level <- c("402")
HURaug_less$SC.Level <- c("387")
RUTaug_less$SC.Level <- c("594")
LLWaug_less$SC.Level <- c("1119")
LLCaug_less$SC.Level <- c("1242")
RICaug_less$SC.Level <- c("1457")


# Adding a column with SC Category bc once we merge we won't know
# September monthly
EASsept$SC.Category <- c("REF")
FRYsept$SC.Category <- c("MID")
RICsept$SC.Category <- c("HIGH")
EASsept_less$SC.Category <- c("REF")
FRYsept_less$SC.Category <- c("MID")
RICsept_less$SC.Category <- c("HIGH")
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
CROoct_less$SC.Category <- c("REF")
EASoct_less$SC.Category <- c("REF")
HCNoct_less$SC.Category <- c("REF")
FRYoct_less$SC.Category <- c("MID")
HURoct_less$SC.Category <- c("MID")
RUToct_less$SC.Category <- c("MID")
LLWoct_less$SC.Category <- c("HIGH")
LLCoct_less$SC.Category <- c("HIGH")
RICoct_less$SC.Category <- c("HIGH")
# November monthly
EASnov$SC.Category <- c("REF")
FRYnov$SC.Category <- c("MID")
RICnov$SC.Category <- c("HIGH")
EASnov_less$SC.Category <- c("REF")
FRYnov_less$SC.Category <- c("MID")
RICnov_less$SC.Category <- c("HIGH")
# December monthly
EASdec$SC.Category <- c("REF")
FRYdec$SC.Category <- c("MID")
RICdec$SC.Category <- c("HIGH")
EASdec_less$SC.Category <- c("REF")
FRYdec_less$SC.Category <- c("MID")
RICdec_less$SC.Category <- c("HIGH")
# January monthly
EASjan$SC.Category <- c("REF")
FRYjan$SC.Category <- c("MID")
RICjan$SC.Category <- c("HIGH")
EASjan_less$SC.Category <- c("REF")
FRYjan_less$SC.Category <- c("MID")
RICjan_less$SC.Category <- c("HIGH")
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
CROfeb_less$SC.Category <- c("REF")
EASfeb_less$SC.Category <- c("REF")
HCNfeb_less$SC.Category <- c("REF")
FRYfeb_less$SC.Category <- c("MID")
HURfeb_less$SC.Category <- c("MID")
RUTfeb_less$SC.Category <- c("MID")
LLWfeb_less$SC.Category <- c("HIGH")
LLCfeb_less$SC.Category <- c("HIGH")
RICfeb_less$SC.Category <- c("HIGH")
# March monthly
EASmarch$SC.Category <- c("REF")
FRYmarch$SC.Category <- c("MID")
RICmarch$SC.Category <- c("HIGH")
EASmarch_less$SC.Category <- c("REF")
FRYmarch_less$SC.Category <- c("MID")
RICmarch_less$SC.Category <- c("HIGH")
# April monthly
EASapril$SC.Category <- c("REF")
FRYapril$SC.Category <- c("MID")
RICapril$SC.Category <- c("HIGH")
EASapril_less$SC.Category <- c("REF")
FRYapril_less$SC.Category <- c("MID")
RICapril_less$SC.Category <- c("HIGH")
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
CROmay_less$SC.Category <- c("REF")
EASmay_less$SC.Category <- c("REF")
HCNmay_less$SC.Category <- c("REF")
FRYmay_less$SC.Category <- c("MID")
HURmay_less$SC.Category <- c("MID")
RUTmay_less$SC.Category <- c("MID")
LLWmay_less$SC.Category <- c("HIGH")
LLCmay_less$SC.Category <- c("HIGH")
RICmay_less$SC.Category <- c("HIGH")
# June monthly
EASjune$SC.Category <- c("REF")
FRYjune$SC.Category <- c("MID")
RICjune$SC.Category <- c("HIGH")
EASjune_less$SC.Category <- c("REF")
FRYjune_less$SC.Category <- c("MID")
RICjune_less$SC.Category <- c("HIGH")
# July monthly
EASjuly$SC.Category <- c("REF")
FRYjuly$SC.Category <- c("MID")
RICjuly$SC.Category <- c("HIGH")
EASjuly_less$SC.Category <- c("REF")
FRYjuly_less$SC.Category <- c("MID")
RICjuly_less$SC.Category <- c("HIGH")
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
CROaug_less$SC.Category <- c("REF")
EASaug_less$SC.Category <- c("REF")
HCNaug_less$SC.Category <- c("REF")
FRYaug_less$SC.Category <- c("MID")
HURaug_less$SC.Category <- c("MID")
RUTaug_less$SC.Category <- c("MID")
LLWaug_less$SC.Category <- c("HIGH")
LLCaug_less$SC.Category <- c("HIGH")
RICaug_less$SC.Category <- c("HIGH")


# Let's re-arrange the columns so these new additions are at the front-------
# September monthly
EASsept<- EASsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYsept<- FRYsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICsept<- RICsept %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASsept_less<- EASsept_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month", "Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYsept_less<- FRYsept_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICsept_less<- RICsept_less %>% 
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
CROoct_less <- CROoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASoct_less <- EASoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNoct_less <- HCNoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYoct_less <- FRYoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURoct_less <- HURoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUToct_less <- RUToct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICoct_less <- RICoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCoct_less <- LLCoct_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWoct_less <- LLWoct_less %>% 
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
EASnov_less<- EASnov_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYnov_less<- FRYnov_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICnov_less<- RICnov_less %>% 
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
EASdec_less<- EASdec_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYdec_less<- FRYdec_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICdec_less<- RICdec_less %>% 
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
EASjan_less<- EASjan_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjan_less<- FRYjan_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjan_less<- RICjan_less %>% 
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
CROfeb_less<- CROfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASfeb_less<- EASfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNfeb_less<- HCNfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYfeb_less<- FRYfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURfeb_less<- HURfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTfeb_less<- RUTfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWfeb_less<- LLWfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCfeb_less<- LLCfeb_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICfeb_less<- RICfeb_less %>% 
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
EASmarch_less<- EASmarch_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYmarch_less<- FRYmarch_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICmarch_less<- RICmarch_less %>% 
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
EASapril_less<- EASapril_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYapril_less<- FRYapril_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICapril_less<- RICapril_less %>% 
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
CROmay_less<- CROmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASmay_less<- EASmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNmay_less<- HCNmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYmay_less<- FRYmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURmay_less<- HURmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTmay_less<- RUTmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWmay_less<- LLWmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCmay_less<- LLCmay_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICmay_less<- RICmay_less %>% 
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

EASjune_less<- EASjune_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjune_less<- FRYjune_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjune_less<- RICjune_less %>% 
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
EASjuly_less<- EASjuly_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYjuly_less<- FRYjuly_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICjuly_less<- RICjuly_less %>% 
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
CROaug_less<- CROaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
EASaug_less<- EASaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HCNaug_less<- HCNaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
FRYaug_less<- FRYaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
HURaug_less<- HURaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RUTaug_less<- RUTaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLWaug_less<- LLWaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
LLCaug_less<- LLCaug_less %>% 
  select(c("Site","SC.Category","SC.Level","Sample.Date","Sample.Month","Fraction",
           "Replicate","Order","Family","Genus"), everything())
RICaug_less<- RICaug_less %>% 
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
EASsept_less <- EASsept_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYsept_less <- FRYsept_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICsept_less <- RICsept_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
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
CROoct_less <- CROoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASoct_less <- EASoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNoct_less <- HCNoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYoct_less <- FRYoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURoct_less <- HURoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUToct_less <- RUToct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWoct_less <- LLWoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCoct_less <- LLCoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICoct_less <- RICoct_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# November monthly
EASnov <- EASnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYnov <- FRYnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICnov <- RICnov %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASnov_less <- EASnov_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYnov_less <- FRYnov_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICnov_less <- RICnov_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# December monthly
EASdec <- EASdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYdec <- FRYdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICdec <- RICdec %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASdec_less <- EASdec_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYdec_less <- FRYdec_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICdec_less <- RICdec_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# January monthly
EASjan <- EASjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjan <- FRYjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjan <- RICjan %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASjan_less <- EASjan_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjan_less <- FRYjan_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjan_less <- RICjan_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
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
CROfeb_less <- CROfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASfeb_less <- EASfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNfeb_less <- HCNfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYfeb_less <- FRYfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURfeb_less <- HURfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTfeb_less <- RUTfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWfeb_less <- LLWfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCfeb_less <- LLCfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICfeb_less <- RICfeb_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# March monthly
EASmarch <- EASmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYmarch <- FRYmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICmarch <- RICmarch %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASmarch_less <- EASmarch_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYmarch_less <- FRYmarch_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICmarch_less <- RICmarch_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# April monthly
EASapril <- EASapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYapril <- FRYapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICapril <- RICapril %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASapril_less <- EASapril_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYapril_less <- FRYapril_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICapril_less <- RICapril_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
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
CROmay_less <- CROmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASmay_less <- EASmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNmay_less <- HCNmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYmay_less <- FRYmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURmay_less <- HURmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTmay_less <- RUTmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWmay_less <- LLWmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCmay_less <- LLCmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICmay_less <- RICmay_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# June monthly
EASjune <- EASjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjune <- FRYjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjune <- RICjune %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASjune_less <- EASjune_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjune_less <- FRYjune_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjune_less <- RICjune_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
# July monthly
EASjuly <- EASjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjuly <- FRYjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjuly <- RICjuly %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASjuly_less <- EASjuly_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYjuly_less <- FRYjuly_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICjuly_less <- RICjuly_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
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
CROaug_less <- CROaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
EASaug_less <- EASaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HCNaug_less <- HCNaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
FRYaug_less <- FRYaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
HURaug_less <- HURaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RUTaug_less <- RUTaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLWaug_less <- LLWaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
LLCaug_less <- LLCaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))
RICaug_less <- RICaug_less %>% select(-c("Order", "Family", "Biomass", "Density", "Abundance"))



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
EASsept_less <- EASsept_less %>%
  rename_with(
    .cols = (match("Genus", names(EASsept_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASsept_less)) - 1), # Abundance columns begin after Genus is identified and goes until "BIOMASS STARTS HERE"
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYsept_less <- FRYsept_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYsept_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYsept_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICsept_less <- RICsept_less %>%
  rename_with(
    .cols = (match("Genus", names(RICsept_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICsept_less)) - 1),
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
CROoct_less <- CROoct_less %>%
  rename_with(
    .cols = (match("Genus", names(CROoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(CROoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASoct_less <- EASoct_less %>%
  rename_with(
    .cols = (match("Genus", names(EASoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNoct_less <- HCNoct_less %>%
  rename_with(
    .cols = (match("Genus", names(HCNoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYoct_less <- FRYoct_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURoct_less <- HURoct_less %>%
  rename_with(
    .cols = (match("Genus", names(HURoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HURoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUToct_less <- RUToct_less %>%
  rename_with(
    .cols = (match("Genus", names(RUToct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RUToct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWoct_less <- LLWoct_less %>%
  rename_with(
    .cols = (match("Genus", names(LLWoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCoct_less <- LLCoct_less %>%
  rename_with(
    .cols = (match("Genus", names(LLCoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCoct_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICoct_less <- RICoct_less %>%
  rename_with(
    .cols = (match("Genus", names(RICoct_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICoct_less)) - 1),
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
EASnov_less <- EASnov_less %>%
  rename_with(
    .cols = (match("Genus", names(EASnov_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASnov_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYnov_less <- FRYnov_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYnov_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYnov_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICnov_less <- RICnov_less %>%
  rename_with(
    .cols = (match("Genus", names(RICnov_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICnov_less)) - 1),
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
EASdec_less <- EASdec_less %>%
  rename_with(
    .cols = (match("Genus", names(EASdec_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASdec_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYdec_less <- FRYdec_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYdec_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYdec_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICdec_less <- RICdec_less %>%
  rename_with(
    .cols = (match("Genus", names(RICdec_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICdec_less)) - 1),
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
EASjan_less <- EASjan_less %>%
  rename_with(
    .cols = (match("Genus", names(EASjan_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjan_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjan_less <- FRYjan_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYjan_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjan_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjan_less <- RICjan_less %>%
  rename_with(
    .cols = (match("Genus", names(RICjan_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjan_less)) - 1),
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
CROfeb_less <- CROfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(CROfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(CROfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASfeb_less <- EASfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(EASfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNfeb_less <- HCNfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(HCNfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYfeb_less <- FRYfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURfeb_less <- HURfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(HURfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HURfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTfeb_less <- RUTfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(RUTfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWfeb_less <- LLWfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(LLWfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCfeb_less <- LLCfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(LLCfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCfeb_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICfeb_less <- RICfeb_less %>%
  rename_with(
    .cols = (match("Genus", names(RICfeb_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICfeb_less)) - 1),
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
EASmarch_less <- EASmarch_less %>%
  rename_with(
    .cols = (match("Genus", names(EASmarch_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASmarch_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYmarch_less <- FRYmarch_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYmarch_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYmarch_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICmarch_less <- RICmarch_less %>%
  rename_with(
    .cols = (match("Genus", names(RICmarch_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICmarch_less)) - 1),
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
EASapril_less <- EASapril_less %>%
  rename_with(
    .cols = (match("Genus", names(EASapril_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASapril_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYapril_less <- FRYapril_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYapril_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYapril_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICapril_less <- RICapril_less %>%
  rename_with(
    .cols = (match("Genus", names(RICapril_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICapril_less)) - 1),
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
CROmay_less <- CROmay_less %>%
  rename_with(
    .cols = (match("Genus", names(CROmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(CROmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASmay_less <- EASmay_less %>%
  rename_with(
    .cols = (match("Genus", names(EASmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNmay_less <- HCNmay_less %>%
  rename_with(
    .cols = (match("Genus", names(HCNmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYmay_less <- FRYmay_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURmay_less <- HURmay_less %>%
  rename_with(
    .cols = (match("Genus", names(HURmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HURmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTmay_less <- RUTmay_less %>%
  rename_with(
    .cols = (match("Genus", names(RUTmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWmay_less <- LLWmay_less %>%
  rename_with(
    .cols = (match("Genus", names(LLWmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCmay_less <- LLCmay_less %>%
  rename_with(
    .cols = (match("Genus", names(LLCmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCmay_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICmay_less <- RICmay_less %>%
  rename_with(
    .cols = (match("Genus", names(RICmay_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICmay_less)) - 1),
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
EASjune_less <- EASjune_less %>%
  rename_with(
    .cols = (match("Genus", names(EASjune_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjune_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjune_less <- FRYjune_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYjune_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjune_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjune_less <- RICjune_less %>%
  rename_with(
    .cols = (match("Genus", names(RICjune_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjune_less)) - 1),
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
EASjuly_less <- EASjuly_less %>%
  rename_with(
    .cols = (match("Genus", names(EASjuly_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASjuly_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYjuly_less <- FRYjuly_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYjuly_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYjuly_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICjuly_less <- RICjuly_less %>%
  rename_with(
    .cols = (match("Genus", names(RICjuly_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICjuly_less)) - 1),
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
CROaug_less <- CROaug_less %>%
  rename_with(
    .cols = (match("Genus", names(CROaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(CROaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
EASaug_less <- EASaug_less %>%
  rename_with(
    .cols = (match("Genus", names(EASaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(EASaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HCNaug_less <- HCNaug_less %>%
  rename_with(
    .cols = (match("Genus", names(HCNaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HCNaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
FRYaug_less <- FRYaug_less %>%
  rename_with(
    .cols = (match("Genus", names(FRYaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(FRYaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
HURaug_less <- HURaug_less %>%
  rename_with(
    .cols = (match("Genus", names(HURaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(HURaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RUTaug_less <- RUTaug_less %>%
  rename_with(
    .cols = (match("Genus", names(RUTaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RUTaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLWaug_less <- LLWaug_less %>%
  rename_with(
    .cols = (match("Genus", names(LLWaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLWaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
LLCaug_less <- LLCaug_less %>%
  rename_with(
    .cols = (match("Genus", names(LLCaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(LLCaug_less)) - 1),
    .fn = ~ paste0("Abundance.Length_", seq_along(.))
  )
RICaug_less <- RICaug_less %>%
  rename_with(
    .cols = (match("Genus", names(RICaug_less)) + 1):(match("BIOMASS.STARTS.HERE", names(RICaug_less)) - 1),
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
EASsept_less <- EASsept_less %>%
  rename_with(
    .cols = (which(names(EASsept_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASsept_less), # Biomass columbs begin after "BIOMASS STARTS HERE" column
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYsept_less <- FRYsept_less %>%
  rename_with(
    .cols = (which(names(FRYsept_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYsept_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICsept_less <- RICsept_less %>%
  rename_with(
    .cols = (which(names(RICsept_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICsept_less),
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
CROoct_less <- CROoct_less %>%
  rename_with(
    .cols = (which(names(CROoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(CROoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASoct_less <- EASoct_less %>%
  rename_with(
    .cols = (which(names(EASoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNoct_less <- HCNoct_less %>%
  rename_with(
    .cols = (which(names(HCNoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYoct_less <- FRYoct_less %>%
  rename_with(
    .cols = (which(names(FRYoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURoct_less <- HURoct_less %>%
  rename_with(
    .cols = (which(names(HURoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HURoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUToct_less <- RUToct_less %>%
  rename_with(
    .cols = (which(names(RUToct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RUToct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWoct_less <- LLWoct_less %>%
  rename_with(
    .cols = (which(names(LLWoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCoct_less <- LLCoct_less %>%
  rename_with(
    .cols = (which(names(LLCoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCoct_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICoct_less <- RICoct_less %>%
  rename_with(
    .cols = (which(names(RICoct_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICoct_less),
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
EASnov_less <- EASnov_less %>%
  rename_with(
    .cols = (which(names(EASnov_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASnov_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYnov_less <- FRYnov_less %>%
  rename_with(
    .cols = (which(names(FRYnov_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYnov_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICnov_less <- RICnov_less %>%
  rename_with(
    .cols = (which(names(RICnov_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICnov_less),
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
EASdec_less <- EASdec_less %>%
  rename_with(
    .cols = (which(names(EASdec_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASdec_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYdec_less <- FRYdec_less %>%
  rename_with(
    .cols = (which(names(FRYdec_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYdec_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICdec_less <- RICdec_less %>%
  rename_with(
    .cols = (which(names(RICdec_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICdec_less),
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
EASjan_less <- EASjan_less %>%
  rename_with(
    .cols = (which(names(EASjan_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjan_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjan_less <- FRYjan_less %>%
  rename_with(
    .cols = (which(names(FRYjan_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjan_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjan_less <- RICjan_less %>%
  rename_with(
    .cols = (which(names(RICjan_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjan_less),
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
CROfeb_less <- CROfeb_less %>%
  rename_with(
    .cols = (which(names(CROfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(CROfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASfeb_less <- EASfeb_less %>%
  rename_with(
    .cols = (which(names(EASfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNfeb_less <- HCNfeb_less %>%
  rename_with(
    .cols = (which(names(HCNfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYfeb_less <- FRYfeb_less %>%
  rename_with(
    .cols = (which(names(FRYfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURfeb_less <- HURfeb_less %>%
  rename_with(
    .cols = (which(names(HURfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HURfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTfeb_less <- RUTfeb_less %>%
  rename_with(
    .cols = (which(names(RUTfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWfeb_less <- LLWfeb_less %>%
  rename_with(
    .cols = (which(names(LLWfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCfeb_less <- LLCfeb_less %>%
  rename_with(
    .cols = (which(names(LLCfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCfeb_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICfeb_less <- RICfeb_less %>%
  rename_with(
    .cols = (which(names(RICfeb_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICfeb_less),
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
EASmarch_less <- EASmarch_less %>%
  rename_with(
    .cols = (which(names(EASmarch_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASmarch_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYmarch_less <- FRYmarch_less %>%
  rename_with(
    .cols = (which(names(FRYmarch_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYmarch_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICmarch_less <- RICmarch_less %>%
  rename_with(
    .cols = (which(names(RICmarch_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICmarch_less),
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
EASapril_less <- EASapril_less %>%
  rename_with(
    .cols = (which(names(EASapril_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASapril_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYapril_less <- FRYapril_less %>%
  rename_with(
    .cols = (which(names(FRYapril_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYapril_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICapril_less <- RICapril_less %>%
  rename_with(
    .cols = (which(names(RICapril_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICapril_less),
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
CROmay_less <- CROmay_less %>%
  rename_with(
    .cols = (which(names(CROmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(CROmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASmay_less <- EASmay_less %>%
  rename_with(
    .cols = (which(names(EASmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNmay_less <- HCNmay_less %>%
  rename_with(
    .cols = (which(names(HCNmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYmay_less <- FRYmay_less %>%
  rename_with(
    .cols = (which(names(FRYmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURmay_less <- HURmay_less %>%
  rename_with(
    .cols = (which(names(HURmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HURmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTmay_less <- RUTmay_less %>%
  rename_with(
    .cols = (which(names(RUTmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWmay_less <- LLWmay_less %>%
  rename_with(
    .cols = (which(names(LLWmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCmay_less <- LLCmay_less %>%
  rename_with(
    .cols = (which(names(LLCmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCmay_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICmay_less <- RICmay_less %>%
  rename_with(
    .cols = (which(names(RICmay_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICmay_less),
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
EASjune_less <- EASjune_less %>%
  rename_with(
    .cols = (which(names(EASjune_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjune_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjune_less <- FRYjune_less %>%
  rename_with(
    .cols = (which(names(FRYjune_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjune_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjune_less <- RICjune_less %>%
  rename_with(
    .cols = (which(names(RICjune_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjune_less),
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
EASjuly_less <- EASjuly_less %>%
  rename_with(
    .cols = (which(names(EASjuly_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASjuly_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYjuly_less <- FRYjuly_less %>%
  rename_with(
    .cols = (which(names(FRYjuly_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYjuly_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICjuly_less <- RICjuly_less %>%
  rename_with(
    .cols = (which(names(RICjuly_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICjuly_less),
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
CROaug_less <- CROaug_less %>%
  rename_with(
    .cols = (which(names(CROaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(CROaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
EASaug_less <- EASaug_less %>%
  rename_with(
    .cols = (which(names(EASaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(EASaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HCNaug_less <- HCNaug_less %>%
  rename_with(
    .cols = (which(names(HCNaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HCNaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
FRYaug_less <- FRYaug_less %>%
  rename_with(
    .cols = (which(names(FRYaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(FRYaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
HURaug_less <- HURaug_less %>%
  rename_with(
    .cols = (which(names(HURaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(HURaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RUTaug_less <- RUTaug_less %>%
  rename_with(
    .cols = (which(names(RUTaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RUTaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLWaug_less <- LLWaug_less %>%
  rename_with(
    .cols = (which(names(LLWaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLWaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
LLCaug_less <- LLCaug_less %>%
  rename_with(
    .cols = (which(names(LLCaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(LLCaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )
RICaug_less <- RICaug_less %>%
  rename_with(
    .cols = (which(names(RICaug_less) == "BIOMASS.STARTS.HERE") + 1):ncol(RICaug_less),
    .fn = ~ paste0("Biomass.Length_", seq_along(.))
  )




# Now, remove the "BIOMASS STARTS HERE" columns for the next move--------------

# September monthly
EASsept <- EASsept %>% select(-c("BIOMASS.STARTS.HERE"))
FRYsept <- FRYsept %>% select(-c("BIOMASS.STARTS.HERE"))
RICsept <- RICsept %>% select(-c("BIOMASS.STARTS.HERE"))
EASsept_less <- EASsept_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYsept_less <- FRYsept_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICsept_less <- RICsept_less %>% select(-c("BIOMASS.STARTS.HERE"))
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
CROoct_less <- CROoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
EASoct_less <- EASoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
HCNoct_less <- HCNoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYoct_less <- FRYoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
HURoct_less <- HURoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
RUToct_less <- RUToct_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLWoct_less <- LLWoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLCoct_less <- LLCoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICoct_less <- RICoct_less %>% select(-c("BIOMASS.STARTS.HERE"))
# November monthly
EASnov <- EASnov %>% select(-c("BIOMASS.STARTS.HERE"))
FRYnov <- FRYnov %>% select(-c("BIOMASS.STARTS.HERE"))
RICnov <- RICnov %>% select(-c("BIOMASS.STARTS.HERE"))
EASnov_less <- EASnov_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYnov_less <- FRYnov_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICnov_less <- RICnov_less %>% select(-c("BIOMASS.STARTS.HERE"))
# December monthly
EASdec <- EASdec %>% select(-c("BIOMASS.STARTS.HERE"))
FRYdec <- FRYdec %>% select(-c("BIOMASS.STARTS.HERE"))
RICdec <- RICdec %>% select(-c("BIOMASS.STARTS.HERE"))
EASdec_less <- EASdec_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYdec_less <- FRYdec_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICdec_less <- RICdec_less %>% select(-c("BIOMASS.STARTS.HERE"))
# January monthly
EASjan <- EASjan %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjan <- FRYjan %>% select(-c("BIOMASS.STARTS.HERE"))
RICjan <- RICjan %>% select(-c("BIOMASS.STARTS.HERE"))
EASjan_less <- EASjan_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjan_less <- FRYjan_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICjan_less <- RICjan_less %>% select(-c("BIOMASS.STARTS.HERE"))
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
CROfeb_less <- CROfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
EASfeb_less <- EASfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
HCNfeb_less <- HCNfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYfeb_less <- FRYfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
HURfeb_less <- HURfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
RUTfeb_less <- RUTfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLWfeb_less <- LLWfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLCfeb_less <- LLCfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICfeb_less <- RICfeb_less %>% select(-c("BIOMASS.STARTS.HERE"))
# March monthly
EASmarch <- EASmarch %>% select(-c("BIOMASS.STARTS.HERE"))
FRYmarch <- FRYmarch %>% select(-c("BIOMASS.STARTS.HERE"))
RICmarch <- RICmarch %>% select(-c("BIOMASS.STARTS.HERE"))
EASmarch_less <- EASmarch_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYmarch_less <- FRYmarch_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICmarch_less <- RICmarch_less %>% select(-c("BIOMASS.STARTS.HERE"))
# April monthly
EASapril <- EASapril %>% select(-c("BIOMASS.STARTS.HERE"))
FRYapril <- FRYapril %>% select(-c("BIOMASS.STARTS.HERE"))
RICapril <- RICapril %>% select(-c("BIOMASS.STARTS.HERE"))
EASapril_less <- EASapril_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYapril_less <- FRYapril_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICapril_less <- RICapril_less %>% select(-c("BIOMASS.STARTS.HERE"))
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
CROmay_less <- CROmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
EASmay_less <- EASmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
HCNmay_less <- HCNmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYmay_less <- FRYmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
HURmay_less <- HURmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
RUTmay_less <- RUTmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLWmay_less <- LLWmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLCmay_less <- LLCmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICmay_less <- RICmay_less %>% select(-c("BIOMASS.STARTS.HERE"))
# June monthly
EASjune <- EASjune %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjune <- FRYjune %>% select(-c("BIOMASS.STARTS.HERE"))
RICjune <- RICjune %>% select(-c("BIOMASS.STARTS.HERE"))
EASjune_less <- EASjune_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjune_less <- FRYjune_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICjune_less <- RICjune_less %>% select(-c("BIOMASS.STARTS.HERE"))
# July monthly
EASjuly <- EASjuly %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjuly <- FRYjuly %>% select(-c("BIOMASS.STARTS.HERE"))
RICjuly <- RICjuly %>% select(-c("BIOMASS.STARTS.HERE"))
EASjuly_less <- EASjuly_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYjuly_less <- FRYjuly_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICjuly_less <- RICjuly_less %>% select(-c("BIOMASS.STARTS.HERE"))
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
CROaug_less <- CROaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
EASaug_less <- EASaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
HCNaug_less <- HCNaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
FRYaug_less <- FRYaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
HURaug_less <- HURaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
RUTaug_less <- RUTaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLWaug_less <- LLWaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
LLCaug_less <- LLCaug_less %>% select(-c("BIOMASS.STARTS.HERE"))
RICaug_less <- RICaug_less %>% select(-c("BIOMASS.STARTS.HERE"))

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


EASsept_less_long <- EASsept_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  # Select abundance and biomass columns and convert from wide to long
    names_to = c(".value", "Length"),       # `.value` for abundance/biomass values, 'Length' for the lengths
    names_pattern = "(.*)\\.Length_(\\d+)"  # Separate 'abundance'/'biomass' and the numeric length suffix
  ) %>%
  mutate(Length = as.numeric(Length))       # Convert Length column to numeric

FRYsept_less_long <- FRYsept_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICsept_less_long <- RICsept_less %>% 
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

CROoct_less_long <- CROoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASoct_less_long <- EASoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNoct_less_long <- HCNoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYoct_less_long <- FRYoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURoct_less_long <- HURoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUToct_less_long <- RUToct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWoct_less_long <- LLWoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCoct_less_long <- LLCoct_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICoct_less_long <- RICoct_less %>% 
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

EASnov_less_long <- EASnov_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYnov_less_long <- FRYnov_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICnov_less_long <- RICnov_less %>% 
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

EASdec_less_long <- EASdec_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYdec_less_long <- FRYdec_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICdec_less_long <- RICdec_less %>% 
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

EASjan_less_long <- EASjan_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))  


FRYjan_less_long <- FRYjan_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjan_less_long <- RICjan_less %>% 
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


CROfeb_less_long <- CROfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASfeb_less_long <- EASfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNfeb_less_long <- HCNfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYfeb_less_long <- FRYfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURfeb_less_long <- HURfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTfeb_less_long <- RUTfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWfeb_less_long <- LLWfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCfeb_less_long <- LLCfeb_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICfeb_less_long <- RICfeb_less %>% 
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

EASmarch_less_long <- EASmarch_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYmarch_less_long <- FRYmarch_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICmarch_less_long <- RICmarch_less %>% 
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

EASapril_less_long <- EASapril_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYapril_less_long <- FRYapril_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICapril_less_long <- RICapril_less %>% 
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


CROmay_less_long <- CROmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASmay_less_long <- EASmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNmay_less_long <- HCNmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYmay_less_long <- FRYmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURmay_less_long <- HURmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTmay_less_long <- RUTmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWmay_less_long <- LLWmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCmay_less_long <- LLCmay_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICmay_less_long <- RICmay_less %>% 
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

EASjune_less_long <- EASjune_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYjune_less_long <- FRYjune_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjune_less_long <- RICjune_less %>% 
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

EASjuly_less_long <- EASjuly_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  #
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))       

FRYjuly_less_long <- FRYjuly_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"), 
    names_to = c(".value", "Length"),       
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))     

RICjuly_less_long <- RICjuly_less %>% 
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

CROaug_less_long <- CROaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length))    

EASaug_less_long <- EASaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HCNaug_less_long <- HCNaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

FRYaug_less_long <- FRYaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

HURaug_less_long <- HURaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RUTaug_less_long <- RUTaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLWaug_less_long <- LLWaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

LLCaug_less_long <- LLCaug_less %>% 
  pivot_longer(
    cols = starts_with("Abundance.Length") | starts_with("Biomass.Length"),  
    names_to = c(".value", "Length"),      
    names_pattern = "(.*)\\.Length_(\\d+)"  
  ) %>%
  mutate(Length = as.numeric(Length)) 

RICaug_less_long <- RICaug_less %>% 
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

list_of_less_secprod <- list(EASsept_less_long, FRYsept_less_long, RICsept_less_long,
                                CROoct_less_long, EASoct_less_long,HCNoct_less_long, FRYoct_less_long,
                                HURoct_less_long, RUToct_less_long, LLWoct_less_long, LLCoct_less_long,
                                RICoct_less_long, EASnov_less_long, FRYnov_less_long, RICnov_less_long,
                                EASdec_less_long, FRYdec_less_long,RICdec_less_long, EASjan_less_long, 
                                FRYjan_less_long,RICjan_less_long, CROfeb_less_long, EASfeb_less_long,
                                HCNfeb_less_long, FRYfeb_less_long, HURfeb_less_long, RUTfeb_less_long, 
                                LLWfeb_less_long, LLCfeb_less_long, RICfeb_less_long, EASmarch_less_long, 
                                FRYmarch_less_long, RICmarch_less_long, EASapril_less_long, FRYapril_less_long,
                                RICapril_less_long, CROmay_less_long, EASmay_less_long, HCNmay_less_long, 
                                FRYmay_less_long, HURmay_less_long, RUTmay_less_long, LLWmay_less_long,
                                LLCmay_less_long, RICmay_less_long, EASjune_less_long, FRYjune_less_long,
                                RICjune_less_long,EASjuly_less_long, FRYjuly_less_long, RICjuly_less_long,
                                CROaug_less_long, EASaug_less_long, HCNaug_less_long, FRYaug_less_long, 
                                HURaug_less_long, RUTaug_less_long,  LLWaug_less_long, LLCaug_less_long, RICaug_less_long) 

# Combine the two lists into one
combined_2Plists <- c(list_of_greater_secprod, list_of_less_secprod)

# Combine all elements into a single data frame
SECPROD <- do.call(rbind, combined_2Plists)


 
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
   mutate(Genus = ifelse(Genus == "Optioservus (L)", "Optioservus", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Stenelmis (L)", "Stenelmis", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Paraleptophlebiidae", "Paraleptophlebia", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Heptageniidae", "Stenonema", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Chironomidae", "Orthocladine", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Leptophlebiidae", "Paraleptophlebiidae", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Capniidae", "Paracapnia", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Ceratopogonidae", "Probezzia", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Ceraptogoninae", "Probezzia", Genus))
 SECPROD <-  SECPROD %>%
   mutate(Fraction = ifelse(Fraction == ">1", "> 1", Fraction))
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Allocapnia", "Paracapnia", Genus)) 
 SECPROD <-  SECPROD %>%
   mutate(Genus = ifelse(Genus == "Allocapnia" & Sample.Month == "October" & Fraction == "> 1" & Site == "EAS", 
                         "Paracapnia", # Allocapnia were actually paracapnia
                         Genus))
 
 # Taking out zeroes and N/A in biomass too
 
 library(dplyr)
 library(stringr)
 
 SECPROD <- SECPROD %>%
   filter(
     Biomass != 0,  # Filter out rows where Biomass is zero
     !str_detect(Genus, "Hagenella|Stagnicola|Terrestrial|Pupa|Adult|\\(A\\)|\\(terrestrial\\)")  # Exclude rows with "Pupa", "Adult", or "(A)", Stagnicola, Hagenella (only 1) in the Genus column
   )

 # Realized i had decimal in wrong place and needed to move one spot to the left
 SECPROD$Biomass <- as.numeric(as.character(SECPROD$Biomass))
 
 
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

 # Finally, let's add a new Density column, then use it to correct biomass by area
 SECPROD <- SECPROD %>% 
   mutate(Density = Abundance / 0.0929) %>%
   mutate(Biomass.g = Biomass / 1000) %>% # Biomass was in mg bc of the length mass regressions, divide by 1000 to get to g
   mutate(Biomass.Area.Corrected = Biomass.g*Density)
# Saving as a CSV for geom_ridge code
write.csv(SECPROD, "SEC_PROD.csv", row.names = FALSE)


## Biomass across the year------------------------------------------------------


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
SECPROD$FFG[SECPROD$Genus=="Chauloides"]="Predator"
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

# For color scheme
install.packages("rcartocolor")# Colorblind color schemes
library(rcartocolor)
display_carto_all()

ffg_colors <- c("Scraper" = "#008080", 
                "Shredder" = "#CA562C", 
                "Predator" = "#F6EDBD", 
                "Collector-Gatherer" = "#DE8A5A", 
                "Collector-Filterer" = "#70A494")  

# Summarizing each FFG in each replicate for each stream
# Then, averaging the replicates from each stream--> 1 value per FFG per month
biomass <- SECPROD %>%
  group_by(Sample.Month, SC.Category,SC.Level,Site,Replicate,FFG ) %>% 
  summarise(sum.biomass=sum(Biomass.Area.Corrected,na.rm=FALSE))  %>% 

  group_by(Sample.Month,SC.Category,SC.Level,Site,FFG ) %>% 
  summarise(mean.biomass=mean(sum.biomass,na.rm=FALSE))

# Checking for NAs in FFGs--have had weird things happen that cause annoyances later
taxa_na_count <- SECPROD %>%
  filter(is.na(FFG)) %>%
  group_by(Genus) # should be 0


biomassmonthly <- biomass %>%
  filter(Site %in% c("EAS", "FRY", "RIC"))

biomassquarterly <- biomass %>%
  filter(Sample.Month %in% c("October", "February", "May", "August"))


biomassmonthly$FFG <- factor(biomassmonthly$FFG, levels = c("Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
biomassmonthly$Sample.Month <- factor(biomassmonthly$Sample.Month, levels = c("September","October","November","December","January", "February", "March", "April", "May", "June", "July", "August"))
biomassmonthly$SC.Level <- factor(biomassmonthly$SC.Level, levels =c("25","402","1457"))

biomassquarterly$FFG <- factor(biomassquarterly$FFG, levels = c("Scraper","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
biomassquarterly$Sample.Month <- factor(biomassquarterly$Sample.Month, levels = c("October","February","May","August"))
biomassquarterly$SC.Level <- factor(biomassquarterly$SC.Level, levels =c("25","72","78","387","402","594","1119","1242","1457"))


# FFGs across month for core sites
FFGgplot <- ggplot(data = biomassmonthly, aes(x = Sample.Month, y = (log(mean.biomass)))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot) 

# Now, SC on x
FFGgplot1 <- ggplot(data = biomassmonthly, aes(x = SC.Level, y = (log(mean.biomass)))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot1) 

# FFGs across quarterly months
FFGgplot.quart <- ggplot(data = biomassquarterly, aes(x = Sample.Month, y = (log(mean.biomass)))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot.quart) 


FFGgplot1.quart <- ggplot(data = biomassquarterly, aes(x = SC.Level, y = (mean.biomass))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(Biomass(g/m^2))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot1.quart) 


# Okay, I want to run the same thing but make a new FFG category for scrapers that don't have tracheated gills----------------

SECPROD_FFGadjusted <- SECPROD

# Fixing FFGs for select scrapers
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Acerpenna"] ="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Acentrella"] = "Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Acroneuria"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Allocapnia"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Allognasta"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Alloperla"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Ameletus"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Amphinemura"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Antocha"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Atherix"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Attenella"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Baetidae"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Baetis"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Baetisca"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Boyeria"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Calopteryx"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Capniidae"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Ceratopogonidae"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Cernotina"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Chauloides"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Chelifera"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Chimarra"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Cheumatopsyche"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Chironomidae"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Chironomini"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Circulionidae"]="Scraper"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Collembola"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Cordulegaster"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Cyrnellus"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Dicranota"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Diplectrona"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Discocerina"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Dixa"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Dixella"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Dolophilodes"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Ectopria"]="Scraper - Coleoptera"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Eloeophila"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Epeorus"]="Scraper"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Eriopterini"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Ephemera"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Ephemerellidae"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Eurylophella"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Gerris"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Glossosoma"]="Scraper" # unsure about gills
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Goera"]="Scraper" # unsure about gills
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Gomphus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Gomphurus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Gyrinus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Helichus"]="Scraper" # unsure about gills
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hemiptera"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Heptageniidae"]="Scraper"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hetaerina"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hexatoma"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hydrachnia"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hydatophylax"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Hydropsyche"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Isonychia"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Isoperla"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Langessa"]="Scraper" # unsure about gills
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Lanthus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Leptophlebiidae"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Lepidostoma"]= "Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Leuctra"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Leuctridae"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Limnephilidae"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Limnophila"]= "Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Limoniidae"]= "Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Lypodiversa"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Micrasema"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Microvelia"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Molophilus"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Neocleon"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Neophylax"]="Scraper" # unsure about gills
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Neoplasta"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Nigronia"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Oligochaeta"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Optioservus"]="Scraper - Coleoptera"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Oreogeton"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Orthocladine"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Oulimnius"]="Scraper - Coleoptera"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Paracapnia"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Paraleptophlebia"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Polycentropodidae"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Polycentropus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Probezzia"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Prodaticus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Prosimulium"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Psephenus"]="Scraper - Coleoptera"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Pseudolimnophila"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Psychodini"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Pteronarcys"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Pycnopsyche"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Remenus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Rhagovelia"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Rhyacophila"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Prostoia"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Sialis"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Simulium"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Stratiomyidae"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Stylogomphus"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Tallaperla"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Stenelmis"]="Scraper - Coleoptera"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Stenonema"]="Scraper" 
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Taeniopteryx"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Tanypodinae"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Tanytarsini"]="Collector-Gatherer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Tipula"]="Shredder"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Triacanthagyna"]="Predator"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Wormaldia"]="Collector-Filterer"
SECPROD_FFGadjusted$FFG[SECPROD_FFGadjusted$Genus=="Zoraena"]="Predator"

# Saving as a CSV for geom_ridge code
write.csv(SECPROD_FFGadjusted, "SECPROD_FFGadjusted.csv", row.names = FALSE)

# The following is the same as above

# Summarizing means of each FFG in each replicate for each stream
# Then, averaging the replicates from each stream--> 1 value per FFG per month
biomass <- SECPROD_FFGadjusted %>%
  group_by(Sample.Month, SC.Category,SC.Level,Site,Replicate,FFG ) %>% 
  summarise(sum.biomass=sum(Biomass.Area.Corrected,na.rm=FALSE))  %>% 
  
  group_by(Sample.Month,SC.Category,SC.Level,Site,FFG ) %>% 
  summarise(mean.biomass=mean(sum.biomass,na.rm=FALSE))

# Checking for NAs in FFGs--have had weird things happen that cause annoyances later
taxa_na_count <- SECPROD_FFGadjusted %>%
  filter(is.na(FFG)) %>%
  group_by(Genus) # should be 0


biomassmonthly <- biomass %>%
  filter(Site %in% c("EAS", "FRY","RIC"))

biomassquarterly <- biomass %>%
  filter(Sample.Month %in% c("October", "February", "May", "August"))


biomassmonthly$FFG <- factor(biomassmonthly$FFG, levels = c("Scraper","Scraper - Coleoptera", "Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
biomassmonthly$Sample.Month <- factor(biomassmonthly$Sample.Month, levels = c("September","October","November","December","January", "February", "March", "April", "May", "June", "July", "August"))
biomassmonthly$SC.Level <- factor(biomassmonthly$SC.Level, levels =c("25","402","1457"))

biomassquarterly$FFG <- factor(biomassquarterly$FFG, levels = c("Scraper","Scraper - Coleoptera","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))
biomassquarterly$Sample.Month <- factor(biomassquarterly$Sample.Month, levels = c("October","February","May","August"))
biomassquarterly$SC.Level <- factor(biomassquarterly$SC.Level, levels =c("25","72","78","387","402","594","1119","1242","1457"))


# FFGs across month for core sites
FFGgplot <- ggplot(data = biomassmonthly, aes(x = Sample.Month, y = (mean.biomass))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot) 

# Now, SC on x
FFGgplot1 <- ggplot(data = biomassmonthly, aes(x = SC.Level, y = (log(mean.biomass)))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot1) 

# FFGs across quarterly months
FFGgplot.quart <- ggplot(data = biomassquarterly, aes(x = Sample.Month, y = (log(mean.biomass)))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot.quart) 


FFGgplot1.quart <- ggplot(data = biomassquarterly, aes(x = SC.Level, y = (mean.biomass))) +
  facet_wrap(~FFG, ncol = 5, nrow = 5) +  
  geom_boxplot(fill = "white") +  
  geom_point(aes(color = FFG), size = 2) +  
  ylab(expression(log(Biomass(g/m^2)))) +  
  xlab("") +
  scale_color_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

print(FFGgplot1.quart) 


# 2P FOR SPECIFIC TAXA----------------------------------------------------------
# Taxa filtering and arranging lengths from lowest to highest

library(dplyr)

# Filter for Leuctra taxa in EAS across the year and arrange by Length in ascending order, and add a column for density---

SECPROD_leuctra.EAS <- SECPROD %>%
  filter(Genus == "Leuctra", Site == "EAS", Fraction == "> 1") %>%        # Filter for Leuctra genus
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







# Automating 2P for every taxa in EAS--------------------------------------------
# Function to calculate density and individual mass correctly for length classes


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
    
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
    ) %>%
    
    # Calculate Individual Mass
    mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%
    
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Length) %>%
    summarise(
      Mean.Density = mean(Sum.Density, na.rm = TRUE),  # Average Density
      Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE) # Average Individual Mass..avg reps together 
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



# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
     
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/CPI,
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
  
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

EAS_genus_2P_Final <- map(EAS_genus_2P, ~Production_Columns(.x))

# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- EAS_genus_2P_Final[order(names(EAS_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "EAS_Genus_2PSummary.xlsx", overwrite = TRUE)




# Check results for one genus
EAS_genus_2P_Final[["Diplectrona"]] %>% 
  select(Genus, Length, No.Lost, Biomass, 
         Mass.at.Loss, Biomass.Lost, Biomass.Sum) %>%
  print()


# Apply Production_Columns and print a preview
Production_Columns(EAS_genus_2P[[1]]) %>%
  select(Length, Density.Final, No.Lost) %>%
  print()










# Automating 2P for every taxa in FRY---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_FRY <- function(SECPROD, site_filter = "FRY") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "September", "October", "November", "December",
      "January", "February", "March", "April",
      "May", "June", "July", "August"
    )), Sample.Month) %>%
    

    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
    ) %>%
    
    filter(Sum.Density > 0) %>%  # Remove zero-filled classes
    
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
    
    filter(Density.Final > 0) %>%  # Ensure no zero-filled length classes
    
    # Arrange by Length for correct ordering of size classes
    arrange(Length)
}




# Create a list of dataframes, one for each genus, for the "FRY" site
FRY_genus_2P <- SECPROD %>%
  filter(Site == "FRY") %>%             # Filter for the "FRY" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_FRY(SECPROD %>% filter(Genus == .x)))  # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

FRY_genus_2P_Final <- map(FRY_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- FRY_genus_2P_Final[order(names(FRY_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "FRY_Genus_2PSummary.xlsx", overwrite = TRUE)






# Automating 2P for every taxa in RIC---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_RIC <- function(SECPROD, site_filter = "RIC") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "September", "October", "November", "December",
      "January", "February", "March", "April",
      "May", "June", "July", "August"
    )), Sample.Month) %>%
    

    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
RIC_genus_2P <- SECPROD %>%
  filter(Site == "RIC") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_RIC(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

RIC_genus_2P_Final <- map(RIC_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- RIC_genus_2P_Final[order(names(RIC_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "RIC_Genus_2PSummary.xlsx", overwrite = TRUE)
















### QUARTERLY 2P HERE-----------------------------------------------------------------------

# Automating 2P for every taxa in CRO---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_CRO <- function(SECPROD, site_filter = "CRO") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
     "October", "February", "May","August"
    )), Sample.Month) %>%
    
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
CRO_genus_2P <- SECPROD %>%
  filter(Site == "CRO") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_CRO(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

CRO_genus_2P_Final <- map(CRO_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- CRO_genus_2P_Final[order(names(CRO_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "CRO_Genus_2PSummary.xlsx", overwrite = TRUE)








# Automating 2P for every taxa in HCN---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_HCN <- function(SECPROD, site_filter = "HCN") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "October", "February", "May","August"
    )), Sample.Month) %>%
    
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
HCN_genus_2P <- SECPROD %>%
  filter(Site == "HCN") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_HCN(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

HCN_genus_2P_Final <- map(HCN_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- HCN_genus_2P_Final[order(names(HCN_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "HCN_Genus_2PSummary.xlsx", overwrite = TRUE)







# Automating 2P for every taxa in HUR---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_HUR <- function(SECPROD, site_filter = "HUR") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "October", "February", "May","August"
    )), Sample.Month) %>%
    
   
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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




# Create a list of dataframes, one for each genus, for the "HUR" site
HUR_genus_2P <- SECPROD %>%
  filter(Site == "HUR") %>%             # Filter for the "HUR" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_HUR(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

HUR_genus_2P_Final <- map(HUR_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- HUR_genus_2P_Final[order(names(HUR_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "HUR_Genus_2PSummary.xlsx", overwrite = TRUE)






# Automating 2P for every taxa in RUT---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_RUT <- function(SECPROD, site_filter = "RUT") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "October", "February", "May","August"
    )), Sample.Month) %>%
    

    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
RUT_genus_2P <- SECPROD %>%
  filter(Site == "RUT") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_RUT(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

RUT_genus_2P_Final <- map(RUT_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- RUT_genus_2P_Final[order(names(RUT_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "RUT_Genus_2PSummary.xlsx", overwrite = TRUE)







# Automating 2P for every taxa in LLW---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_LLW <- function(SECPROD, site_filter = "LLW") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "October", "February", "May","August"
    )), Sample.Month) %>%
    

    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
LLW_genus_2P <- SECPROD %>%
  filter(Site == "LLW") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_LLW(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

LLW_genus_2P_Final <- map(LLW_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- LLW_genus_2P_Final[order(names(LLW_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "LLW_Genus_2PSummary.xlsx", overwrite = TRUE)








# Automating 2P for every taxa in LLC---------
# Function to calculate density and individual mass correctly for length classes
SECPROD_LLC <- function(SECPROD, site_filter = "LLC") {
  SECPROD %>%
    # Filter by site
    filter(Site == site_filter) %>%
    
    
    # Arrange by month and Sample.Month factor order
    arrange(factor(Sample.Month, levels = c(
      "October", "February", "May","August"
    )), Sample.Month) %>%
    

    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>%
    summarise(
      Sum.Density = sum(Density, na.rm = TRUE),     # Sum Density
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)      # Sum Biomass
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
LLC_genus_2P <- SECPROD %>%
  filter(Site == "LLC") %>%             # Filter for the "EAS" site
  distinct(Genus) %>%                   # Get distinct genera
  pull(Genus) %>%                       # Pull them as a vector
  set_names() %>%                       # Set genus names as list names
  map(~ SECPROD_LLC(SECPROD %>% filter(Genus == .x))) # Apply the function per genus


# Function to Add Additional Columns to Each Genus Dataframe
Production_Columns <- function(SECPROD) {
  SECPROD %>%
    arrange(Length) %>%                       # Sort by Length
    group_by(Genus) %>%                       # Group by Genus
    
    mutate(
      No.Lost = if_else(
        is.na(lead(Density.Final)),  # If the next value is NA (i.e., last row)
        Density.Final / 1,           # Divide current value by 1 for the last row (same value)
        (Density.Final - lead(Density.Final))),  # Subtract next row's density to get Number Lost
      
      Biomass = Density.Final * Individual.Mass.Final,  # Calculate Biomass
      
      # Modify Mass.at.Loss to divide the last value by itself
      Mass.at.Loss = if_else(
        is.na(lead(Individual.Mass.Final)),  # If the next value is NA (i.e., last row)
        Individual.Mass.Final / 2,           # Divide current value by 2 for the last row
        (Individual.Mass.Final + lead(Individual.Mass.Final)) / 2  # Average with the next value for others
      ),
      
      Biomass.Lost = No.Lost * Mass.at.Loss,
      
      Times.No.Size.Classes = Biomass.Lost * n_distinct(Length),  # Multiply Biomass Lost by number of size classes
      
      Biomass.Sum = sum(Biomass), # 1 value for taxa
      
      Production.Uncorrected = sum(Times.No.Size.Classes[Times.No.Size.Classes > 0], na.rm = TRUE),
      
      CohortP.B = Production.Uncorrected/Biomass.Sum,
      
      CPI = 12/n_distinct(Length),
      
      Annual.Production = Production.Uncorrected/(12/n_distinct(Length)),
      
      AnnualP.B = Annual.Production/Biomass.Sum,
      
      # Calculate Daily Growth:
      Largest.Mass = Individual.Mass.Final[which.max(Length)],  # Mass for the largest length class
      Smallest.Mass = Individual.Mass.Final[which.min(Length)], # Mass for the smallest length class
      Daily.Growth = log(Largest.Mass / Smallest.Mass) / sum(unique(Length))
    ) %>%
    select(-Largest.Mass, -Smallest.Mass)%>%  # Remove Largest.Mass and Smallest.Mass columns after using them
    
    ungroup()  # Ungroup after calculation
}



# Apply Production_Columns to each genus dataframe in the list

LLC_genus_2P_Final <- map(LLC_genus_2P, ~Production_Columns(.x))



# Saving it to excel where each genus is it's own tab
library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- LLC_genus_2P_Final[order(names(LLC_genus_2P_Final))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "LLC_Genus_2PSummary.xlsx", overwrite = TRUE)





# Combining df of production for EAS, FRY, RIC------------------
EAS_genus_2P_Final_df <- bind_rows(EAS_genus_2P_Final, .id = "source")
FRY_genus_2P_Final_df <- bind_rows(FRY_genus_2P_Final, .id = "source")
RIC_genus_2P_Final_df <- bind_rows(RIC_genus_2P_Final, .id = "source")
CRO_genus_2P_Final_df <- bind_rows(CRO_genus_2P_Final, .id = "source")
HCN_genus_2P_Final_df <- bind_rows(HCN_genus_2P_Final, .id = "source")
HUR_genus_2P_Final_df <- bind_rows(HUR_genus_2P_Final, .id = "source")
RUT_genus_2P_Final_df <- bind_rows(RUT_genus_2P_Final, .id = "source")
LLW_genus_2P_Final_df <- bind_rows(LLW_genus_2P_Final, .id = "source")
LLC_genus_2P_Final_df <- bind_rows(LLC_genus_2P_Final, .id = "source")

# Core sites with everything including length by length values
CORE_PROD_lengths<- rbind(EAS_genus_2P_Final_df, FRY_genus_2P_Final_df, RIC_genus_2P_Final_df)
# All sites with everything including length by length values
TOTAL_PROD_lengths <- rbind(EAS_genus_2P_Final_df, FRY_genus_2P_Final_df, RIC_genus_2P_Final_df,
                  CRO_genus_2P_Final_df, HCN_genus_2P_Final_df, HUR_genus_2P_Final_df,
                  RUT_genus_2P_Final_df, LLW_genus_2P_Final_df, LLC_genus_2P_Final_df) 

# Load the dplyr package
library(dplyr)

# I want one value per taxa, cleaning up CORE_PROD_lengths. Right now the annual production value is assigned with each genera
# length class, though its the same number for each since there's just one value for each site
# but I just want one, so averaging it will do that since they are the same

COREPROD_Summary <- CORE_PROD_lengths %>%
  group_by(Site, Genus) %>%
  summarise(
    Production.Uncorrected = mean(Production.Uncorrected, na.rm = TRUE),
    CPI = mean(CPI, na.rm = TRUE),
    Annual.Production = mean(Annual.Production, na.rm = TRUE),
    AnnualP.B = mean(AnnualP.B, na.rm = TRUE),
    Daily.Growth = mean(Daily.Growth, na.rm = TRUE),
    .groups = 'drop' # Specify .groups only once
  )

# Ok, perfect. Now, I want to sum the production for all the taxa in each site to get that sites total production
COREPROD_sum <- COREPROD_Summary %>%
  group_by(Site) %>%
  summarise(Sum.Annual.Production = sum(Annual.Production, na.rm = TRUE), .groups = 'drop')


 
# Same as above but for all sites
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



sum(SECPROD$Abundance)

# Adding descriptor columns

COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Acerpenna"] ="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Acentrella"] = "Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Acroneuria"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Allocapnia"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Allognasta"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Alloperla"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Ameletus"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Amphinemura"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Antocha"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Atherix"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Attenella"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Baetidae"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Baetis"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Baetisca"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Boyeria"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Calopteryx"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Capniidae"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Ceratopogonidae"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Cernotina"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Chauloides"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Chelifera"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Chimarra"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Cheumatopsyche"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Chironomidae"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Chironomini"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Circulionidae"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Collembola"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Cordulegaster"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Cyrnellus"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Dicranota"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Diplectrona"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Discocerina"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Dixa"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Dixella"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Dolophilodes"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Ectopria"]="Scraper - Coleoptera"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Eloeophila"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Epeorus"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Eriopterini"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Ephemera"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Ephemerellidae"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Eurylophella"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Gerris"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Glossosoma"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Goera"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Gomphus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Gomphurus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Gyrinus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Helichus"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hemiptera"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Heptageniidae"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hetaerina"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hexatoma"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hydrachnia"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hydatophylax"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Hydropsyche"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Isonychia"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Isoperla"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Langessa"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Lanthus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Leptophlebiidae"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Lepidostoma"]= "Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Leuctra"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Leuctridae"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Limnephilidae"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Limnophila"]= "Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Limoniidae"]= "Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Lypodiversa"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Micrasema"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Microvelia"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Molophilus"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Neocleon"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Neophylax"]="Scraper"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Neoplasta"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Nigronia"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Oligochaeta"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Optioservus"]="Scraper - Coleoptera"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Oreogeton"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Orthocladine"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Oulimnius"]="Scraper - Coleoptera"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Paracapnia"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Paraleptophlebia"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Polycentropodidae"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Polycentropus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Probezzia"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Prodaticus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Prosimulium"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Psephenus"]="Scraper - Coleoptera"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Pseudolimnophila"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Psychodini"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Pteronarcys"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Pycnopsyche"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Remenus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Rhagovelia"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Rhyacophila"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Prostoia"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Sialis"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Simulium"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Stratiomyidae"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Stylogomphus"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Tallaperla"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Stenelmis"]="Scraper - Coleoptera"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Stenonema"]="Scraper" 
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Taeniopteryx"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Tanypodinae"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Tanytarsini"]="Collector-Gatherer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Tipula"]="Shredder"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Triacanthagyna"]="Predator"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Wormaldia"]="Collector-Filterer"
COREPROD_Summary$FFG[COREPROD_Summary$Genus=="Zoraena"]="Predator"
COREPROD_Summary <- COREPROD_Summary %>%
  filter(!str_detect(Genus, "Hagenella|Stagnicola"))


COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="EAS"] = "25"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="CRO"] = "72"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="HCN"] = "78"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="HUR"] = "387"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="FRY"] = "402"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="RUT"] = "594"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="LLW"] = "1119"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="LLC"] = "1242"
COREPROD_Summary$SC.Level[COREPROD_Summary$Site =="RIC"] = "1457"

COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="EAS"] = "REF"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="CRO"] = "REF"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="HCN"] = "REF"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="HUR"] = "MID"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="FRY"] = "MID"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="RUT"] = "MID"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="LLW"] = "HIGH"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="LLC"] = "HIGH"
COREPROD_Summary$SC.Category[COREPROD_Summary$Site =="RIC"] = "HIGH"

COREPROD_Summary$Site <- factor(COREPROD_Summary$Site, levels = c("EAS", "CRO","HCN","HUR","FRY","RUT","LLW","LLC","RIC"))
COREPROD_Summary$SC.Category <- factor(COREPROD_Summary$SC.Category, levels = c("REF","MID","HIGH"))
COREPROD_Summary$SC.Level <- factor(COREPROD_Summary$SC.Level, levels = c("25","72","78","387","402","594","1119","1242","1457"))
COREPROD_Summary$FFG <- factor(COREPROD_Summary$FFG, levels = c("Scraper","Scraper - Coleoptera","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))


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
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Ectopria"]="Scraper - Coleoptera"
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
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Optioservus"]="Scraper - Coleoptera"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Oreogeton"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Orthocladine"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Oulimnius"]="Scraper - Coleoptera"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Paracapnia"]="Shredder"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Paraleptophlebia"]="Collector-Gatherer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Polycentropodidae"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Polycentropus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Probezzia"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Prodaticus"]="Predator"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Prosimulium"]="Collector-Filterer"
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Psephenus"]="Scraper - Coleoptera"
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
TOTALPROD_Summary$FFG[TOTALPROD_Summary$Genus=="Stenelmis"]="Scraper - Coleoptera"
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


TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="EAS"] = "25"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="CRO"] = "72"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HCN"] = "78"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="HUR"] = "387"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="FRY"] = "402"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RUT"] = "594"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLW"] = "1119"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="LLC"] = "1242"
TOTALPROD_Summary$SC.Level[TOTALPROD_Summary$Site =="RIC"] = "1457"

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
TOTALPROD_Summary$SC.Level <- factor(TOTALPROD_Summary$SC.Level, levels = c("25","72","78","387","402","594","1119","1242","1457"))
TOTALPROD_Summary$FFG <- factor(TOTALPROD_Summary$FFG, levels = c("Scraper","Scraper - Coleoptera","Shredder","Predator","Collector-Gatherer","Collector-Filterer"))



# Comparing abundance, density, and biomass for each taxa between core and non-core sites------
library(dplyr)


TAXA_Comparisons <- SECPROD %>%
  
  # Arrange by site
  arrange(factor(Site, levels = c(
    "EAS", "CRO", "HCN","FRY","HUR", "RUT", "RIC", "LLW", "LLC"
  )), Site) %>%

    # Calculate Density
    mutate(Density = Abundance / 0.0929) %>%
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
    # This sums metrics for each genus for each replicate (sums length class metrics for each rep/taxa)
    group_by(Site, Genus, Sample.Month, Sample.Date, Replicate) %>%
    summarise(
      Sum.Abundance = sum(Abundance, na.rm = TRUE),     # Sum Abundance
      Sum.Biomass = sum(Biomass, na.rm = TRUE),      # Sum Biomass
      Sum.Density = sum(Density, na.rm = TRUE)  # Sum Density
    ) %>%
  
    # Group by Site, Genus, Sample.Month, Sample.Date, Length
    # This averages the replicates for each month, so there is one value per length class per sample month
    group_by(Site, Genus, Sample.Month, Sample.Date) %>%
    summarise(
      Mean.Abundance = mean(Sum.Abundance, na.rm = TRUE),  # Average Abundance
      Mean.Biomass = mean(Sum.Biomass, na.rm = TRUE),  # Average Biomass
      Mean.Density = mean(Sum.Density, na.rm = TRUE) # Average Density
    ) %>%
    
    # Group by Genus, Length, Site to calculate final densities and biomass per genus
    # This sums values across months to get annual, decided to not include lengths for broad-stroke comparisons 
    group_by(Genus, Site) %>%
    summarise(
      Abundance.Final = sum(Mean.Abundance, na.rm = TRUE),  # Final Abundance across the year
      Biomass.Final = sum(Mean.Biomass, na.rm = TRUE),  # Final Mass across the year
      Density.Final = sum(Mean.Density, na.rm = TRUE) # Final Density across the year
      
    ) %>%
    
  ungroup()

REF_TAXA_Comparisons <- TAXA_Comparisons %>% filter(Site %in% c("EAS", "CRO", "HCN"))
MID_TAXA_Comparisons <- TAXA_Comparisons %>% filter(Site %in% c("FRY", "HUR", "RUT"))
HIGH_TAXA_Comparisons <- TAXA_Comparisons %>% filter(Site %in% c("RIC", "LLW", "LLC"))


# Saving each of those to excel where each genus is it's own tab
# REF
REF_TAXA_Comparisons <- split(REF_TAXA_Comparisons, REF_TAXA_Comparisons$Genus)

library(dplyr)
library(purrr)
library(openxlsx)

# Create a workbook
wb <- createWorkbook()

# Sort the list of genus dataframes by sheet names (genus names) alphabetically
sorted_genus_list <- REF_TAXA_Comparisons[order(names(REF_TAXA_Comparisons))]

# Add each sorted genus dataframe to a separate sheet
iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      # Add a new worksheet with the genus name
  writeData(wb, sheet_name, data)   # Write the dataframe to the worksheet
})

# Save the workbook to an Excel file
saveWorkbook(wb, "REF_TAXA_Comparisons.xlsx", overwrite = TRUE)


# MID
MID_TAXA_Comparisons <- split(MID_TAXA_Comparisons, MID_TAXA_Comparisons$Genus)

library(dplyr)
library(purrr)
library(openxlsx)

wb <- createWorkbook()

sorted_genus_list <- MID_TAXA_Comparisons[order(names(MID_TAXA_Comparisons))]

iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)  
  writeData(wb, sheet_name, data)   
})

saveWorkbook(wb, "MID_TAXA_Comparisons.xlsx", overwrite = TRUE)


# HIGH
HIGH_TAXA_Comparisons <- split(HIGH_TAXA_Comparisons, HIGH_TAXA_Comparisons$Genus)

library(dplyr)
library(purrr)
library(openxlsx)

wb <- createWorkbook()

sorted_genus_list <- HIGH_TAXA_Comparisons[order(names(HIGH_TAXA_Comparisons))]

iwalk(sorted_genus_list, function(data, sheet_name) {
  addWorksheet(wb, sheet_name)      
  writeData(wb, sheet_name, data)  
})

saveWorkbook(wb, "HIGH_TAXA_Comparisons.xlsx", overwrite = TRUE)





# Comparing abundance, density, production for core sites with variation for abundance and density
# A more appropriate way to compare core variation for CPI------------------------------
library(dplyr)

CORE_Table <- SECPROD %>% 
  
  # Filter for specific sites
  filter(Site %in% c("EAS", "FRY", "RIC")) %>%
  
  # Arrange by site
  arrange(factor(Site, levels = c("EAS", "FRY", "RIC")), Site) %>%
  

  
  # Group by Site, Genus, Sample.Month, Sample.Date, Replicate
  group_by(Site, SC.Category, Genus, Sample.Month, Sample.Date, Replicate) %>%
  summarise(
    Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE),      # Sum Biomass for replicate
    Sum.Density = sum(Density, na.rm = TRUE)  # Sum Density
  ) %>%
  
  # Group by Site, Genus, Sample.Month, Sample.Date
  group_by(Site, SC.Category, Genus, Sample.Month, Sample.Date) %>%
  summarise(
    Mean.Biomass = mean(Sum.Biomass, na.rm = TRUE),  # Average Biomass per month (avg replicates)
    Mean.Density = mean(Sum.Density, na.rm = TRUE) # Average Density
  ) %>%
  
  # Group by Genus, Site to calculate final average densities and biomass per genus
  group_by(Genus, Site, SC.Category) %>%
  summarise(
    Biomass.Final = mean(Mean.Biomass, na.rm = TRUE),  # Average annual Mass across the year
    Density.Final = mean(Mean.Density, na.rm = TRUE), #  Average annual Density across the year
    Biomass.SE = sd(Mean.Biomass, na.rm = TRUE) / sqrt(n()), # Standard error of Biomass based on months
    Density.SE = sd(Mean.Density, na.rm = TRUE) / sqrt(n()) # Standard error of Density based on months
  ) %>%
  
  filter(Density.Final > 0) %>% # Still some zeroes from the SECPROD FRY weirdness
  
  mutate(across(where(is.numeric), ~ round(.x, 4)))%>% # Rounding numbers


  ungroup()


# Merging Core_Table with COREPROD_summary to add production numbers to density and biomass

CORE_SummaryTable <- left_join(CORE_Table, COREPROD_Summary, by = c("Site", "Genus"))

# Add a new column with the "biomass ± SD" format
CORE_SummaryTable <- CORE_SummaryTable %>%
  mutate(
    Biomass = paste0(Biomass.Final, " ± ", Biomass.SE),
    Density = paste0(Density.Final, " ± ", Density.SE),
    across(where(is.numeric), ~ round(.x, 2))) %>%
 select(Genus,Site, SC.Category.x,Density, Biomass, Production.Uncorrected,CPI, Annual.Production,
        AnnualP.B, Daily.Growth
 )


# Cutting out genera with zeros in biomass, still some left over weirdness from FRY oct 

library(dplyr)
library(purrr)
library(openxlsx)

# Save the data frame to an Excel file
write.xlsx(CORE_SummaryTable, file = "CORE_SummaryTable.xlsx", overwrite = TRUE)




# Now with non-core sites
NONCORE_Table <- SECPROD %>%
  
  
  # Filter for specific sites
  filter(Site %in% c("CRO", "HCN", "HUR", "RUT", "LLW", "LLC")) %>%
  
  # Arrange by site
  arrange(factor(Site, levels = c(
    "CRO", "HCN", "HUR", "RUT", "LLW", "LLC")), Site) %>%
  
  
  # Group by Site, Genus, Sample.Month, Sample.Date, Replicate, Length
  # This sums metrics for each genus for each replicate (sums length class metrics for each rep/taxa)
  group_by(Site, SC.Category, Genus, Sample.Month, Sample.Date, Replicate) %>%
  summarise(
    Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE),      # Sum Biomass
    Sum.Density = sum(Density, na.rm = TRUE)  # Sum Density
  ) %>%
  
  # Group by Site, Genus, Sample.Month, Sample.Date, Length
  # This averages the replicates
  group_by(Site,SC.Category, Genus, Sample.Month, Sample.Date) %>%
  summarise(
    Mean.Biomass = mean(Sum.Biomass, na.rm = TRUE),  # Average Biomass
    Mean.Density = mean(Sum.Density, na.rm = TRUE) # Average Density
  ) %>%
  
  # Group by Genus, Site to calculate final average densities and biomass per genus
  # This averages values across months to get annual value...different from above where I summed
  group_by(Genus,Site, SC.Category) %>%
  summarise(
    Biomass.Final = mean(Mean.Biomass, na.rm = TRUE),  # Average annual Mass across the year
    Density.Final = mean(Mean.Density, na.rm = TRUE), #  Average annual Density across the year
    Biomass.SE = sd(Mean.Biomass, na.rm = TRUE) / sqrt(n()), # Standard error of Biomass based on months
    Density.SE = sd(Mean.Density, na.rm = TRUE) / sqrt(n()) # Standard error of Density based on months
  ) %>%
  
  filter(Density.Final > 0) %>% # Still some zeroes from the SECPROD FRY weirdness
  
  mutate(across(where(is.numeric), ~ round(.x, 4))) %>% # Rounding
  
  ungroup()


# Merging NONCCORE_Table with TOTALPROD_summary to add production numbers to density and biomass

NONCORE_SummaryTable <- left_join(NONCORE_Table, TOTALPROD_Summary, by = c("Site", "Genus"))

# Add a new column with the "biomass ± SD" format
NONCORE_SummaryTable <- NONCORE_SummaryTable %>%
  filter(Site %in% c("CRO", "HCN", "HUR", "RUT", "LLW", "LLC")) %>% # bc TOTALPROD has core sites too
  mutate(
    Biomass = paste0(Biomass.Final, " ± ", Biomass.SE),
    Density = paste0(Density.Final, " ± ", Density.SE),
    across(where(is.numeric), ~ round(.x, 2)) # Rounding
    ) %>%
  select(Genus,Site, SC.Category.x,Density, Biomass, Production.Uncorrected,CPI, Annual.Production,
         AnnualP.B, Daily.Growth
  )

library(dplyr)
library(purrr)
library(openxlsx)

# Save the data frame to an Excel file
write.xlsx(NONCORE_SummaryTable, file = "NONCORE_SummaryTable.xlsx", overwrite = TRUE)










# Proportional FFG 2P-----------------------------------------------------------

install.packages("rcartocolor")# Colorblind color schemes
library(rcartocolor)
display_carto_all()

# Define a custom palette with desired colors

my_colors = carto_pal(7, "Geyser") # to get hexcodes for geyser to assign FFGS to, for 
#consistency in graphs I'll use for SFS
my_colors

ffg_colors <- c("Scraper" = "#008080", 
                "Scraper - Coleoptera" = "#B4C8A8",
                "Shredder" = "#CA562C", 
                "Predator" = "#F6EDBD", 
                "Collector-Gatherer" = "#DE8A5A", 
                "Collector-Filterer" = "#70A494")  





install.packages("ggplot2")
library(ggplot2)


# Now to do actual proportions, scaling everything to 100% production for each site
TOTALPROD_Summary_site <- TOTALPROD_Summary %>%
  group_by(Site) %>%
  summarise(TOTALPROD_Summary = sum(Annual.Production)) # summing the annual production for each site

# Calculate proportions of total production for each FFG for each site
df_proportions_site <- TOTALPROD_Summary %>%
  left_join(TOTALPROD_Summary_site, by = "Site") %>%
  group_by(Site, FFG) %>%
  summarise(Proportion = sum(Annual.Production) / first(TOTALPROD_Summary)) # Summing annual production
#for each FFG for each site and dividing it by summed annual production for each site


# Plot with specific colors assigned to each FFG using hexadecimal codes
propgg_site = ggplot(df_proportions_site, aes(x = Site, y = Proportion, fill = FFG)) +
  geom_bar(stat = "identity") +
  labs(x = "Site", y = "Proportion of Total Production", fill = "FFGs") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign specific colors
  theme_minimal()

propgg_site 






# For SC Category

# Now to do actual proportions, scaling everything to 100% production for each SC Cat
TOTALPROD_Summary_cat <- TOTALPROD_Summary %>%
  group_by(SC.Category) %>%
  summarise(TOTALPROD_Summary = sum(Annual.Production)) # summing the annual production for each SC Cat

# Calculate proportions of total production for each FFG for each SC Cat
df_proportions_cat <- TOTALPROD_Summary %>%
  left_join(TOTALPROD_Summary_cat, by = "SC.Category") %>%
  group_by(SC.Category, FFG) %>%
  summarise(Proportion = sum(Annual.Production) / first(TOTALPROD_Summary)) # Summing annual production
#for each FFG for each site and dividing it by summed annual production for each SC Cat


# Plot with specific colors assigned to each FFG using hexadecimal codes
propgg_cat = ggplot(df_proportions_cat, aes(x = SC.Category, y = Proportion, fill = FFG)) +
  geom_bar(stat = "identity") +
  labs(x = "SC Category", y = "Proportion of Total Productio", fill = "FFGs") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign specific colors
  theme_minimal()


propgg_cat 


# Now, just core sites since CPI havent been adjusted yet for quarterly bugs
library(dplyr)


# Now to do actual proportions, scaling everything to 100% production for each site
COREPROD_Summary_site <- COREPROD_Summary %>%
  group_by(Site) %>%
  summarise(COREPROD_Summary = sum(Annual.Production)) # summing the annual production for each site

# Calculate proportions of total production for each FFG for each site
df_proportions_site <- COREPROD_Summary %>%
  left_join(COREPROD_Summary_site, by = "Site") %>%
  group_by(Site, FFG) %>%
  summarise(Proportion = sum(Annual.Production) / first(COREPROD_Summary)) # Summing annual production
#for each FFG for each site and dividing it by summed annual production for each site

# Plot with specific colors assigned to each FFG 
propgg_site = ggplot(df_proportions_site, aes(x = Site, y = Proportion, fill = FFG)) +
  geom_bar(stat = "identity") +
  labs(x = "Site", y = "Proportion of Total Production", fill = "FFGs") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  # Assign specific colors
  theme_minimal()

propgg_site 


# Production as absolute values----------------------

library(ggplot2)
library(dplyr)

# Summarize the data to calculate the total production per site and FFG
TOTALPROD_Summary_Sum <- TOTALPROD_Summary %>%
  group_by(Site, FFG, SC.Level) %>%
  summarise(
    Summed.Annual.Production = sum((Annual.Production), na.rm = TRUE),
    SC.Category = first(SC.Category)  # Include SC.Category for coloring
  )

COREPROD_Summary_Sum <- COREPROD_Summary %>%
  group_by(Site, FFG, SC.Level) %>%
  summarise(
    Summed.Annual.Production = sum((Annual.Production), na.rm = TRUE),
    SC.Category = first(SC.Category)  # Include SC.Category for coloring
  )



production_FFG <- ggplot(data = COREPROD_Summary_Sum, aes(x = Site, y = (Summed.Annual.Production))) +
  facet_wrap(~FFG, ncol = 3, nrow = 2) +  
  geom_col(aes(fill = FFG)) +  #geom_boxplot if wanting to show variation for all sites but with just coresites bars are fine
  ylab("ACSP (g/m2/yr)") +
  xlab("") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(), 
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"))

production_FFG

# Trying something linear------

# Create the linear plot
production_lineplot <- ggplot(data = TOTALPROD_Summary_Sum, aes(x = SC.Level, y =(Summed.Annual.Production), group = FFG, color = SC.Category)) +
  geom_line(size = 1.2) +  # Add lines for each FFG
  geom_point(size = 3) +   # Add points for emphasis
  facet_wrap(~FFG) +       # Facet by FFG
  ylab(expression(ACSP ~ (g/m^2/yr))) +
  xlab("") +
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

# Display the plot
production_lineplot



# Linear model with line of best fit
install.packages("ggpmisc")
library(ggpmisc)


production_lineplot_lm <- ggplot(
  data = TOTALPROD_Summary_Sum, # The sum of production for each FFG at each site
  aes(x = SC.Level, y = (Summed.Annual.Production), group = FFG, color = SC.Category)
) +
  geom_point(size = 3) +   # Add points for emphasis
  geom_smooth(method = "lm", se = TRUE, aes(group = FFG), linetype = "dashed") +  # Line of best fit
  stat_poly_eq(
    aes(label = paste(after_stat(eq.label))), 
    formula = y ~ x,  # Use x and y here
    parse = TRUE,
    size = 3,
    label.x = 0.1,  # Left alignment
    label.y = 0.1
  ) +  # Add R^2 annotations
  facet_wrap(~FFG) +       # Facet by FFG
  ylab(ACSP~ (g/m^2/yr)) +
  xlab("") +
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw() +
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )
# Display the plot
production_lineplot_lm



# Loess line

production_lineplot_loess <- ggplot(
  data = TOTALPROD_Summary_Sum, # The sum of production for each FFG at each site
  aes(x = SC.Level, y =(Summed.Annual.Production), group = FFG, color = SC.Category)
) + 
  geom_point(size = 3) +   # Add points for emphasis
  geom_smooth(
    method = "loess",       # Fit a LOESS smoother instead of a linear model
    se = TRUE,              # Display standard error around the curve
    aes(group = FFG),       # Separate smoothers by FFG group
    linetype = "dashed"     # Make the LOESS line dashed for distinction
  ) +  # Line of best fit
  facet_wrap(~FFG) +       # Facet by FFG
  ylab(expression(log(ACSP ~ (g/m^2/yr)))) +
  xlab("") +
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw() + 
  theme(
    axis.title = element_text(size = 23),
    axis.text = element_text(size = 15),
    panel.grid = element_blank(),
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 20),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "white", color = "white")
  )

# Display the plot
production_lineplot_loess

# Production across gradient-----------------------------------------------------


TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="EAS"] = "25"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="CRO"] = "72"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="HCN"] = "78"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="HUR"] = "387"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="FRY"] = "402"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="RUT"] = "594"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="LLW"] = "1119"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="LLC"] = "1242"
TOTALPROD_sum$SC.Level[TOTALPROD_sum$Site =="RIC"] = "1457"

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
TOTALPROD_sum$SC.Level <- factor(TOTALPROD_sum$SC.Level, levels = c("25","72","78","387","402","594","1119","1242","1457"))




production_boxplot=ggplot(data=TOTALPROD_sum,aes(x=Site,y=(Sum.Annual.Production)))+ 
  geom_point()+
  ylab(expression(ACSP(g/m^2/yr)))+
  xlab("")+
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw()+
  theme(axis.title=element_text(size=23),
        axis.text=element_text(size=15),
        panel.grid = element_blank(), 
        axis.line=element_line(),
        axis.text.x = element_text(angle = 90, hjust = 1,face="italic"),
        legend.position="top",
        legend.title = element_blank(),
        legend.text = element_text(size=20),
        legend.background = element_blank(),
        legend.key=element_rect(fill="white",color="white"))

production_boxplot # Log to see better




# Gamma games--------------------------------------------------------------------
str(TOTALPROD_Summary_Sum)

taxa_na_count <- TOTALPROD_Summary %>%
  filter(is.na(FFG)) %>%
  group_by(Genus)

taxa_zero_count_summary <- TOTALPROD_Summary_Sum %>%
  filter(Summed.Annual.Production < 0) %>%
  group_by(FFG) %>%
  summarize(count = n())  # Count how many times each Genus has zero production

str(TOTALPROD_Summary_Sum)

hist(TOTALPROD_Summary_Sum$Summed.Annual.Production)

library(car)
vif(glm(Annual.Production ~ SC.Level + FFG, data = TOTALPROD_Summary))

# Inverse link model
gamma_glm_inv <- glm(Summed.Annual.Production ~ SC.Level * FFG, 
                     family = Gamma(link = "inverse"), 
                     data = TOTALPROD_Summary_Sum)


inv_plot <- ggplot(data = TOTALPROD_Summary_Sum, aes(x = Summed.Annual.Production, 
                                                 y = fitted(gamma_glm_inv))) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(title = "Inverse Link: Observed vs Fitted", 
       x = "Observed Annual Production", 
       y = "Fitted Values")

inv_plot

inv_residuals <- residuals(gamma_glm_inv)
inv_residuals_plot <- ggplot(data = TOTALPROD_Summary_Sum, aes(x = fitted(gamma_glm_inv), y = inv_residuals)) + 
  geom_point() +
  geom_hline(yintercept = 0, color = "red", linetype = "dashed") +
  labs(title = "Inverse Link: Residuals vs Fitted", 
       x = "Fitted Values", 
       y = "Residuals")

inv_residuals_plot

# Trying to test different models against each other for AIC 

gamma_glm <- glm(Summed.Annual.Production ~ SC.Level, 
                 family = Gamma(link = "inverse"),  
                 data = TOTALPROD_Summary_Sum)

gamma_glm1 <- glm(Summed.Annual.Production ~ FFG, 
                 family = Gamma(link = "inverse"),  
                 data = TOTALPROD_Summary_Sum)

gamma_glm2 <- glm(Summed.Annual.Production ~ SC.Level * FFG, 
                  family = Gamma(link = "inverse"),  
                  data = TOTALPROD_Summary_Sum)

gamma_glm3 <- glm(Summed.Annual.Production ~ SC.Level + FFG, 
                  family = Gamma(link = "inverse"),  
                  data = TOTALPROD_Summary_Sum)

gamma_glmc <- glm(Summed.Annual.Production ~ 1, 
                 family = Gamma(link = "inverse"),  
                 data = TOTALPROD_Summary_Sum) # control

AIC(gamma_glmc, gamma_glm, gamma_glm1,gamma_glm2, gamma_glm3)



#for AICc
n=nrow(TOTALPROD_Summary_Sum)#or whatever the length of your df is

AICtab = AIC(gamma_glmc, gamma_glm, gamma_glm1,gamma_glm2, gamma_glm3)

#it would be nice to have AICC for a dataset this small
AICtab$k<-c(gamma_glmc$rank,gamma_glm$rank,gamma_glm1$rank,gamma_glm2$rank,gamma_glm3$rank)
AICtab$AICc<-AICtab$AIC+((2*AICtab$k*(AICtab$k+1))/(n-AICtab$k-1))
#now order from smallest to biggest
AICtab=AICtab[order(AICtab$AICc),]
#calculate delta AIC
AICtab$dAIC = AICtab$AICc - min(AICtab$AICc)
#you use the next two lines to get weights
AICtab$edel<-exp(-0.5*AICtab$dAIC)  #easier way to interpret deltaAIC
AICtab$wt<-AICtab$edel/sum(AICtab$edel)

print(AICtab)

# Extract AICc table as a data frame
aic_c <- as.data.frame(AICtab)

# Modify row names
rownames(aic_c) <- c("Annual Production ~ SC Level*FFG","Annual Production ~ SC","Annual Production ~ SC Level+FFG","Annual Production ~ FFG","Annual Production ~ 1")

# Print the modified data frame
print(aic_c)


install.packages("kableExtra")
library(kableExtra)

aic_c %>%
  knitr::kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)




# Quasi-likelihood 
quasi <- glm(Summed.Annual.Production ~ SC.Level * FFG, 
                     family = quasi(link = "log"), 
                     data = TOTALPROD_Summary_Sum)

quasi_plot <- ggplot(data = TOTALPROD_Summary_Sum, aes(x = Summed.Annual.Production, 
                                                     y = fitted(quasi))) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(title = "Quasi: Observed vs Fitted", 
       x = "Observed Annual Production", 
       y = "Fitted Values")

quasi_plot

quasi_residuals <- residuals(quasi)
quasi_residuals_plot <- ggplot(data = TOTALPROD_Summary_Sum, aes(x = fitted(quasi), y = quasi_residuals)) + 
  geom_point() +
  geom_hline(yintercept = 0, color = "red", linetype = "dashed") +
  labs(title = "Quasi: Residuals vs Fitted", 
       x = "Fitted Values", 
       y = "Residuals")

quasi_residuals_plot

# Trying to test different models against each other for quasi AIC 

qaic <- function(model) {
  dispersion <- summary(model)$dispersion  # Get dispersion parameter
  df <- length(coef(model))  # Number of parameters
  deviance <- summary(model)$deviance  # Use deviance instead of log-likelihood
  qaic_value <- deviance + 2 * df * dispersion
  return(qaic_value)
}


quasi_glm <- glm(Summed.Annual.Production ~ SC.Level, 
                 family = quasi(link = "log"),  
                 data = TOTALPROD_Summary_Sum)

quasi_glm1 <- glm(Summed.Annual.Production ~ FFG, 
                  family = quasi(link = "log"),  
                  data = TOTALPROD_Summary_Sum)

quasi_glm2 <- glm(Summed.Annual.Production ~ SC.Level * FFG, 
                  family = quasi(link = "log"),  
                  data = TOTALPROD_Summary_Sum)

quasi_glm3 <- glm(Summed.Annual.Production ~ SC.Level + FFG, 
                  family = quasi(link = "log"),  
                  data = TOTALPROD_Summary_Sum)

quasi_glmc <- glm(Summed.Annual.Production ~ 1, 
                  family = quasi(link = "log"),  
                  data = TOTALPROD_Summary_Sum) # control

qaic_c <- qaic(quasi_glmc)
qaic_ <-qaic(quasi_glm)
qaic1 <- qaic(quasi_glm1)
qaic2 <- qaic(quasi_glm2)
qaic3 <- qaic(quasi_glm3)
quasi_glmc; quasi_glm; quasi_glm1;quasi_glm2; quasi_glm3


# Effect sizes----------------------------------------------------------------

pr <- function(m) printCoefmat(coef(summary(m)),
                               digits=3,signif.stars=TRUE) 

#Get the estimates per group, rather than the differences
pr(lm1 <- lm(Summed.Annual.Production~SC.Level,data=TOTALPROD_Summary_Sum))

pr(lm2 <- lm(Summed.Annual.Production~SC.Category,data=TOTALPROD_Summary_Sum))

pr(lm3 <- lm(Summed.Annual.Production~FFG,data=TOTALPROD_Summary_Sum))


anova(lm1,lm2,lm3)

library(effects)

summary(allEffects(lm1))

summary(allEffects(lm2))

summary(allEffects(lm3))


#plot the effects 
plot(allEffects(lm1)) #High has highest biomass of the sites, RIC probably pulling it a bit

plot(allEffects(lm2))

plot(allEffects(lm3))




# Fit the ANOVA model
anova_model <- aov(Summed.Annual.Production ~ SC.Level, data = COREPROD_Summary_Sum)

# Apply Tukey's HSD test
tukey_result <- TukeyHSD(anova_model)

# View the results
summary(tukey_result)

# Plot the results
plot(tukey_result)
# Plot the results with customized settings
plot(tukey_result, 
     las = 1,  # Rotate axis labels for better readability
     col = "black",  # Set the color of the lines and points
     cex = 1.2,  # Increase the size of the points for better visibility
     pch = 16,  # Solid circles for the points
)


# Mixed Model-----------------------------------------------------------------
library("dpylr")
#install.packages("lme4")
library("lme4")
install.packages("lme4")  # Reinstall the package

#install.packages("glmmTMB")
library(glmmTMB)
install.packages("glmmTMB")
install.packages("Matrix")


#lets take a look at the data
library(ggplot2); theme_set(theme_bw())

q0 <- (ggplot(TOTALPROD_Summary_Sum, aes(SC.Level, Summed.Annual.Production, colour = SC.Category))
       + geom_point())  ## points only, use later

print(q0+geom_line())

#run models
lm1 <- lmer(Summed.Annual.Production~SC.Level + (1|FFG), data=TOTALPROD_Summary_Sum) 

summary(lm1)

library(lme4)
VarCorr(gamma_glmm)

library(car)

vif(glm(Summed.Annual.Production ~ SC.Level + FFG, 
        data = TOTALPROD_Summary_Sum, 
        family = Gamma(link = "log")))


gamma_glmm <- glmer(Summed.Annual.Production ~ SC.Level + (1 | FFG), 
                    data = TOTALPROD_Summary_Sum, 
                    family = Gamma(link = "log")) # Site is too highly correlated so can't use that as a random effect
summary(gamma_glmm)

performance::check_model(gamma_glmm)

overdisp_fun <- function(model) {
  rdf <- df.residual(model)
  rp <- residuals(model, type = "pearson")
  pearson_chisq <- sum(rp^2)
  ratio <- pearson_chisq / rdf
  return(ratio)
}


overdisp_fun(gamma_glmm) # close to 1, gamma is fine. if > 2 would want to do neg. binomial



# Non-linear mixed effects....not working atm
library(nlme)

# Example: Fitting a non-linear model with random effects
model <- nlme(Summed.Annual.Production ~ a * exp(-b * SC.Level), 
              data = TOTALPROD_Summary_Sum, 
              fixed = a + b ~ 1, 
              random = a ~ 1 | FFG, 
              start = c(a = 1, b = 0.1))

summary(model)

# NMDS---------------------------------------------------------------------------

library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
library(rcartocolor)

# This is a mess! Trying to figure out how to have months as symbols and abiotic factors

# Running the NMDS for all taxa
aggregated.biomass<- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + SC.Category + Sample.Month
                                    + Genus, data = SECPROD, FUN = mean, na.rm = TRUE)


biomass.nmds.all = aggregated.biomass%>% 
  pivot_wider(
    names_from = Genus, 
    values_from = Biomass.Area.Corrected,
  ) 

biomass.nmds.all <- biomass.nmds.all %>%
  arrange(Site, Sample.Month)

# Define the correct order for Sample.Month and Site
biomass.nmds.all <- as.data.frame(biomass.nmds.all)

# Define levels
sample_month_levels <- c("September", "October", "November", "December", "January", "February",
                         "March", "April", "May", "June", "July", "August")
site_levels <- c("EAS", "CRO", "HCN", "HUR", "FRY", "RUT", "RIC", "LLW", "LLC")

# Ensure columns are factors
biomass.nmds.all$Sample.Month <- factor(biomass.nmds.all$Sample.Month, levels = sample_month_levels)
biomass.nmds.all$Site <- factor(biomass.nmds.all$Site, levels = site_levels)

# Arrange the data frame by Sample.Month and Site
biomass.nmds.all <- biomass.nmds.all %>%
  arrange(Site, Sample.Month)


#  Rename the ID part of the matrix; take out the columns for streams, SC, season, genus
biomass.nmds.ID<- biomass.nmds.all[,-c(1:4)]


biomass.nmds.ID[is.na(biomass.nmds.ID)] <- 0


#  metaMDS integrates functions from several packages to perform NMDS.....
#  ....including'vegdist' from the vegan package

biomass.nmds.final <- metaMDS(biomass.nmds.ID, distance='bray', k=3, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)

# Gives average stress
biomass.nmds.final$stress

# Gives weights that different species hold in the axis
biomass.nmds.final$species

# Basic plot of all of the points
plot(biomass.nmds.final, display=c('sites', 'species'), choices=c(1,2), type='p')

nmds_species <- scores(biomass.nmds.final, display = "species")

nmds_sites <- scores(biomass.nmds.final, display = "sites")

# Scores
site.scores <- as.data.frame(scores(nmds_sites)) #Using the scores function from vegan to extract the site scores and convert to a data.frame
site.scores$site <- rownames(site.scores)# Add site column to dataframe
head(site.scores)

species.scores <- as.data.frame(scores(nmds_species)) 
species.scores$species <- rownames(species.scores)  
head(species.scores)


#Filtering based on top abundance
Biomass_Sums <- colSums(biomass.nmds.ID)
Biomass_Sums # Sums of all taxa

Biomass_CutOff <- 0# Don't want taxa with an abundance less than 150

TOP <- biomass.nmds.ID %>%
  select(where( ~ sum(.) >= Biomass_CutOff)) # Taxa with abundances greater than 150


# NMDS for top taxa only
TOPScores <-metaMDS(TOP, distance='bray', k=3, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)
TOPScores$stress

# TOP Scores

TOPGenera <- scores(TOPScores, display="species") # Scores for top species
TOPGenera <- as.data.frame(TOPGenera)
TOPGenera$species <- rownames(TOPGenera)  # create a column of species, from the rownames of TOPGenera


TOPsites <- scores(TOPScores, display="sites")
TOPsites <- as.data.frame(TOPsites)

rownames(TOPsites) <- c("EAS.September", "EAS.October", "EAS.November", "EAS.December", "EAS.January",
                        "EAS.Febrary", "EAS.March", "EAS.April","EAS.May", "EAS.June", "EAS.July", "EAS.August",
                        "CRO.October", "CRO.February", "CRO.May", "CRO.August","HCN.October", "HCN.February", "HCN.May",
                        "HCN.August","HUR.October", "HUR.February", "HUR.May", "HUR.August",
                        "FRY.September", "FRY.October", "FRY.November", "FRY.December", "FRY.January",
                        "FRY.Febrary", "FRY.March", "FRY.April","FRY.May", "FRY.June", "FRY.July", "FRY.August",
                        "RUT.October", "RUT.February", "RUT.May", "RUT.August",
                        "RIC.September", "RIC.October", "RIC.November", "RIC.December", "RIC.January",
                        "RIC.Febrary", "RIC.March", "RIC.April","RIC.May", "RIC.June", "RIC.July", "RIC.August",
                        "LLW.October", "LLW.February", "LLW.May", "LLW.August","LLC.October", "LLC.February", "LLC.May", "LLC.August"
                        ) # Change sites from numbers to categorical

TOPsites$site <- rownames(TOPsites) 


# Filter data for specific colors
ref <- subset(TOPsites, grepl("EAS", site))
mid <- subset(TOPsites, grepl("FRY", site))
high <- subset(TOPsites, grepl("RIC", site)) #if i want all sites


# Create polygons around points of specific colors
TOPPlot <- ggplot() +    
  geom_polygon(data = ref, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.3) +
  geom_polygon(data = mid, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.3) +
  geom_polygon(data = high, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.3) +
  geom_text(data = TOPGenera, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.5, vjust = 0.5, color = "grey70") +   
  geom_point(data = TOPsites, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = TOPsites, aes(x = NMDS1, y = NMDS2, label = site), size = 4, vjust = 0.5) +
  scale_colour_manual(values = c("CRO" = "#70A494", "EAS" = "#70A494", "HCN" = "#70A494",
                                 "HUR" = "#EDBB8A", "FRY" = "#EDBB8A", "RUT" = "#EDBB8A", 
                                 "RIC" = "#CA562C", "LLC" = "#CA562C", "LLW" = "#CA562C")) +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-2, 2)) +
  scale_y_continuous(name = "NMDS2", limits = c(-2, 3)) 

# With ellipses
TOPPlot <- ggplot() +    
  geom_mark_ellipse(data = ref, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.3) +
  geom_mark_ellipse(data = mid, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.3) +
  geom_mark_ellipse(data = high, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.3) +
  geom_text(data = TOPGenera, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.5, vjust = 0.5, color = "grey70") +   
  geom_point(data = TOPsites, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = TOPsites, aes(x = NMDS1, y = NMDS2, label = site), size = 4, vjust = 0.5) +
  scale_colour_manual(values = c("CRO" = "#70A494", "EAS" = "#70A494", "HCN" = "#70A494",
                                 "HUR" = "#EDBB8A", "FRY" = "#EDBB8A", "RUT" = "#EDBB8A", 
                                 "RIC" = "#CA562C", "LLC" = "#CA562C", "LLW" = "#CA562C")) +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-2, 2)) +
  scale_y_continuous(name = "NMDS2", limits = c(-2, 3)) 

# Display the plot
print(TOPPlot)






# Isolate REF sites for each quarterly---------

# Loading the appropariate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)


aggregated.ref.filter <- subset(SECPROD, 
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

aggregated.ref.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + Sample.Month 
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


#Filtering based on top biomass
Biomass_Sums <- colSums(biomass.ref.ID.filter)
Biomass_Sums # Sums of all taxa

Biomass_CutOff <- 0# Don't want taxa with an abundance less than 150


TOP <- biomass.ref.ID.filter %>%
  select(where( ~ sum(.) >= Biomass_CutOff)) # Taxa with abundances greater than 150


# NMDS for top taxa only
TOPScores <-metaMDS(TOP, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)
TOPScores$stress

# TOP Scores

TOPGenera <- scores(TOPScores, display="species") # Scores for top species
TOPGenera <- as.data.frame(TOPGenera)
TOPGenera$species <- rownames(TOPGenera)  # create a column of species, from the rownames of TOPGenera

TOPsites <- scores(TOPScores, display="sites")
TOPsites <- as.data.frame(TOPsites)
rownames(TOPsites) <- c("EAS.OCT", "EAS.FEB", "EAS.MAY", "EAS.AUG",
                        "CRO.OCT", "CRO.FEB", "CRO.MAY", "CRO.AUG",
                        "HCN.OCT", "HCN.FEB", "HCN.MAY", "HCN.AUG") # Change sites from numbers to categorical
TOPsites$site <- rownames(TOPsites) 

ref.oct <- subset(TOPsites, site %in% c("EAS.OCT", "CRO.OCT", "HCN.OCT"))
ref.feb <- subset(TOPsites, site %in% c("EAS.FEB", "CRO.FEB", "HCN.FEB"))
ref.may <- subset(TOPsites, site %in% c("EAS.MAY", "CRO.MAY", "HCN.MAY"))
ref.aug <- subset(TOPsites, site %in% c("EAS.AUG", "CRO.AUG", "HCN.AUG"))

# Filter data for specific colors

REF.NMDS <- ggplot() +    
  geom_mark_ellipse(data = ref.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.3) +
  geom_mark_ellipse(data = ref.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.3) +
  geom_mark_ellipse(data = ref.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.3) +
  geom_mark_ellipse(data = ref.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.3) +
  geom_text(data = TOPGenera, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.0, vjust = 0.5, color = "grey23") +   
  geom_point(data = TOPsites, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = TOPsites, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5) +
  scale_colour_manual(values = c(  "EAS.OCT" = "#70A494", "EAS.FEB" = "#EDBB8A", "EAS.MAY" = "#CA562C","EAS.AUG"="#F6EDBD",
                                   "CRO.OCT" = "#70A494", "CRO.FEB" = "#EDBB8A", "CRO.MAY" = "#CA562C","CRO.AUG"="#F6EDBD",
                                   "HCN.OCT" = "#70A494", "HCN.FEB" = "#EDBB8A", "HCN.MAY" = "#CA562C","HCN.AUG"="#F6EDBD",
                                   "HUR.OCT" = "#EDBB8A00", "HUR.FEB" = "#EDBB8A00", "HUR.MAY" = "#EDBB8A00","HUR.AUG" = "#EDBB8A00",
                                   "FRY.OCT" = "#EDBB8A00", "FRY.FEB" = "#EDBB8A00", "FRY.MAY" = "#EDBB8A00","FRY.AUG" = "#EDBB8A00",
                                   "RUT.OCT" = "#EDBB8A00", "RUT.FEB" = "#EDBB8A00", "RUT.MAY" = "#EDBB8A00","RUT.AUG" = "#EDBB8A00",
                                   "RIC.OCT" = "#CA562C00", "RIC.FEB" = "#CA562C00", "RIC.MAY" = "#CA562C00","RIC.AUG"=  "#EDBB8A00",
                                   "LLW.OCT" = "#CA562C00", "LLW.FEB" = "#CA562C00", "LLW.MAY" = "#CA562C00","LLW.AUG" = "#EDBB8A00",
                                   "LLC.OCT" = "#CA562C00", "LLC.FEB" = "#CA562C00", "LLC.MAY" = "#CA562C00","LLC.MAY" = "#EDBB8A00")) +
  coord_equal() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-3, 3)) +
  scale_y_continuous(name = "NMDS2", limits = c(-3, 3)) 

print(REF.NMDS)




# Isolate MID sites for each quarterly---------

# Loading the appropriate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)


aggregated.mid.filter <- subset(SECPROD, 
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

aggregated.mid.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + Sample.Month 
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


#Filtering based on top biomass
Biomass_Sums <- colSums(biomass.mid.ID.filter)
Biomass_Sums # Sums of all taxa

Biomass_CutOff <- 0# Don't want taxa with an abundance less than 150


TOP <- biomass.mid.ID.filter %>%
  select(where( ~ sum(.) >= Biomass_CutOff)) # Taxa with abundances greater than 150


# NMDS for top taxa only
TOPScores <-metaMDS(TOP, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)
TOPScores$stress

# TOP Scores

TOPGenera <- scores(TOPScores, display="species") # Scores for top species
TOPGenera <- as.data.frame(TOPGenera)
TOPGenera$species <- rownames(TOPGenera)  # create a column of species, from the rownames of TOPGenera

TOPsites <- scores(TOPScores, display="sites")
TOPsites <- as.data.frame(TOPsites)
rownames(TOPsites) <- c("FRY.OCT", "FRY.FEB", "FRY.MAY", "FRY.AUG",
                        "HUR.OCT", "HUR.FEB", "HUR.MAY", "HUR.AUG",
                        "RUT.OCT", "RUT.FEB", "RUT.MAY", "RUT.AUG") # Change sites from numbers to categorical
TOPsites$site <- rownames(TOPsites) 

mid.oct <- subset(TOPsites, site %in% c("FRY.OCT", "HUR.OCT", "RUT.OCT"))
mid.feb <- subset(TOPsites, site %in% c("FRY.FEB", "HUR.FEB", "RUT.FEB"))
mid.may <- subset(TOPsites, site %in% c("FRY.MAY", "HUR.MAY", "RUT.MAY"))
mid.aug <- subset(TOPsites, site %in% c("FRY.AUG", "HUR.AUG", "RUT.AUG"))

# Filter data for specific colors

MID.NMDS <- ggplot() +    
  geom_mark_ellipse(data = mid.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.3) +
  geom_mark_ellipse(data = mid.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.3) +
  geom_mark_ellipse(data = mid.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.3) +
  geom_mark_ellipse(data = mid.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.3) +
  geom_text(data = TOPGenera, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.0, vjust = 0.5, color = "grey23") +   
  geom_point(data = TOPsites, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = TOPsites, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5) +
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
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_x_continuous(name = "NMDS1", limits = c(-3, 3)) +
  scale_y_continuous(name = "NMDS2", limits = c(-3, 3)) 
print(MID.NMDS)






# Isolate HIGH sites for each quarterly---------

# Loading the appropriate packages
library(vegan) # vegan to calculate distance matrices
library(ggplot2) # ggplot for plotting
library(tidyverse) 
library(dplyr)
install.packages("ggforce")
library(ggforce)


aggregated.high.filter <- subset(SECPROD, 
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

aggregated.high.filter <- aggregate(Biomass.Area.Corrected ~ Site + SC.Level + Sample.Month 
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


#Filtering based on top biomass
Biomass_Sums <- colSums(biomass.high.ID.filter)
Biomass_Sums # Sums of all taxa

Biomass_CutOff <- 0# Don't want taxa with an abundance less than 150


TOP <- biomass.high.ID.filter %>%
  select(where( ~ sum(.) >= Biomass_CutOff)) # Taxa with abundances greater than 150


# NMDS for top taxa only
TOPScores <-metaMDS(TOP, distance='bray', k=2, trymax=20, autotransform=FALSE, pc=FALSE, plot=FALSE)
TOPScores$stress

# TOP Scores

TOPGenera <- scores(TOPScores, display="species") # Scores for top species
TOPGenera <- as.data.frame(TOPGenera)
TOPGenera$species <- rownames(TOPGenera)  # create a column of species, from the rownames of TOPGenera

TOPsites <- scores(TOPScores, display="sites")
TOPsites <- as.data.frame(TOPsites)
rownames(TOPsites) <- c("RIC.OCT", "RIC.FEB", "RIC.MAY", "RIC.AUG",
                        "LLW.OCT", "LLW.FEB", "LLW.MAY", "LLW.AUG",
                        "LLC.OCT", "LLC.FEB", "LLC.MAY", "LLC.AUG") # Change sites from numbers to categorical
TOPsites$site <- rownames(TOPsites) 

# Organizing the polygons
high.oct <- subset(TOPsites, site %in% c("RIC.OCT", "LLW.OCT", "LLC.OCT"))
high.feb <- subset(TOPsites, site %in% c("RIC.FEB", "LLW.FEB", "LLC.FEB"))
high.may <- subset(TOPsites, site %in% c("RIC.MAY", "LLW.MAY", "LLC.MAY"))
high.aug <- subset(TOPsites, site %in% c("RIC.AUG", "LLW.AUG", "LLC.AUG"))

# Filter data for specific colors

HIGH.NMDS <- ggplot() +    
  geom_mark_ellipse(data = high.oct, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#70A494", alpha = 0.3) +
  geom_mark_ellipse(data = high.feb, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#EDBB8A", alpha = 0.3) +
  geom_mark_ellipse(data = high.may, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#CA562C", alpha = 0.3) +
  geom_mark_ellipse(data = high.aug, aes(x = NMDS1, y = NMDS2, group = "site"), fill = "#F6EDBD", alpha = 0.3) +
  geom_text(data = TOPGenera, aes(x = NMDS1, y = NMDS2, label = species), alpha = 0.0, vjust = 0.5, color = "grey23") +   
  geom_point(data = TOPsites, aes(x = NMDS1, y = NMDS2, color = site), size = 3) + 
  geom_text(data = TOPsites, aes(x = NMDS1, y = NMDS2, label = site), size = 2, vjust = 0.5) +
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
  scale_x_continuous(name = "NMDS1", limits = c(-3, 3)) +
  scale_y_continuous(name = "NMDS2", limits = c(-3, 3)) 

print(HIGH.NMDS)




