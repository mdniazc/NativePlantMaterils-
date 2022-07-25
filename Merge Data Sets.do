
/*Merge #1 */

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

/* Merge #2 */

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
