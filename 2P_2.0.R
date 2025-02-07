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


# Cleaning up data sheet typos--------------------------------------------------

SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Stylogomphurus", "Stylogomphus", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Gomphurus", "Gomphus", Genus))
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
  mutate(Genus = ifelse(Genus == "Ephemerellidae", "Attenella", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Heptageniidae", "Stenonema", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Chironomidae", "Orthocladine", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Leptophlebiidae", "Paraleptophlebiidae", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Paraleptophlebiidae", "Paraleptophlebia", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Capniidae", "Paracapnia", Genus))
SECPROD <-  SECPROD %>%
  mutate(Genus = ifelse(Genus == "Leuctridae", "Leuctra", Genus))
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
    #Biomass != 0,  # Filter out rows where Biomass is zero
    !str_detect(Genus, "Hydrachnia|Circulionidae|Oligochaeta|Stagnicola|Terrestrial|Pupa|Adult|\\(A\\)|\\(terrestrial\\)")  # Exclude rows with "Pupa", "Adult", or "(A)", Stagnicola, etc.
  )



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
      Genus == "Chauloides" ~ (0.0062 * (Length ^ 2.691)) * Abundance,
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
  

sum(is.na(SECPROD$Biomass)) # checking for NAs, should be zero!
sum(is.na(SECPROD$Biomass.mg))

SECPROD %>%
  filter(is.na(Biomass.mg)) %>%
  select(Genus) %>%
  distinct()




SECPROD <- SECPROD %>%
  select(-Biomass)  # Remove Biomass (orignial data entry) 

# Finally, let's add a new Density column, then use it to correct biomass by area
SECPROD <- SECPROD %>% 
  mutate(Density = Abundance / 0.0929) %>% # Making density column
  mutate(Biomass.g = Biomass.mg / 1000) %>% # Biomass was in mg bc of the length mass regressions, divide by 1000 to get to g
  mutate(Biomass.Area.Corrected = Biomass.g*Density) # Making biomass.area.corrected column
# Saving as a CSV for geom_ridge code
write.csv(SECPROD, "SEC_PROD.csv", row.names = FALSE)





# Adding FFGs------------------------------------------------------------------


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


SECPROD %>%
  filter(is.na(FFG)) %>%
  select(Genus) %>%
  distinct()

# Lookng at biomass across the year-------------------------------------------

# For color scheme
install.packages("ggplot2")
library(ggplot2)
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
  summarise(sum.biomass=sum(Biomass.Area.Corrected,na.rm=TRUE))  %>% #Summing the replicates
  
  group_by(Sample.Month,SC.Category,SC.Level,Site,FFG ) %>% 
  summarise(mean.biomass = sum(sum.biomass, na.rm = TRUE) / 5)
  #summarise(mean.biomass=mean(sum.biomass,na.rm=FALSE))

# Yearly summed biomass
biomass_sum <- biomass %>%
  group_by(Site) %>%
  summarise(sum.biomass = sum(mean.biomass, na.rm = TRUE), .groups = 'drop') # sum monthly averages


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
FFGgplot <- ggplot(data = biomassmonthly, aes(x = Sample.Month, y = (mean.biomass))) +
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

print(FFGgplot) 


# Now, SC on x
FFGgplot1 <- ggplot(data = biomassmonthly, aes(x = SC.Level, y = (mean.biomass))) +
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




# Okay, I want to run the same thing but make a new FFG category for scrapers that are coleoptera---------------

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
FFGgplot1 <- ggplot(data = biomassmonthly, aes(x = SC.Level, y = (mean.biomass))) +
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
  filter(Genus == "Leuctra", Site == "EAS") %>%        # Filter for Leuctra genus
  arrange(factor(Sample.Month, levels = c("September", "October", "November", "December",
                                          "January", "February", "March", "April", "May", "June", "July", "August")), Sample.Month) %>%                   # Arrange by Length in ascending order
  mutate(Density = Abundance / 0.0929) # Add new column for Density

# View the result
SECPROD_leuctra.EAS


# First, sum the density and biomass for each replicate for each size class
# aka 1 density and biomass value for each length/stream/month
# don't divide by abundance bc we already accounted for abundance when calculating density (note to self bc i got confused earlier)
# Add a individual mass column that takes the average biomass / avg. density and then deletes the 
# biomass column because we don't need it anymore

leuctra.EAS <- SECPROD_leuctra.EAS %>% 
  group_by(Site, Genus, Sample.Month, Sample.Date, Replicate, Length) %>% 
  summarise(
    Sum.Density = sum(Density, na.rm = TRUE),  # Summing density for each replicate for each length class
    Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE)   # Summing biomass for each replicate for each length class
  ) %>%
  mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%  # Calculating individual mass
  select(-Sum.Biomass) %>%   # Removing Sum.Biomass column after calculating individual mass
  # Note to self: this is the same df as SECPROD_leuctra.EAS bc except that
  # it makes the individual mass column. The SECPROD df is already arranged with
  # each length class in each rep. I keep this code though for transparency of 
  # how the data should be handled and avoiding confusing people (me) by leaving it out
  
  # Now, average replicates for each length class for each stream/month
  # Note to self: you took sum of each replicate's density and mass first and now are averaging them...you get confused by this sometimes
  group_by(Site, Genus,Sample.Month, Sample.Date, Length) %>%
  summarise(
   Mean.Density = sum(Sum.Density, na.rm = TRUE) / 5,  # Averaging the summed density by Sample.Month
   Mean.Individual.Mass = sum(Individual.Mass, na.rm = TRUE) / 5 ) %>%# Averaging the individual mass by Sample.Month


  #  Mean.Density = mean(Sum.Density, na.rm = TRUE),  # improper handling of replicates
    # Mean.Individual.Mass = mean(Individual.Mass, na.rm = TRUE) ) %>% 
  
  # Lastly, summing the density and individual mass for all length classes across the year, since the replicates for each site
  # have been averaged in previous step. This step gives up the total across the year
  # So, don't want to be categorized by site descriptor(s), just length class
  # Note to self: we summed the reps for each stream for each length class. Then, averaged the reps to
  # get one density and individual mass value for each length class for each stream. Now, we are
  # summing across the whole year for each size class. Stop gaslighting yourself this makes sense
  group_by(Genus, Length, Site) %>% 
  summarise(
    Density.Final = mean(Mean.Density, na.rm = TRUE),
    Individual.Mass.Final = mean(Mean.Individual.Mass, na.rm = TRUE),
  ) %>% 
  arrange(Length)



# Plot a bell curve (density plot) for Length vs Biomass after averaging things...just for fun
ggplot(leuctra.EAS, aes(x = Length, y = Individual.Mass.Final)) +
  geom_point(alpha = 0.5) +  # Points to show individual values
  geom_smooth(method = "loess", color = "blue", se = FALSE) +  # Smoothed line to approximate a bell curve
  labs(x = "Length", y = "Individual Mass", title = "Biomass Distribution by Length for Leuctra Taxa") +
  theme_minimal() # Doesn't look too bad 








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
      Sum.Density = sum(Density, na.rm = TRUE), # Sum Density per replicate
      Sum.Biomass = sum(Biomass.Area.Corrected, na.rm = TRUE) # Sum Biomass
    )%>%
    
    # Calculate Individual Mass
    mutate(Individual.Mass = Sum.Biomass / Sum.Density) %>%
    
    
    # Group by Site, Genus, Sample.Month, Sample.Date, Length
    group_by(Site, Genus, Sample.Month, Sample.Date, Length) %>%
    summarise(
      Mean.Density = sum(Sum.Density, na.rm = TRUE) / 5,  
      Mean.Individual.Mass = sum(Individual.Mass, na.rm = TRUE) / 5  # Ensuring that even if a taxa doesn't have every length in every rep (which they don't, it will be averaged correctly)
    )%>%
  
    
    # Group by Genus, Length, Site to calculate final densities and biomass per genus
    group_by(Genus, Length, Site) %>%
    summarise(
      Density.Final = mean(Mean.Density, na.rm = TRUE),  # Final Density across the year
      # CHANGED TO MEAN JUST TO TRY
      Individual.Mass.Final = mean(Mean.Individual.Mass, na.rm = TRUE)  # Final Mass across the year
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
      Mean.Density = sum(Sum.Density, na.rm = TRUE) / 5,  
      Mean.Individual.Mass = sum(Individual.Mass, na.rm = TRUE) / 5  # Ensuring that even if a taxa doesn't have every length in every rep (which they don't, it will be averaged correctly)
    )%>%
    
    # Group by Genus, Length, Site to calculate final densities and biomass per genus
    group_by(Genus, Length, Site) %>%
    summarise(
      Density.Final = mean(Mean.Density, na.rm = TRUE),  # Final Density across the year
      Individual.Mass.Final = mean(Mean.Individual.Mass, na.rm = TRUE)  # Final Mass across the year
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
      Mean.Density = sum(Sum.Density, na.rm = TRUE) / 5,  
      Mean.Individual.Mass = sum(Individual.Mass, na.rm = TRUE) / 5  # Ensuring that even if a taxa doesn't have every length in every rep (which they don't, it will be averaged correctly)
    )%>%
    
    # Group by Genus, Length, Site to calculate final densities and biomass per genus
    group_by(Genus, Length, Site) %>%
    summarise(
      Density.Final = mean(Mean.Density, na.rm = TRUE),  # Final Density across the year
      Individual.Mass.Final = mean(Mean.Individual.Mass, na.rm = TRUE)  # Final Mass across the year
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







# Combining df of production for EAS, FRY, RIC----------------------------------
EAS_genus_2P_Final_df <- bind_rows(EAS_genus_2P_Final, .id = "source")
FRY_genus_2P_Final_df <- bind_rows(FRY_genus_2P_Final, .id = "source")
RIC_genus_2P_Final_df <- bind_rows(RIC_genus_2P_Final, .id = "source")

# Core sites with everything including length by length values
CORE_PROD_lengths<- rbind(EAS_genus_2P_Final_df, FRY_genus_2P_Final_df, RIC_genus_2P_Final_df)

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
  
  filter(Density.Final > 0) %>% # this will fix if still some zeroes from the SECPROD FRY weirdness
  
  mutate(across(where(is.numeric), ~ round(.x, 4)))%>% # Rounding numbers
  
  
  ungroup()


# Merging Core_Table with COREPROD_summary to add production numbers to density and biomass

CORE_SummaryTable <- left_join(CORE_Table, COREPROD_Summary, by = c("Site", "Genus"))

# Add a new column with the "biomass ± SE" format
CORE_SummaryTable <- CORE_SummaryTable %>%
  mutate(
    Biomass = paste0(Biomass.Final, " ± ", Biomass.SE),
    Density = paste0(Density.Final, " ± ", Density.SE),
    across(where(is.numeric), ~ round(.x, 2))) %>%
  select(Genus,Site, SC.Category.x,Density, Biomass, Production.Uncorrected,CPI, Annual.Production,
         AnnualP.B, Daily.Growth
  )

library(dplyr)
library(purrr)
library(openxlsx)

# Save the data frame to an Excel file
write.xlsx(CORE_SummaryTable, file = "CORE_SummaryTable.xlsx", overwrite = TRUE)



# Proportional FFG 2P-----------------------------------------------------------

install.packages("rcartocolor")# Colorblind color schemes
library(rcartocolor)
display_carto_all()
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

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

# Just core sites since CPI havent been adjusted yet for quarterly bugs



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


# Production as absolute values------------------------------------------------

library(ggplot2)
library(dplyr)

# Summarize the data to calculate the total production per site and FFG

COREPROD_Summary_Sum <- COREPROD_Summary %>%
  group_by(Site, FFG, SC.Level) %>%
  summarise(
    Summed.Annual.Production = sum((Annual.Production), na.rm = TRUE),
    SC.Category = first(SC.Category)  # Include SC.Category for coloring
  )



production_FFG <- ggplot(data = COREPROD_Summary_Sum, aes(x = Site, y = (Summed.Annual.Production))) +
  facet_wrap(~FFG, ncol = 3, nrow = 2) +  
  geom_col(aes(fill = FFG)) +  #geom_boxplot if wanting to show variation for all sites but with just coresites bars are fine
  ylab("Secondary Production (g/m2/yr)") +
  xlab("") +
  scale_fill_manual(values = ffg_colors, name = "FFG") +  
  theme_bw() +
  theme(
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 10),
    panel.grid = element_blank(), 
    axis.line = element_line(),
    axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"))

production_FFG

# Trying something linear--------------------------------------------------------

# Linear model with line of best fit
install.packages("ggpmisc")
library(ggpmisc)


production_lineplot_lm <- ggplot(
  data = COREPROD_Summary_Sum, # The sum of production for each FFG at each site
  aes(x = SC.Level, y = (Summed.Annual.Production), group = FFG, color = SC.Category)
) +
  geom_point(size = 3) +   # Add points for emphasis
  geom_smooth(method = "lm", se = TRUE, aes(group = FFG), linetype = "dashed") +  # Line of best fit
  stat_poly_eq(
    aes(label = paste(after_stat(eq.label))), # use different function to get p-value from model output
    formula = y ~ x,  # Use x and y here
    parse = TRUE,
    size = 3,
    label.x = 0.1,  # Left alignment
    label.y = 0.1
  ) +  # Add R^2 annotations
  facet_wrap(~FFG) +       # Facet by FFG
  ylab(SecondaryProduction~ (g/m^2/yr)) +
  xlab("") +
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw() +
  theme(
    axis.title = element_text(size = 15),
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

# may have to make model and run summary to get p-values and r2





# Loess line

production_lineplot_loess <- ggplot(
  data = COREPROD_Summary_Sum, # The sum of production for each FFG at each site
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
  ylab(expression(SecondaryProduction ~ (g/m^2/yr))) +
  xlab("") +
  scale_colour_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +
  theme_bw() + 
  theme(
    axis.title = element_text(size = 15),
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


# Total Production across gradient-----------------------------------------------------


COREPROD_sum$SC.Level[COREPROD_sum$Site =="EAS"] = "25"
COREPROD_sum$SC.Level[COREPROD_sum$Site =="FRY"] = "402"
COREPROD_sum$SC.Level[COREPROD_sum$Site =="RIC"] = "1457"

COREPROD_sum$SC.Category[COREPROD_sum$Site =="EAS"] = "REF"
COREPROD_sum$SC.Category[COREPROD_sum$Site =="FRY"] = "MID"
COREPROD_sum$SC.Category[COREPROD_sum$Site =="RIC"] = "HIGH"



COREPROD_sum$Site <- factor(COREPROD_sum$Site, levels = c("EAS","FRY","RIC"))
COREPROD_sum$SC.Category <- factor(COREPROD_sum$SC.Category, levels = c("REF","MID","HIGH"))
COREPROD_sum$SC.Level <- factor(COREPROD_sum$SC.Level, levels = c("25","402","1457"))





# Summarize the data to calculate sum of production by Site (if not done already)
library(dplyr)


# Create the bar plot with the corrected fill aesthetic
production_barplot = ggplot(data = COREPROD_sum, aes(x = SC.Level, y = Sum.Annual.Production, fill = SC.Category)) +
  geom_bar(stat = "identity") +  # Use stat="identity" to plot actual data values
  ylab(expression(SecondaryProduction ~ (g/m^2/yr))) +  # Label for the y-axis
  xlab("") +
  scale_fill_manual(values = c("REF" = "#70A494", "MID" = "#DE8A5A", "HIGH" = "#CA562C")) +  # Fix: Use scale_fill_manual for fill color
  theme_bw() + 
  theme(axis.title = element_text(size = 15),
        axis.text = element_text(size = 15),
        panel.grid = element_blank(),
        axis.line = element_line(),
        axis.text.x = element_text(angle = 90, hjust = 1, face = "italic"),
        legend.position = "top",
        legend.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.background = element_blank(),
        legend.key = element_rect(fill = "white", color = "white"))

# Display the plot
production_barplot







