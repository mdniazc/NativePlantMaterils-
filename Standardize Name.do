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
