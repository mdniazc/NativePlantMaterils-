**IMPORT EXCEL WORKSHEET "LTDL & Beth (Merged" IN 'LTDL_NV_Seeding_Trt_List_10-20-2016.xls' TO CONVERT TO .DTA AFTER MAKING RELEVANT CHANGES LISTED BELOW**

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
