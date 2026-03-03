# |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de


# ----------------------------------------------------------
# description: Script using BRA_H13_C200_W2 data (Secd Forest from MapBiomas) 
# ----------------------------------------------------------

######################################
#### Script to start a MAgPIE run ####
######################################

library(gms)
library(lucode2)
library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

#start MAgPIE run
source("config/default.cfg")

# Change the title
cfg$title <- "BRA_vSecdForest_NDC"

# Input data files to be used for SecdForest data analysis
cfg$input <- c(regional    = "rev4.129.9001NZB_BRA_H13_C200_W2_SwpFun_5638d5dc_magpie.tgz",
               cellular    = "rev4.129.9001NZB_BRA_H13_C200_W2_SwpFun_5638d5dc_22226bc0_cellularmagpie_c200_MRI-ESM2-0-ssp245_lpjml-8e6c5eb1_clusterweight-917fb741.tgz",
               validation  = "rev4.129.9001NZB_BRA_H13_C200_W2_SwpFun_5638d5dc_92e02314_validation.tgz",
               additional  = "additional_data_rev4.63.tgz",
               calibration = "calibration_BRA_H13_C200_W2_SwpFun_Feb26.tgz")

cfg$gms$s14_use_yield_calib <- 1

# Change time step settings
cfg$gms$c_timesteps <- "5year2050"

# Changing policy
cfg$gms$c32_aff_policy <- "ndc"             
cfg$gms$c35_ad_policy <- "ndc"             
cfg$gms$c35_aolc_policy <- "ndc"          


start_run(cfg,codeCheck = FALSE)
