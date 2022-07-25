**IMPORT EXCEL WORKSHEET "LTDL & Beth (Merged" IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls' TO CONVERT TO .DTA AFTER MAKING RELEVANT CHANGES LISTED BELOW:

import excel "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Michael Taylor\Excel Files, .dta Files\LTDL_NV_Seeding_Trt_List_10-20-2016.xlsx", sheet("LTDL & Beth (Me
> rged)") firstrow
drop _merge
duplicates list
**0 observations are duplicates
list if mi(Species)
drop if mi(Species)
drop id 

**SUSPICION OF DUPLICATE OBSERVATIONS WHICH IS NOT ALLOWING m:1 MERGE
duplicates tag Species, gen(flag)
browse if flag

**Duplicates recognized and dropped. 
drop if Species=="Aristida purpurea Nutt." & Common=="Purple Three Awn"
drop if Species=="Elymus lanceolatus (Scribn. & J.G. Sm.) Gould" & Common=="thickspike wheatgrass"
drop if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve" & Common=="basin wildrye"
drop if Species=="Thinopyrum intermedium (Host) Barkworth & D.R. Dewey" & Common=="Pubescent Wheatgrass"

**SAVED AS "LTDL & Beth (Merged & Refined).dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\LTDL & Beth (Merged & Refined).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\LTDL & Beth (Merged & Refined).dta saved
clear

****IMPORT EXCEL WORKSHEET "SEEDED SPECIES" IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls' TO CONVERT TO .DTA FORMAT AND USE IT AS 'MASTER DATASET':
import excel "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Michael Taylor\Excel Files, .dta Files\LTDL_NV_Seeding_Trt_List_10-20-2016.xlsx", sheet("Seeded Species"
> ) firstrow

**SAVED MASTER DATASET AS "LTDL (Seeded Species).dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\LTDL (Seeded Species).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\LTDL (Seeded Species).dta saved

**m:1 MERGE 'MASTER DATASET' "LTDL (Seeded Species).dta" WITH 'USING DATASET' "LTDL & Beth (Merged & Refined).dta" 
merge m:1 Species using "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\LTDL & Beth (Merged & Refined).dta"
drop _merge

**SAVED MERGED DATASET AS "Final Merged Dataset.dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset.dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset.dta saved

label variable Dummy "level of judgement used to fill the missing StandardizedSpecies & StandardizedCommon in LTDL & Beth (Merged)"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset.dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset.dta saved
clear
*********************************************************************************************************************************************************************

**MERGE "FINAL MERGED DATASET.DTA" WITH "TREATMENT INFORMATION" WORKSHEET IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls'

**IMPORT "TREATMENT INFORMATION" WORKSHEET IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls' TO STATA TO CONVERT TO .DTA FORMAT:
import excel "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Michael Taylor\Excel Files, .dta Files\LTDL_NV_Seeding_Trt_List_10-20-2016.xlsx", sheet("Treatment Infor
> mation") firstrow

**SAVED AS "Treatment Information.dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Treatment Information.dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Treatment Information.dta saved

clear

**m:1 merge between "FINAL MERGED DATASET.DTA" & "TREATMENT INFORMATION" WORKSHEET IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls'
use "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset.dta", clear
merge m:1 Treatment_ID using "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Treatment Information.dta"
drop _merge

**SAVED THE MERGED WORKSHEET AS "Final Merged Dataset & Treatment Information (Merged).dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta saved

**FILLED IN THE MISSING 'COMMON NAMES' OF SPECIES IN "Final Merged Dataset & Treatment Information (Merged).dta" BY COMPARING IT WITH "LTDL & Beth (Merged)" (CHECK DO-FILE)
replace Common = "Indian ricegrass" if Species=="Oryzopsis hymenoides (Roem. & Schult.) Ricker ex Piper"
replace Dummy = 1 if Species=="Oryzopsis hymenoides (Roem. & Schult.) Ricker ex Piper"

replace Common= "basin wild rye" if Species== "Elymus cinereus Scribn. & Merr."
replace StandardizedCommon= "basin wild rye" if Species== "Elymus cinereus Scribn. & Merr."
replace Dummy = 1 if Species=="Elymus cinereus Scribn. & Merr."

replace Common= "Western Yarrow" if Species== "Achillea millefolium L. ssp. occidentalis (DC.) Hyl."
replace Dummy = 1 if Species=="Achillea millefolium L. ssp. occidentalis (DC.) Hyl."

replace Common= "northwestern Indian paintbrush" if Species== "Castilleja chromosa A. Nelson"
replace Common= "stemless mock goldenweed" if Species== "Haplopappus acaulis (Nutt.) A. Gray"

replace Common= "big galleta" if Species== "Hilaria rigida (Thurb.) Benth. ex Scribn."

replace Common= "burningbush" if Species== "Kochia alata Bates"
replace Common= "smotherweed" if Species== "Kochia Roth"
replace Common= "littleleaf ratany" if Species== "Krameria parvifolia Benth."
replace Common= "lobeleaf groundsel" if Species== "Senecio multilobatus Torr. & A. Gray ex A. Gray"

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta saved

**"SEEDS OF SUCCESS" DUMMY
gen SeedsofSuccess=0

replace SeedsofSuccess=1 if Species=="Achnatherum hymenoides (Roem. & Schult.) Barkworth"
replace SeedsofSuccess=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth "
replace SeedsofSuccess=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Nezpar"
replace SeedsofSuccess=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Paloma"
replace SeedsofSuccess=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Rimrock"
replace SeedsofSuccess=2 if Species=="Elymus elymoides (Raf.) Swezey"
replace SeedsofSuccess=2 if Species=="Elymus elymoides (Raf.) Swezey - Shaniko"
replace SeedsofSuccess=2 if Species=="Elymus elymoides (Raf.) Swezey ssp. elymoides"
replace SeedsofSuccess=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve"
replace SeedsofSuccess=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve - Magnar"
replace SeedsofSuccess=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve - Trailhead"
replace SeedsofSuccess=4 if Species=="Poa secunda J. Presl"
replace SeedsofSuccess=4 if Species=="Poa secunda J. Presl. - Canbar Canby"
replace SeedsofSuccess=4 if Species=="Poa secunda J. Presl. - Mtn. Home"
replace SeedsofSuccess=4 if Species=="Poa secunda J. Presl. - Sherman"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. inermis (Scribn. & J.G. Sm.) A. Löve"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. inermis (Scribn. & J.G. Sm.) A. Löve  - Whitmar"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Anatone"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Goldar"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - P-7"
replace SeedsofSuccess=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Wahluke"
replace SeedsofSuccess=6 if Species=="Chaenactis douglasii (Hook.) Hook. & Arn."
replace SeedsofSuccess=7 if Species=="Crepis acuminata Nutt."
replace SeedsofSuccess=8 if Species=="Sphaeralcea ambigua A. Gray"
replace SeedsofSuccess=8 if Species=="Sphaeralcea ambigua A. Gray ssp. rugosa Kearney"
replace SeedsofSuccess=8 if Species=="Sphaeralcea ambigua Gray "
replace SeedsofSuccess=8 if Species=="Sphaeralcea coccinea (Nutt.) Rydb. "
replace SeedsofSuccess=8 if Species=="Sphaeralcea grossulariifolia (Hook. & Arn.) Rydb. "
replace SeedsofSuccess=8 if Species=="Sphaeralcea munroana (Dougl. ex Lindl.) Spach ex Gray"
label variable SeedsofSuccess "Seeds of Success dummy variables for Species"

**"SERRT" DUMMY
gen SERRT=0
label variable SERRT "SERRT dummy variables for Species"

replace SERRT=1 if Species=="Achnatherum hymenoides (Roem. & Schult.) Barkworth"
replace SERRT=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth "
replace SERRT=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Nezpar"
replace SERRT=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Paloma"
replace SERRT=1 if Species=="Achnatherum hymenoides (Roemer & J.A. Schultes) Barkworth  - Rimrock"
replace SERRT=2 if Species=="Elymus elymoides (Raf.) Swezey"
replace SERRT=2 if Species=="Elymus elymoides (Raf.) Swezey - Shaniko"
replace SERRT=2 if Species=="Elymus elymoides (Raf.) Swezey ssp. elymoides"
replace SERRT=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve"
replace SERRT=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve - Magnar"
replace SERRT=3 if Species=="Leymus cinereus (Scribn. & Merr.) A. Löve - Trailhead"
replace SERRT=4 if Species=="Poa secunda J. Presl"
replace SERRT=4 if Species=="Poa secunda J. Presl. - Canbar Canby"
replace SERRT=4 if Species=="Poa secunda J. Presl. - Mtn. Home"
replace SERRT=4 if Species=="Poa secunda J. Presl. - Sherman"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. inermis (Scribn. & J.G. Sm.) A. Löve"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. inermis (Scribn. & J.G. Sm.) A. Löve  - Whitmar"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Anatone"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Goldar"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - P-7"
replace SERRT=5 if Species=="Pseudoroegneria spicata (Pursh) A. Löve ssp. spicata  - Wahluke"
replace SERRT=0 if Species=="Chaenactis douglasii (Hook.) Hook. & Arn."
replace SERRT=6 if Species=="Crepis acuminata Nutt."
replace SERRT=0 if Species=="Sphaeralcea ambigua A. Gray"
replace SERRT=0 if Species=="Sphaeralcea ambigua A. Gray ssp. rugosa Kearney"
replace SERRT=0 if Species=="Sphaeralcea ambigua Gray "
replace SERRT=0 if Species=="Sphaeralcea coccinea (Nutt.) Rydb. "
replace SERRT=0 if Species=="Sphaeralcea grossulariifolia (Hook. & Arn.) Rydb. "
replace SERRT=0 if Species=="Sphaeralcea munroana (Dougl. ex Lindl.) Spach ex Gray"

**ACRES: TWO NEW VARIABLES

*Mix_Acres_Max
egen Mix_Acres_Max = max(Mix_Acres), by(Project_Name)
label variable Mix_Acres_Max "maximum value of Mix_Acres associated with a Project_Name."

*Mix_Acres_Total
egen Mix_Acres_Total = total(Mix_Acres), by(Treatment_ID)
label variable Mix_Acres_Total "total value of Mix_Acres from each subproject (as defined by Treatment_ID) associated with a Project_Name"

replace FunctionalGroup = "Exotic Biennial Forb" if Species=="Melilotus officinalis (L.) Lam."
replace FunctionalGroup = "Exotic Biennial Forb" if Species=="Melilotus officinalis (L.) Lam.  - Madrid"
replace FunctionalGroup = "Native Perennial Forb" if Species=="Oenothera pallida Lindl."

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged).dta saved

*************************************************************************************************************************************************

**"Final Merged Dataset & Treatment Information (Merged & Updated).dta"

list if mi(Species)
drop if mi(Species)

list if mi(Common)
drop if mi(Common)

list if mi(Bulk_Lbs_Seed_Species)
drop if mi(Bulk_Lbs_Seed_Species) & mi(PLS_Lbs_Seed_Species)

**left with 2221 observation

**SAVED AS "Final Merged Dataset & Treatment Information (Merged & Updated).dta"
save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged & Updated).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged & Updated).dta saved

sort Project_Start_Year Species
duplicates list
duplicates drop

**Down to 2220 observations

**"Final Merged Dataset & Treatment Information (M&U1).dta"

sort Project_Start_Year Species

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta saved

export excel Contact_Office_Name Project_Start_Year Project_Name Treatment_ID Mix_Acres Symbol Species Common Bulk_Lbs_Seed_Species PLS_Lbs_Seed_Species using "\\bfs.coba.unr.e
> du\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).xls", firstrow(variables)
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).xls saved

clear

********************************************************************************************************************************************************

**06/28/2018
import excel "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).xls", sheet("Sheet1") firstrow

drop if Contact_Office_Name=="Southern Nevada"|Contact_Office_Name=="GBNP"

/*Exported dataset to "Sheet 2 (After dropping Southern Nevada)" of "Final Merged Dataset & Treatment Information (M&U1).xls" to compare it with "Final Merged Dataset & Treatment Information (M&U1).dta"
as we delete the duplicate observations in the latter. */

clear all

use "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta", clear

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
file \\bfs.coba.unr.edu\gradhome\mdniazcb\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta saved

*************************************************************************************************************************************************
*************************************************************************************************************************************************
**EXAMPLE: ONLY FOR REFERENCE FOR PROF. TAYLOR
keep if Species=="Penstemon palmeri Gray" | Species=="Pleuraphis jamesii Torr.  - Viva"
drop in 14/48
egen tag=tag(Project_Name StandardizedCommon)
list Project_Name StandardizedCommon tag
egen distinct=total(tag), by(StandardizedCommon) 
list Project_Name StandardizedCommon tag distinct
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


**TO GENERATE GRAPHS OF '# OF PROJECTS' & 'TOTAL PLS. OF SEEDS USED' BY YEAR.

sort Project_Start_Year 
egen Total_PLS_by_Year = total(PLS_Bulk), by(Project_Start_Year)

egen tag2=tag(Project_Start_Year Project_Name)
egen newvar=count(tag2) if tag2==1, by(Project_Start_Year)

tabstat Total_PLS_by_Year newvar, by(Project_Start_Year)

*************************************************************************************************************************************************************
**TO GENERATE BAR GRAPHS OF '# OF PROJECTS' & 'TOTAL PLS. OF SEEDS USED' BY CONTACT OFFICE

sort Contact_Office_Name
egen Total_PLS_by_Contact_Office_Name = total(PLS_Bulk), by(Contact_Office_Name)

egen tag3=tag(Contact_Office_Name Project_Name)
egen newvar2=count(tag3) if tag3==1, by(Contact_Office_Name)

tabstat Total_PLS_by_Contact_Office_Name newvar2, by(Contact_Office_Name)

save "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\07.02.2018\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\07.02.2018\Final Merged Dataset & Treatment Information (M&U2).dta saved

**TO CREATE GRAPHS WITH DETAILS ABOUT WILDFIRE AND NON-WILDFIRE PROJECTS (by StandardizedCommon, FunctionalGroup, Project_Start_Year & Contact_Office_Name, respectively)
preserve
keep if StandardizedCommon=="Sandbergs Bluegrass"
egen totalbulk=sum(PLS_Bulk), by(Reason_For_Project)
tabstat totalbulk, by(Reason_For_Project)
restore

preserve
keep if FunctionalGroup=="Exotic Forb"
egen totalbulk=sum(PLS_Bulk), by(Reason_For_Project)
tabstat totalbulk, by(Reason_For_Project)
restore


preserve
keep if Project_Start_Year==2013
egen totalbulk=sum(PLS_Bulk), by(Reason_For_Project)
tabstat totalbulk, by(Reason_For_Project)
restore


preserve
keep if Contact_Office_Name=="Winnemucca"
egen totalbulk=sum(PLS_Bulk), by(Reason_For_Project)
tabstat totalbulk, by(Reason_For_Project)
restore

**************************************************************************************************************************************************************
**TO GENERATE TOP 10 'STANDARDIZEDCOMMON' KEEPING ONLY 'WILDFIRE'-RELATED OBSERVATIONS
keep if Reason_For_Project=="Wildfire"

**To find out the number of projects in which each "StandardizedCommon" has been used.
egen tag4=tag(Project_Name StandardizedCommon)
egen distinct2=total(tag4), by(StandardizedCommon) 

label variable distinct2 "Number of projects which have used each of the StandardizedCommon respectively when Reason_For_Project is Wildfire"

**To rank the "StandardizedCommon" based on the number of projects they have been used in.
gsort -distinct2

**To find Total_PLS_lbs_of_seed by "StandardizedCommon" when Reason_For_Project=="Wildfire"
egen Total_PLS_lbs_of_seed2=total(PLS_Bulk), by(StandardizedCommon)
label variable Total_PLS_lbs_of_seed2 "Number of PLS pounds seeded for each StandardizedCommon when Reason_For_Project is Wildfire"

tabstat distinct2 Total_PLS_lbs_of_seed2, by(StandardizedCommon)

**To find out the total number of projects in the master dataset.
tabulate Project_Name
return list
**r(r) = 200 after dropping years 2014 and 2015, so total number of projects in this case is 200.

***********************************************************************************************************************************************
**TO GENERATE TOP 10 'STANDARDIZEDCOMMON' KEEPING ONLY 'OTHER'-RELATED OBSERVATIONS
drop if Reason_For_Project=="Wildfire"

**To find out the number of projects in which each "StandardizedCommon" has been used.
egen tag5=tag(Project_Name StandardizedCommon)
egen distinct3=total(tag5), by(StandardizedCommon) 

label variable distinct3 "Number of projects which have used each of the StandardizedCommon respectively when Reason_For_Project is Other"

**To rank the "StandardizedCommon" based on the number of projects they have been used in.
gsort -distinct3

**To find Total_PLS_lbs_of_seed by "StandardizedCommon" when Reason_For_Project=="Wildfire"
egen Total_PLS_lbs_of_seed3=total(PLS_Bulk), by(StandardizedCommon)
label variable Total_PLS_lbs_of_seed3 "Number of PLS pounds seeded for each StandardizedCommon when Reason_For_Project is Other"

tabstat distinct3 Total_PLS_lbs_of_seed3, by(StandardizedCommon)

**To find out the total number of projects in the master dataset.
tabulate Project_Name
return list
**r(r) = 30 after dropping years 2014 and 2015, so total number of projects in this case is 30.
**************************************************************************************************************************************************

**TO GENERATE 'FUNCTIONALGROUP' KEEPING ONLY 'WILDFIRE' - RELATED OBSERVATIONS
keep if Reason_For_Project=="Wildfire"

**To find out the number of projects in which each "FunctionalGroup" has been used.
egen tag6=tag(Project_Name FunctionalGroup)
egen distinct4=total(tag6), by(FunctionalGroup) 

label variable distinct4 "Number of projects which have used each of the FunctionalGroup respectively when Reason_For_Project is Wildfire"

**To rank the "FunctionalGroup" based on the number of projects they have been used in.
gsort -distinct4

**To find Total_PLS_lbs_of_seed by "FunctionalGroup"
egen Total_PLS_lbs_of_seed4=total(PLS_Bulk), by(FunctionalGroup)
label variable Total_PLS_lbs_of_seed4 "Number of PLS pounds seeded for each FunctionalGroup when Reason_For_Project is Wildfire"

tabstat distinct4 Total_PLS_lbs_of_seed4, by(FunctionalGroup)

**To find out the total number of projects in the master dataset.
tabulate Project_Name
return list
**r(r) = 200 after dropping years 2014 and 2015, so total number of projects in this case is 200.

**************************************************************************************************************************************************
**TO GENERATE 'FUNCTIONALGROUP' KEEPING ONLY 'OTHER' - RELATED OBSERVATIONS
drop if Reason_For_Project=="Wildfire"

**To find out the number of projects in which each "FunctionalGroup" has been used.
egen tag7=tag(Project_Name FunctionalGroup)
egen distinct5=total(tag7), by(FunctionalGroup) 

label variable distinct5 "Number of projects which have used each of the FunctionalGroup respectively when Reason_For_Project is Other."

**To rank the "FunctionalGroup" based on the number of projects they have been used in.
gsort -distinct5

**To find Total_PLS_lbs_of_seed by "FunctionalGroup"
egen Total_PLS_lbs_of_seed5=total(PLS_Bulk), by(FunctionalGroup)
label variable Total_PLS_lbs_of_seed5 "Number of PLS pounds seeded for each FunctionalGroup when Reason_For_Project is Other."

tabstat distinct5 Total_PLS_lbs_of_seed5, by(FunctionalGroup)

**To find out the total number of projects in the master dataset.
tabulate Project_Name
return list
**r(r) = 30 after dropping years 2014 and 2015, so total number of projects in this case is 30.
****************************************************************************************************************************************************

**THE TOP 4 'FUNCTIONALGROUP' BY NUMBER OF PROJECTS ARE 'NATIVE PERENNIAL GRASS', 'NATIVE PERENNIAL FORB','NATIVE SHRUB' & 'EXOTIC FORB'.
keep if FunctionalGroup=="Exotic Forb" 
tabulate StandardizedCommon
sort StandardizedCommon
by StandardizedCommon: gen freq=_N
by StandardizedCommon: keep if _n==1
gsort -freq StandardizedCommon
set more off
tabulate StandardizedCommon freq

keep if StandardizedCommon=="Sandbergs Bluegrass"| StandardizedCommon=="Indian Ricegrass"| StandardizedCommon=="Wyoming big sagebrush"| StandardizedCommon=="Bottlebrush Squirreltail"| StandardizedCommon=="Small Burnet"| StandardizedCommon=="forage kochia"|StandardizedCommon=="Blue Flax" | StandardizedCommon=="Western Yarrow"| StandardizedCommon=="Bluebunch Wheatgrass"| StandardizedCommon=="Siberian wheatgrass"| StandardizedCommon=="Thickspike Wheatgrass"| StandardizedCommon=="Great Basin Wildrye"| StandardizedCommon=="Snake River Wheatgrass"| StandardizedCommon=="Lewis flax"| StandardizedCommon=="Palmer Penstemon"| StandardizedCommon=="Desert Globemallow"| StandardizedCommon=="Basin Big Sagebrush"| StandardizedCommon=="Mountain Big Sagebrush" | StandardizedCommon=="Antelope Bitterbrush" | StandardizedCommon=="Sainfoin"| StandardizedCommon=="Alfalfa"| StandardizedCommon=="smotherweed" 
****************************************************************************************************************************************************
preserve
keep if SeedKind=="Alfalfa"
sum PLSPriceperPound
sum BulkPriceperPound
restore
keep if SeedKind=="Indian Ricegrass"|SeedKind=="Iindian Ricegrass"
*****************************************************************************************************************************************************
gen Standardized_Common_Year=""
replace Standardized_Common_Year= "Sandbergs Bluegrass_05" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Sandbergs Bluegrass_06" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Sandbergs Bluegrass_07" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Sandbergs Bluegrass_08" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Sandbergs Bluegrass_09" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Sandbergs Bluegrass_10" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Sandbergs Bluegrass_11" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Sandbergs Bluegrass_12" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Sandbergs Bluegrass_13" if StandardizedCommon=="Sandbergs Bluegrass" & Project_Start_Year==2013


replace Standardized_Common_Year= "Indian Ricegrass_05" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Indian Ricegrass_06" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Indian Ricegrass_07" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Indian Ricegrass_08" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Indian Ricegrass_09" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Indian Ricegrass_10" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Indian Ricegrass_11" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Indian Ricegrass_12" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Indian Ricegrass_13" if StandardizedCommon=="Indian Ricegrass" & Project_Start_Year==2013


replace Standardized_Common_Year= "Wyoming big sagebrush_05" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2005
replace Standardized_Common_Year= "Wyoming big sagebrush_06" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2006
replace Standardized_Common_Year= "Wyoming big sagebrush_07" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2007
replace Standardized_Common_Year= "Wyoming big sagebrush_08" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2008
replace Standardized_Common_Year= "Wyoming big sagebrush_09" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2009
replace Standardized_Common_Year= "Wyoming big sagebrush_10" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2010
replace Standardized_Common_Year= "Wyoming big sagebrush_11" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2011
replace Standardized_Common_Year= "Wyoming big sagebrush_12" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2012
replace Standardized_Common_Year= "Wyoming big sagebrush_13" if StandardizedCommon=="Wyoming big sagebrush" & Project_Start_Year==2013



replace Standardized_Common_Year= "Bottlebrush Squirrelltail_05" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2005
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_06" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2006
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_07" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2007
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_08" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2008
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_09" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2009
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_10" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2010
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_11" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2011
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_12" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2012
replace Standardized_Common_Year= "Bottlebrush Squirrelltail_13" if StandardizedCommon=="Bottlebrush Squirrelltail" & Project_Start_Year==2013



replace Standardized_Common_Year= "Small Burnet_05" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2005
replace Standardized_Common_Year= "Small Burnet_06" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2006
replace Standardized_Common_Year= "Small Burnet_07" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2007
replace Standardized_Common_Year= "Small Burnet_08" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2008
replace Standardized_Common_Year= "Small Burnet_09" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2009
replace Standardized_Common_Year= "Small Burnet_10" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2010
replace Standardized_Common_Year= "Small Burnet_11" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2011
replace Standardized_Common_Year= "Small Burnet_12" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2012
replace Standardized_Common_Year= "Small Burnet_13" if StandardizedCommon=="Small Burnet" & Project_Start_Year==2013


replace Standardized_Common_Year= "forage kochia_05" if StandardizedCommon=="forage kochia" & Project_Start_Year==2005
replace Standardized_Common_Year= "forage kochia_06" if StandardizedCommon=="forage kochia" & Project_Start_Year==2006
replace Standardized_Common_Year= "forage kochia_07" if StandardizedCommon=="forage kochia" & Project_Start_Year==2007
replace Standardized_Common_Year= "forage kochia_08" if StandardizedCommon=="forage kochia" & Project_Start_Year==2008
replace Standardized_Common_Year= "forage kochia_09" if StandardizedCommon=="forage kochia" & Project_Start_Year==2009
replace Standardized_Common_Year= "forage kochia_10" if StandardizedCommon=="forage kochia" & Project_Start_Year==2010
replace Standardized_Common_Year= "forage kochia_11" if StandardizedCommon=="forage kochia" & Project_Start_Year==2011
replace Standardized_Common_Year= "forage kochia_12" if StandardizedCommon=="forage kochia" & Project_Start_Year==2012
replace Standardized_Common_Year= "forage kochia_13" if StandardizedCommon=="forage kochia" & Project_Start_Year==2013





replace Standardized_Common_Year= "Blue Flax_05" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2005
replace Standardized_Common_Year= "Blue Flax_06" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2006
replace Standardized_Common_Year= "Blue Flax_07" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2007
replace Standardized_Common_Year= "Blue Flax_08" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2008
replace Standardized_Common_Year= "Blue Flax_09" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2009
replace Standardized_Common_Year= "Blue Flax_10" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2010
replace Standardized_Common_Year= "Blue Flax_11" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2011
replace Standardized_Common_Year= "Blue Flax_12" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2012
replace Standardized_Common_Year= "Blue Flax_13" if StandardizedCommon=="Blue Flax" & Project_Start_Year==2013



replace Standardized_Common_Year= "Western Yarrow_05" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2005
replace Standardized_Common_Year= "Western Yarrow_06" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2006
replace Standardized_Common_Year= "Western Yarrow_07" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2007
replace Standardized_Common_Year= "Western Yarrow_08" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2008
replace Standardized_Common_Year= "Western Yarrow_09" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2009
replace Standardized_Common_Year= "Western Yarrow_10" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2010
replace Standardized_Common_Year= "Western Yarrow_11" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2011
replace Standardized_Common_Year= "Western Yarrow_12" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2012
replace Standardized_Common_Year= "Western Yarrow_13" if StandardizedCommon=="Western Yarrow" & Project_Start_Year==2013



replace Standardized_Common_Year= "Bluebunch Wheatgrass_05" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Bluebunch Wheatgrass_06" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Bluebunch Wheatgrass_07" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Bluebunch Wheatgrass_08" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Bluebunch Wheatgrass_09" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Bluebunch Wheatgrass_10" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Bluebunch Wheatgrass_11" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Bluebunch Wheatgrass_12" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Bluebunch Wheatgrass_13" if StandardizedCommon=="Bluebunch Wheatgrass" & Project_Start_Year==2013



replace Standardized_Common_Year= "Siberian wheatgrass_05" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Siberian wheatgrass_06" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Siberian wheatgrass_07" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Siberian wheatgrass_08" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Siberian wheatgrass_09" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Siberian wheatgrass_10" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Siberian wheatgrass_11" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Siberian wheatgrass_12" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Siberian wheatgrass_13" if StandardizedCommon=="Siberian wheatgrass" & Project_Start_Year==2013



replace Standardized_Common_Year= "Thickspike Wheatgrass_05" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Thickspike Wheatgrass_06" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Thickspike Wheatgrass_07" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Thickspike Wheatgrass_08" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Thickspike Wheatgrass_09" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Thickspike Wheatgrass_10" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Thickspike Wheatgrass_11" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Thickspike Wheatgrass_12" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Thickspike Wheatgrass_13" if StandardizedCommon=="Thickspike Wheatgrass" & Project_Start_Year==2013



replace Standardized_Common_Year= "Great Basin Wildrye_05" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2005
replace Standardized_Common_Year= "Great Basin Wildrye_06" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2006
replace Standardized_Common_Year= "Great Basin Wildrye_07" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2007
replace Standardized_Common_Year= "Great Basin Wildrye_08" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2008
replace Standardized_Common_Year= "Great Basin Wildrye_09" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2009
replace Standardized_Common_Year= "Great Basin Wildrye_10" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2010
replace Standardized_Common_Year= "Great Basin Wildrye_11" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2011
replace Standardized_Common_Year= "Great Basin Wildrye_12" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2012
replace Standardized_Common_Year= "Great Basin Wildrye_13" if StandardizedCommon=="Great Basin Wildrye" & Project_Start_Year==2013



replace Standardized_Common_Year= "Snake River Wheatgrass_05" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2005
replace Standardized_Common_Year= "Snake River Wheatgrass_06" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2006
replace Standardized_Common_Year= "Snake River Wheatgrass_07" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2007
replace Standardized_Common_Year= "Snake River Wheatgrass_08" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2008
replace Standardized_Common_Year= "Snake River Wheatgrass_09" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2009
replace Standardized_Common_Year= "Snake River Wheatgrass_10" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2010
replace Standardized_Common_Year= "Snake River Wheatgrass_11" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2011
replace Standardized_Common_Year= "Snake River Wheatgrass_12" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2012
replace Standardized_Common_Year= "Snake River Wheatgrass_13" if StandardizedCommon=="Snake River Wheatgrass" & Project_Start_Year==2013




replace Standardized_Common_Year= "Lewis flax_05" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2005
replace Standardized_Common_Year= "Lewis flax_06" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2006
replace Standardized_Common_Year= "Lewis flax_07" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2007
replace Standardized_Common_Year= "Lewis flax_08" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2008
replace Standardized_Common_Year= "Lewis flax_09" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2009
replace Standardized_Common_Year= "Lewis flax_10" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2010
replace Standardized_Common_Year= "Lewis flax_11" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2011
replace Standardized_Common_Year= "Lewis flax_12" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2012
replace Standardized_Common_Year= "Lewis flax_13" if StandardizedCommon=="Lewis flax" & Project_Start_Year==2013



replace Standardized_Common_Year= "Palmer Penstemon_05" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2005
replace Standardized_Common_Year= "Palmer Penstemon_06" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2006
replace Standardized_Common_Year= "Palmer Penstemon_07" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2007
replace Standardized_Common_Year= "Palmer Penstemon_08" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2008
replace Standardized_Common_Year= "Palmer Penstemon_09" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2009
replace Standardized_Common_Year= "Palmer Penstemon_10" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2010
replace Standardized_Common_Year= "Palmer Penstemon_11" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2011
replace Standardized_Common_Year= "Palmer Penstemon_12" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2012
replace Standardized_Common_Year= "Palmer Penstemon_13" if StandardizedCommon=="Palmer Penstemon" & Project_Start_Year==2013



replace Standardized_Common_Year= "Desert Globemallow_05" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2005
replace Standardized_Common_Year= "Desert Globemallow_06" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2006
replace Standardized_Common_Year= "Desert Globemallow_07" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2007
replace Standardized_Common_Year= "Desert Globemallow_08" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2008
replace Standardized_Common_Year= "Desert Globemallow_09" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2009
replace Standardized_Common_Year= "Desert Globemallow_10" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2010
replace Standardized_Common_Year= "Desert Globemallow_11" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2011
replace Standardized_Common_Year= "Desert Globemallow_12" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2012
replace Standardized_Common_Year= "Desert Globemallow_13" if StandardizedCommon=="Desert Globemallow" & Project_Start_Year==2013






replace Standardized_Common_Year= "Basin Big Sagebrush_05" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2005
replace Standardized_Common_Year= "Basin Big Sagebrush_06" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2006
replace Standardized_Common_Year= "Basin Big Sagebrush_07" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2007
replace Standardized_Common_Year= "Basin Big Sagebrush_08" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2008
replace Standardized_Common_Year= "Basin Big Sagebrush_09" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2009
replace Standardized_Common_Year= "Basin Big Sagebrush_10" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2010
replace Standardized_Common_Year= "Basin Big Sagebrush_11" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2011
replace Standardized_Common_Year= "Basin Big Sagebrush_12" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2012
replace Standardized_Common_Year= "Basin Big Sagebrush_13" if StandardizedCommon=="Basin Big Sagebrush" & Project_Start_Year==2013



replace Standardized_Common_Year= "Mountain Big Sagebrush_05" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2005
replace Standardized_Common_Year= "Mountain Big Sagebrush_06" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2006
replace Standardized_Common_Year= "Mountain Big Sagebrush_07" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2007
replace Standardized_Common_Year= "Mountain Big Sagebrush_08" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2008
replace Standardized_Common_Year= "Mountain Big Sagebrush_09" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2009
replace Standardized_Common_Year= "Mountain Big Sagebrush_10" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2010
replace Standardized_Common_Year= "Mountain Big Sagebrush_11" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2011
replace Standardized_Common_Year= "Mountain Big Sagebrush_12" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2012
replace Standardized_Common_Year= "Mountain Big Sagebrush_13" if StandardizedCommon=="Mountain Big Sagebrush" & Project_Start_Year==2013


replace Standardized_Common_Year= "Antelope Bitterbrush_05" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2005
replace Standardized_Common_Year= "Antelope Bitterbrush_06" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2006
replace Standardized_Common_Year= "Antelope Bitterbrush_07" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2007
replace Standardized_Common_Year= "Antelope Bitterbrush_08" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2008
replace Standardized_Common_Year= "Antelope Bitterbrush_09" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2009
replace Standardized_Common_Year= "Antelope Bitterbrush_10" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2010
replace Standardized_Common_Year= "Antelope Bitterbrush_11" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2011
replace Standardized_Common_Year= "Antelope Bitterbrush_12" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2012
replace Standardized_Common_Year= "Antelope Bitterbrush_13" if StandardizedCommon=="Antelope Bitterbrush" & Project_Start_Year==2013



replace Standardized_Common_Year= "Sainfoin_05" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2005
replace Standardized_Common_Year= "Sainfoin_06" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2006
replace Standardized_Common_Year= "Sainfoin_07" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2007
replace Standardized_Common_Year= "Sainfoin_08" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2008
replace Standardized_Common_Year= "Sainfoin_09" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2009
replace Standardized_Common_Year= "Sainfoin_10" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2010
replace Standardized_Common_Year= "Sainfoin_11" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2011
replace Standardized_Common_Year= "Sainfoin_12" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2012
replace Standardized_Common_Year= "Sainfoin_13" if StandardizedCommon=="Sainfoin" & Project_Start_Year==2013


replace Standardized_Common_Year= "Alfalfa_05" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2005
replace Standardized_Common_Year= "Alfalfa_06" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2006
replace Standardized_Common_Year= "Alfalfa_07" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2007
replace Standardized_Common_Year= "Alfalfa_08" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2008
replace Standardized_Common_Year= "Alfalfa_09" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2009
replace Standardized_Common_Year= "Alfalfa_10" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2010
replace Standardized_Common_Year= "Alfalfa_11" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2011
replace Standardized_Common_Year= "Alfalfa_12" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2012
replace Standardized_Common_Year= "Alfalfa_13" if StandardizedCommon=="Alfalfa" & Project_Start_Year==2013


replace Standardized_Common_Year= "smotherweed_05" if StandardizedCommon=="smotherweed" & Project_Start_Year==2005
replace Standardized_Common_Year= "smotherweed_06" if StandardizedCommon=="smotherweed" & Project_Start_Year==2006
replace Standardized_Common_Year= "smotherweed_07" if StandardizedCommon=="smotherweed" & Project_Start_Year==2007
replace Standardized_Common_Year= "smotherweed_08" if StandardizedCommon=="smotherweed" & Project_Start_Year==2008
replace Standardized_Common_Year= "smotherweed_09" if StandardizedCommon=="smotherweed" & Project_Start_Year==2009
replace Standardized_Common_Year= "smotherweed_10" if StandardizedCommon=="smotherweed" & Project_Start_Year==2010
replace Standardized_Common_Year= "smotherweed_11" if StandardizedCommon=="smotherweed" & Project_Start_Year==2011
replace Standardized_Common_Year= "smotherweed_12" if StandardizedCommon=="smotherweed" & Project_Start_Year==2012
replace Standardized_Common_Year= "smotherweed_13" if StandardizedCommon=="smotherweed" & Project_Start_Year==2013

merge m:1 Standardized_Common_Year using "\\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\07.02.2018\UDWR (Top 4
>  Functional Group).dta"

sort FunctionalGroup
by FunctionalGroup: summarize UDWRPLSPrice UDWRBulkPrice
replace UDWRPLSPrice=4.366012 if StandardizedCommon=="smotherweed"
replace UDWRBulkPrice=3.330822 if StandardizedCommon=="smotherweed"
replace UDWRPLSPrice=15.21403 if StandardizedCommon=="Desert Globemallow"
replace UDWRBulkPrice=13.30138 if StandardizedCommon=="Desert Globemallow"

drop if mi(UDWRPLSPrice)|mi(UDWRBulkPrice)
gen UDWRPLS_Seeded= UDWRPLSPrice*PLS_Lbs_Seed_Species
gen UDWRBulk_Seeded= UDWRBulkPrice*Bulk_Lbs_Seed_Species
gen UDWR_PLS_Bulk_Seeded_Species=UDWRPLS_Seeded
replace UDWR_PLS_Bulk_Seeded_Species=UDWRBulk_Seeded if mi(UDWRPLS_Seeded)


summarize if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2005
summarize if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2006
summarize if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2011
**There is no mean available for "Exotic Annual Forb" because it has only one observation available for the year 2011.

**there is no mean available for "Exotic Biennial Forb" because it has only three observations available.
summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2005 
replace UDWRPLSPrice=3.978333 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2005 & mi(UDWRPLSPrice)
replace UDWRBulkPrice=3.168333 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2005 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2006
replace UDWRPLSPrice= 3.942176 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2006 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.031768 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2006 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2007 
replace UDWRPLSPrice= 5.943596 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2007 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 4.436171 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2007 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2008
replace UDWRPLSPrice= 4.4305 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2008 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.6295 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2008 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2009
replace UDWRPLSPrice= 5.32 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2009 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.818333 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2009 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2010
replace UDWRPLSPrice= 4.01445 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2010 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.0265 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2010 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2011
replace UDWRPLSPrice= 4.421353 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2011 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.207529 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2011 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2012
replace UDWRPLSPrice= 2.259467  if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2012 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 1.79845 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2012 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2013
replace UDWRPLSPrice= 5.849555  if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2013 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 4.535316 if FunctionalGroup=="Exotic Forb" & Project_Start_Year==2013 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2005
replace UDWRPLSPrice= .54 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2005 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= .48 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2005 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2006
replace UDWRPLSPrice= 1.894887 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2006 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 2.314844 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2006 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2007
replace UDWRPLSPrice= 1.894887 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2007 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 2.314844 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2007 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2008
replace UDWRPLSPrice= 1.2895 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2008 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 1.15 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2008 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2009
replace UDWRPLSPrice= 3.6456 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2009 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 3.014 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2009 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2010
replace UDWRPLSPrice= 1.993 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2010 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 1.65 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2010 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2011
replace UDWRPLSPrice= 1.692 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2011 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 1.53 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2011 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2012
replace UDWRPLSPrice= 1.675 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2012 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 1.4 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2012 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2013
replace UDWRPLSPrice= 2.429106 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2013 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 2.14265 if FunctionalGroup=="Exotic Perennial Grass" & Project_Start_Year==2013 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2005
**no mean found because no observations are available.

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2006
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2007
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2008
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2009
**no observations available on UDWRPLSPrice/UDWRBulkPrice

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2010
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2011
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2012
**no observations available

summarize if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2013
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2005
**no observations

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2006
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2007
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2008
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2009
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2010
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2011
**no observations available

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2012
**no observations available.

summarize if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2013
**no observations available

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2005
replace UDWRPLSPrice= 12.9926 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2005 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.7063 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2005 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2006
replace UDWRPLSPrice= 12.81942 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2006 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.9651 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2006 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2007
replace UDWRPLSPrice= 13.69624 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2007 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 12.83711 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2007 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2008
replace UDWRPLSPrice= 14.69683 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2008 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 12.20833 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2008 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2009
replace UDWRPLSPrice= 16.53097 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2009 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 14.31775 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2009 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2010
replace UDWRPLSPrice= 11.47641 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2010 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 9.687264 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2010 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2011
replace UDWRPLSPrice= 11.06846 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2011 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 9.925483 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2011 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2012
replace UDWRPLSPrice= 17.85096 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2012 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 15.93384 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2012 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2013
replace UDWRPLSPrice= 22.52094 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2013 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 19.24895 if FunctionalGroup=="Native Perennial Forb" & Project_Start_Year==2013 & mi(UDWRBulkPrice)

save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2005
replace UDWRPLSPrice= 5.293038 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2005 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 4.192532 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2005 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2006
replace UDWRPLSPrice= 7.436952 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2006 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 6.390364 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2006 & mi(UDWRBulkPrice)

save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2007
replace UDWRPLSPrice= 5.415102 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2007 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 4.685091 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2007 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2008
replace UDWRPLSPrice= 6.870596 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2008 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 5.791091 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2008 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2009
replace UDWRPLSPrice=9.5848 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2009 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 8.250667 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2009 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2010
replace UDWRPLSPrice=7.525662 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2010 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 6.705516 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2010 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2011
replace UDWRPLSPrice=5.087593 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2011 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 4.331242 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2011 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2012
replace UDWRPLSPrice=6.377654 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2012 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 5.496331 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2012 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2013
replace UDWRPLSPrice=7.129533 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2013 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 6.169886 if FunctionalGroup=="Native Perennial Grass" & Project_Start_Year==2013 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2005
replace UDWRPLSPrice=36.28477 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2005 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.73621 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2005 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2006
replace UDWRPLSPrice=34.93358 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2006 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.34238 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2006 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2007
replace UDWRPLSPrice=38.57317 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2007 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.18859 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2007 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2008
replace UDWRPLSPrice=51.57667 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2008 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 12.64667 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2008 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2009
replace UDWRPLSPrice=38.74922 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2009 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.55018 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2009 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2010
replace UDWRPLSPrice=20.20578 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2010 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 5.709981 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2010 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2011
replace UDWRPLSPrice=38.68372 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2011 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 10.73006 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2011 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2012
replace UDWRPLSPrice=24.00318 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2012 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 6.264758 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2012 & mi(UDWRBulkPrice)

summarize if FunctionalGroup=="Native Shrub" & Project_Start_Year==2013
replace UDWRPLSPrice=55.66266 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2013 & mi(UDWRPLSPrice)
replace UDWRBulkPrice= 15.37749 if FunctionalGroup=="Native Shrub" & Project_Start_Year==2013 & mi(UDWRBulkPrice)

save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

/*Average of UDWRPLSPrice & UDWRBulkPrice were not available for a few "FunctionalGroup" such as "Exotic Annual Forb", "Exotic Biennial Forb", "Native Annual Forb" & "Native Annual Grass"
so the average of all the other "FunctionalGroup" "UDWRPLSPrice" and "UDWRBulkPrice" was taken for each year to fill up these variables for the aforementioned "FunctionalGroup".*/

summarize if Project_Start_Year==2005
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2005
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2006
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2007
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2008
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2009
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2010
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2011
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2012
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2013

replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2005
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2006
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2007
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2008
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2009
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2010
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2011
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2012
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2013

replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2005
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2006
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2007
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2008
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2009
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2010
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2011
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2012
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2013

replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2005
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2006
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2007
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2008
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2009
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2010
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2011
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2012
replace UDWRPLSPrice=11.47916 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2013



replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2005
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2006
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2007
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2008
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2009
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2010
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2011
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2012
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Annual Forb" & Project_Start_Year==2013

replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2005
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2006
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2007
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2008
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2009
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2010
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2011
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2012
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Exotic Biennial Forb" & Project_Start_Year==2013

replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2005
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2006
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2007
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2008
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2009
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2010
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2011
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2012
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Forb" & Project_Start_Year==2013

replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2005
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2006
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2007
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2008
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2009
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2010
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2011
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2012
replace UDWRBulkPrice=6.132228 if FunctionalGroup=="Native Annual Grass" & Project_Start_Year==2013

drop _merge

gen UDWRPLS_Seeded= UDWRPLSPrice*PLS_Lbs_Seed_Species
gen UDWRBulk_Seeded= UDWRBulkPrice*Bulk_Lbs_Seed_Species

gen UDWR_PLS_Bulk_Seeded_Species=UDWRPLS_Seeded
replace UDWR_PLS_Bulk_Seeded_Species=UDWRBulk_Seeded if mi(UDWRPLS_Seeded)

save "\\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

**BY STANDARDIZEDCOMMON:
egen Tot_UDWR_PLS_Bulk_Seeded_Species=total(UDWR_PLS_Bulk_Seeded_Species), by(StandardizedCommon)
label variable Tot_UDWR_PLS_Bulk_Seeded_Species "Total UDWR Dollars Spent for each StandardizedCommon"

 save "\\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

tabstat distinct Tot_UDWR_PLS_Bulk_Seeded_Species, by(StandardizedCommon)

**BY FUNCTIONALGROUP
egen tag10=tag(Project_Name FunctionalGroup)
egen distinct10=total(tag10), by(FunctionalGroup) 

egen UDWR_PLS_Bulk_Seeded_Species_Tot=total(UDWR_PLS_Bulk_Seeded_Species), by(FunctionalGroup)
label variable UDWR_PLS_Bulk_Seeded_Species_Tot "Total UDWR Dollars Spent for each FunctionalGroup"

tabstat distinct10 UDWR_PLS_Bulk_Seeded_Species_Tot, by(FunctionalGroup)

**BY YEAR
egen tag11=tag(Project_Name Project_Start_Year)
egen distinct11=total(tag11), by(Project_Start_Year)

egen UDWR_PLS_Bulk_Seed_Spec_Tot=total(UDWR_PLS_Bulk_Seeded_Species), by(Project_Start_Year)
label variable UDWR_PLS_Bulk_Seed_Spec_Tot "Total UDWR Dollars Spent for each Project_Start_Year"

tabstat distinct11 UDWR_PLS_Bulk_Seed_Spec_Tot, by(Project_Start_Year)

**BY CONTACT OFFICE NAME:
egen tag12=tag(Project_Name Contact_Office_Name)
egen distinct12=total(tag12), by(Contact_Office_Name)

egen UDWR_PLS_Bulk_Seed_Species1 =total(UDWR_PLS_Bulk_Seeded_Species), by(Contact_Office_Name)
label variable UDWR_PLS_Bulk_Seed_Species1 "Total UDWR Dollars Spent for each Contact_Office_Name"
tabstat distinct12 UDWR_PLS_Bulk_Seed_Species1, by(Contact_Office_Name)

**WILDFIRE
preserve
keep if Reason_For_Project=="Wildfire"

**BY STANDARDIZEDCOMMON:
egen UDWR_PLS_Bulk_Wildfire=total(UDWR_PLS_Bulk_Seeded_Species), by(StandardizedCommon)
label variable UDWR_PLS_Bulk_Wildfire "Total UDWR Dollars Spent for each StandardizedCommon(Wildfire)"
egen tag13=tag(Project_Name StandardizedCommon)
egen distinct13=total(tag13), by(StandardizedCommon)

tabstat distinct13 UDWR_PLS_Bulk_Wildfire, by(StandardizedCommon)

**BY FUNCTIONALGROUP:
egen UDWR_PLS_Bulk_Wildfire1=total(UDWR_PLS_Bulk_Seeded_Species), by(FunctionalGroup)
label variable UDWR_PLS_Bulk_Wildfire1 "Total UDWR Dollars Spent for each FunctionalGroup(Wildfire)"
egen tag14=tag(Project_Name FunctionalGroup)
egen distinct14=total(tag14), by(FunctionalGroup)
tabstat distinct14 UDWR_PLS_Bulk_Wildfire1, by(FunctionalGroup)

**BY YEAR:
egen UDWR_PLS_Bulk_Wildfire2=total(UDWR_PLS_Bulk_Seeded_Species), by(Project_Start_Year)
label variable UDWR_PLS_Bulk_Wildfire2 "Total UDWR Dollars Spent for each Project_Start_Year(Wildfire)"
egen tag15=tag(Project_Name Project_Start_Year)
egen distinct15=total(tag15), by(Project_Start_Year)
tabstat distinct15 UDWR_PLS_Bulk_Wildfire2, by(Project_Start_Year)

**BY CONTACT OFFICE:
egen UDWR_PLS_Bulk_Wildfire3=total(UDWR_PLS_Bulk_Seeded_Species), by(Contact_Office_Name)
label variable UDWR_PLS_Bulk_Wildfire3 "Total UDWR Dollars Spent for each Contact_Office_Name(Wildfire)"
egen tag16=tag(Project_Name Contact_Office_Name)
egen distinct16=total(tag16), by(Contact_Office_Name)
tabstat distinct16 UDWR_PLS_Bulk_Wildfire3, by(Contact_Office_Name)

restore
save "\\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\mdniazc\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

**OTHER
preserve
keep if Reason_For_Project=="Wildfire"

**BY STANDARDIZEDCOMMON:
egen UDWR_PLS_Bulk_Other=total(UDWR_PLS_Bulk_Seeded_Species), by(StandardizedCommon)
label variable UDWR_PLS_Bulk_Other "Total UDWR Dollars Spent for each StandardizedCommon(Other)"
egen tag17=tag(Project_Name StandardizedCommon)
egen distinct17=total(tag17), by(StandardizedCommon)
tabstat distinct17 UDWR_PLS_Bulk_Other, by(StandardizedCommon)

**BY FUNCTIONALGROUP:
egen UDWR_PLS_Bulk_Other1=total(UDWR_PLS_Bulk_Seeded_Species), by(FunctionalGroup)
label variable UDWR_PLS_Bulk_Other1 "Total UDWR Dollars Spent for each FunctionalGroup(Other)"
egen tag18=tag(Project_Name FunctionalGroup)
egen distinct18=total(tag18), by(FunctionalGroup)
tabstat distinct18 UDWR_PLS_Bulk_Other1, by(FunctionalGroup)

**BY YEAR
egen UDWR_PLS_Bulk_Other2=total(UDWR_PLS_Bulk_Seeded_Species), by(Project_Start_Year)
label variable UDWR_PLS_Bulk_Other2 "Total UDWR Dollars Spent for each Project_Start_Year(Other)"
egen tag19=tag(Project_Name Project_Start_Year)
egen distinct19=total(tag19), by(Project_Start_Year)
tabstat distinct19 UDWR_PLS_Bulk_Other2, by(Project_Start_Year)

**BY CONTACT OFFICE NAME:
egen UDWR_PLS_Bulk_Other3=total(UDWR_PLS_Bulk_Seeded_Species), by(Contact_Office_Name)
label variable UDWR_PLS_Bulk_Other3 "Total UDWR Dollars Spent for each Contact_Office_Name(Other)"
egen tag17=tag(Project_Name Contact_Office_Name)
egen distinct17=total(tag17), by(Contact_Office_Name)
tabstat distinct17 UDWR_PLS_Bulk_Other3, by(Contact_Office_Name)

restore
