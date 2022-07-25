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

save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

**BY STANDARDIZEDCOMMON:
egen Tot_UDWR_PLS_Bulk_Seeded_Species=total(UDWR_PLS_Bulk_Seeded_Species), by(StandardizedCommon)
label variable Tot_UDWR_PLS_Bulk_Seeded_Species "Total UDWR Dollars Spent for each StandardizedCommon"

 save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

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

**BY YEAR
egen UDWR_PLS_Bulk_Wildfire2=total(UDWR_PLS_Bulk_Seeded_Species), by(Project_Start_Year)
label variable UDWR_PLS_Bulk_Wildfire2 "Total UDWR Dollars Spent for each Project_Start_Year(Wildfire)"
egen tag15=tag(Project_Name Project_Start_Year)
egen distinct15=total(tag15), by(Project_Start_Year)
tabstat distinct15 UDWR_PLS_Bulk_Wildfire2, by(Project_Start_Year)

**BY CONTACT OFFICE
egen UDWR_PLS_Bulk_Wildfire3=total(UDWR_PLS_Bulk_Seeded_Species), by(Contact_Office_Name)
label variable UDWR_PLS_Bulk_Wildfire3 "Total UDWR Dollars Spent for each Contact_Office_Name(Wildfire)"
egen tag16=tag(Project_Name Contact_Office_Name)
egen distinct16=total(tag16), by(Contact_Office_Name)
tabstat distinct16 UDWR_PLS_Bulk_Wildfire3, by(Contact_Office_Name)

restore
save "\\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta", replace
file \\files\users\sourikb\Desktop\Prof. Michael Taylor\Final Merged Dataset & Treatment Information (M&U2).dta saved

**OTHER
preserve
keep if Reason_For_Project=="Wildfire"

**BY STANDARDIZEDCOMMON
egen UDWR_PLS_Bulk_Other=total(UDWR_PLS_Bulk_Seeded_Species), by(StandardizedCommon)
label variable UDWR_PLS_Bulk_Other "Total UDWR Dollars Spent for each StandardizedCommon(Other)"
egen tag17=tag(Project_Name StandardizedCommon)
egen distinct17=total(tag17), by(StandardizedCommon)
tabstat distinct17 UDWR_PLS_Bulk_Other, by(StandardizedCommon)

**BY FUNCTIONALGROUP 
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

**BY CONTACT OFFICE NAME
egen UDWR_PLS_Bulk_Other3=total(UDWR_PLS_Bulk_Seeded_Species), by(Contact_Office_Name)
label variable UDWR_PLS_Bulk_Other3 "Total UDWR Dollars Spent for each Contact_Office_Name(Other)"
egen tag17=tag(Project_Name Contact_Office_Name)
egen distinct17=total(tag17), by(Contact_Office_Name)
tabstat distinct17 UDWR_PLS_Bulk_Other3, by(Contact_Office_Name)

restore
