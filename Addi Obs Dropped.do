/* 6 B, BLM office */

use "\\bfs.coba.unr.edu\gradhome\sourikb\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta", clear

drop if Contact_Office_Name=="Southern Nevada"|Contact_Office_Name=="GBNP"
**100 observations deleted

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta saved

sort Project_Start_Year Species

drop if Species=="Agropyron desertorum (Fisch. ex Link) J.A. Schultes - Nordan" & Bulk_Lbs_Seed_Species==532.5
drop if Species=="Elymus elymoides (Raf.) Swezey" & Treatment_ID=="Yomba_Fuel_Reduction_2005_14"
drop if Species=="Hesperostipa comata (Trin. & Rupr.) Barkworth" & Treatment_ID=="Yomba_Fuel_Reduction_2005_14"
drop if Species=="Pleuraphis jamesii Torr.  - Viva" & Treatment_ID=="Yomba_Fuel_Reduction_2005_14"
drop if Species=="Poa secunda J. Presl." & Treatment_ID=="Yomba_Fuel_Reduction_2005_14"
drop if Species=="Sphaeralcea coccinea (Nutt.) Rydb. " & Treatment_ID=="Yomba_Fuel_Reduction_2005_14"
drop if Species=="Agropyron fragile (Roth) Candargy" & Treatment_ID=="Lemmon_And_Hungry_Valley_Fuels_Treatment_JC75_4"
drop if Species=="Bassia prostrata (L.) A.J. Scott" & Treatment_ID=="Lemmon_And_Hungry_Valley_Fuels_Treatment_JC75_6"
drop if Species=="Medicago sativa L. - Ladak" & Treatment_ID=="Poito_Fire_2006_4"
drop if Species=="Purshia tridentata (Pursh) DC. " & Treatment_ID=="West_Fork_Wildfire_2007_7"
drop if Species=="Elymus elymoides (Raf.) Swezey ssp. elymoides" & Treatment_ID=="Red_Rock_Wildfire_2009_7"
drop if Species=="Poa secunda J. Presl" & Treatment_ID=="Red_Rock_Wildfire_2009_7"
drop if Species=="Wyethia mollis A. Gray" & Treatment_ID=="Red_Rock_Wildfire_2009_7"
drop if Species=="Achillea millefolium L. " & Treatment_ID=="Holloway_Fire_2012_12"
drop if Species=="Bassia prostrata (L.) A.J. Scott" & Treatment_ID=="Holloway_Fire_2012_6"
drop if Species=="Elymus elymoides (Raf.) Swezey ssp. elymoides" & Treatment_ID=="Washoe_Wildfire_2012_2"
drop if Species=="Linum perenne L.   - Appar" & Treatment_ID=="Sampson_Wildfire_2014_7"



save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta saved


*************************************************************************************************************************************************
*************************************************************************************************************************************************
**EXAMPLE: ONLY FOR REFERENCE FOR PROF. TAYLOR
keep if Species=="Penstemon palmeri Gray" | Species=="Pleuraphis jamesii Torr.  - Viva"
drop in 14/48
egen tag=tag(Project_Name StandardizedCommon)
list Project_Name StandardizedCommon tag
egen distinct=total(tag), by(StandardizedCommon) 
list Project_Name StandardizedCommon tag distinct


/* 6 A, Years (Projects Starts Years) */

**************************************************************************************************************************************************
**************************************************************************************************************************************************
drop if Project_Start_Year==2014 | Project_Start_Year==2015

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\07.02.2018\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\07.02.2018\Final Merged Dataset & Treatment Information (M&U2).dta saved

**TO RE-CREATE FIGURE 2 ON PAGE 57 OF 'NATURAL AREAS JOURNAL'.
**KEY VARIABLES: STANDARDIZEDCOMMON, DISTINCT, TOTAL_PLS_LBS_OF_SEED

**To find out the number of projects in which each "StandardizedCommon" has been used.
egen tag=tag(Project_Name StandardizedCommon)
egen distinct=total(tag), by(StandardizedCommon) 

label variable distinct "Number of projects which have used each of the StandardizedCommon respectively"

**To generate a new variable with either PLS/Bulk needed to calculate Total PLS.
gen PLS_Bulk=PLS_Lbs_Seed_Species
replace PLS_Bulk=Bulk_Lbs_Seed_Species if mi(PLS_Lbs_Seed_Species)

**To rank the "StandardizedCommon" based on the number of projects they have been used in.
gsort -distinct

**To find Total_PLS_lbs_of_seed by "StandardizedCommon"
egen Total_PLS_lbs_of_seed=total(PLS_Bulk), by(StandardizedCommon)
label variable Total_PLS_lbs_of_seed "Number of PLS pounds seeded for each StandardizedCommon"

tabstat distinct Total_PLS_lbs_of_seed, by(StandardizedCommon)

**To find out the total number of projects in the master dataset.
tabulate Project_Name
return list
*r(r)=240, so total number of projects is 240, when 2014 and 2015 are still NOT dropped**.

**r(r) = 230 after dropping years 2014 and 2015, so total number of projects in this case is 230.

**Percentages of projects are calculated in Excel file "Final Merged Dataset & Treatment Information (M&U1).xls"

**TO RE-CREATE FIGURE 1 ON PAGE 56 OF 'NATURAL AREAS JOURNAL'.
**KEY VARIABLES: FUNCTIONALGROUP, DISTINCT2, TOTAL_PLS_LBS_OF_SEED2

**Replacing "FunctionalGroup" of "Unclassifiable" Species
replace FunctionalGroup = "Exotic Perennial Grass" if Species=="Agropyron Gaertn."
replace FunctionalGroup = "Exotic Perennial Forb" if Species=="Arabis holboellii Hornem."
replace FunctionalGroup = "Native Perennial Forb" if Species=="Astragalus L."
replace FunctionalGroup = "Native Perennial Forb" if Species=="Caulanthus crassicaulis (Torr.) S. Watson"
replace FunctionalGroup = "Native Perennial Forb" if Species=="Chaenactis douglasii (Hook.) Hook. & Arn."
replace FunctionalGroup = "Native Perennial Forb" if Species=="Gaillardia Foug."
replace FunctionalGroup = "Native Perennial Grass" if Species=="Jarava Ruiz & Pav."
replace FunctionalGroup = "Exotic Forb" if Species=="Kochia Roth"
replace FunctionalGroup = "Native Perennial Forb" if Species=="Malacothrix DC."
replace FunctionalGroup = "Native Perennial Forb" if Species=="Penstemon Schmidel"
replace FunctionalGroup = "Exotic Perennial Grass" if Species=="Poa L."
replace FunctionalGroup = "Exotic Perennial Grass" if Species=="Psathyrostachys Nevski"
replace FunctionalGroup = "Native Shrub" if Species=="Purshia DC. ex Poir."
replace FunctionalGroup = "Native Shrub" if Species=="Salix L."
replace FunctionalGroup = "Native Perennial Forb" if Species=="Senecio multilobatus Torr. & A. Gray ex A. Gray"
replace FunctionalGroup = "Native Perennial Grass" if Species=="Trifolium L."
drop if Species=="Rice Hulls"

**To find out the number of projects in which each "FunctionalGroup" has been used.
egen tag1=tag(Project_Name FunctionalGroup)
egen distinct1=total(tag1), by(FunctionalGroup) 

label variable distinct1 "Number of projects which have used each of the FunctionalGroup respectively"

**To rank the "FunctionalGroup" based on the number of projects they have been used in.
gsort -distinct1

**To find Total_PLS_lbs_of_seed by "FunctionalGroup"
egen Total_PLS_lbs_of_seed1=total(PLS_Bulk), by(FunctionalGroup)
label variable Total_PLS_lbs_of_seed1 "Number of PLS pounds seeded for each FunctionalGroup"

tabstat distinct1 Total_PLS_lbs_of_seed1, by(FunctionalGroup)

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta saved

************************************************************************************************************************************************************
