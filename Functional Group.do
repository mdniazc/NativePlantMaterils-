
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
