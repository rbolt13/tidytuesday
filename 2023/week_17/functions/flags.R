#### Week 17 - London Marathon ####
# Title: Flags
# Date: May 18, 2023
# Description: This file loads in 23
# flags and then saves them as an 
# RDS list. 
here::i_am("2023/week_17/functions/flags.R")

#### Load Packages ####
# png: format png. 
base::library(png)

#### Load Flags ####
uk <-  readPNG("flags/uk.png")   
kenya <-  readPNG("flags/kenya.png") 
usa <-  readPNG("flags/usa.png")
swi <-  readPNG("flags/switzerland.png")
ethi <-  readPNG("flags/ethiopia.png")
nor <-  readPNG("flags/norway.png")
ire <-  readPNG("flags/ireland.png")
mex <-  readPNG("flags/mexico.png")
germany <-  readPNG("flags/germany.png") 
port <-  readPNG("flags/portugal.png")
italy <-  readPNG("flags/italy.png")
can <-  readPNG("flags/canada.png")
sweden <-  readPNG("flags/sweden.png")
japan <-  readPNG("flags/japan.png")
fran <-  readPNG("flags/france.png")
denmark <-  readPNG("flags/denmark.png")
aus <-  readPNG("flags/australia.png")
pol <- readPNG("flags/poland.png")
neth <- readPNG("flags/netherlands.png")
mor <- readPNG("flags/morocco.png")
spain <- readPNG("flags/spain.png")
su <- readPNG("flags/soviet_union.png")
china <- readPNG("flags/china.png")
bel <- readPNG("flags/belgium.png")

#### Flag List ####
flag_list <- list(
  uk, kenya, usa,
  swi, ethi, nor,
  ire, mex, germany,
  port, italy, can,
  sweden, japan, fran,
  denmark, aus, pol,
  neth, mor, spain,
  su, china, bel)

#### Save Flags ####
saveRDS(flag_list, file="week_17/data/flag_list.RData")
