**"Final Merged Dataset & Treatment Information (Merged & Updated).dta"

list if mi(Species)
drop if mi(Species)

list if mi(Common)
drop if mi(Common)

list if mi(Bulk_Lbs_Seed_Species)
drop if mi(Bulk_Lbs_Seed_Species) & mi(PLS_Lbs_Seed_Species)

**left with 2221 observations

**SAVED AS "Final Merged Dataset & Treatment Information (Merged & Updated).dta"
save "\\bfs.coba.unr.edu\gradhome\mdniaizc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged & Updated).dta"
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (Merged & Updated).dta saved

sort Project_Start_Year Species
duplicates list
duplicates drop

**Down to 2220 observations

**"Final Merged Dataset & Treatment Information (M&U1).dta"

sort Project_Start_Year Species

save "\\bfs.coba.unr.edu\gradhome\mdniazcDesktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U1).dta"
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
file \\bfs.coba.unr.edu\gradhome\mdniazc\Desktop\Studies\Prof. Taylor 2\Final Merged Dataset & Treatment Information (M&U2).dta saved
