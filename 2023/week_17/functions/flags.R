here::i_am("week_17/functions/flags.R")
#### Workspace setup ####
base::library(png)
#### Flag List ####
# This saves flag png's 
# into a list. 
# flags
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
# flags list
flag_list <- list(
  uk, kenya, usa,
  swi, ethi, nor,
  ire, mex, germany,
  port, italy, can,
  sweden, japan, fran,
  denmark, aus, pol,
  neth, mor, spain,
  su, china, bel)
# save
saveRDS(flag_list, file="week_17/data/flag_list.RData")
