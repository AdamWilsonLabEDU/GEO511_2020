#' ---
#' title: Satellite Remote Sensing
#' subtitle: Analyze Satellite Data
#' week: 10
#' type: Case Study
#' reading:
#' tasks:
#'    - Extract a timeseries from a single location in a netcdf file (part 1)
#'    - Calculate a monthly climatology from a weekely timeseries (part 2)
#'    - Summarize Land Surface Temperature by Land Cover (part 3)
#' ---
#' 

#' 
#' # Tasks
#' 
## ----tasks,results='asis',echo=F----------------------------------------------
md_bullet(rmarkdown::metadata$tasks)

#' 
#' 
#' [<i class="fa fa-file-code-o fa-3x" aria-hidden="true"></i> The R Script associated with this page is available here](`r output`).  If you like, you can download this file and open it (or copy-paste into a new script) with RStudio so you can follow along.  
#' 
#' 
#' ### Libraries
#' 
## ----results='hide',message=FALSE, warning=F----------------------------------
library(raster)
library(rasterVis)
library(rgdal)
library(ggmap)
library(tidyverse)
library(knitr)

# New Packages
library(ncdf4) # to import data from netcdf format

#' 
#' # Case Study Set up
#' 
#' ## Identify (and create) download folders
#' 
#' Today we'll work with:
#' 
#' * Land Surface Temperature (`lst`): MOD11A2
#' * Land Cover (`lc`): MCD12Q1
#' 
#' ## Land Use Land Cover
#' 
## ---- eval=F, warning=F-------------------------------------------------------
## # Create afolder to hold the downloaded data
## dir.create("data",showWarnings = F) #create a folder to hold the data
## 
## lulc_url="https://github.com/adammwilson/DataScienceData/blob/master/inst/extdata/appeears/MCD12Q1.051_aid0001.nc?raw=true"
## lst_url="https://github.com/adammwilson/DataScienceData/blob/master/inst/extdata/appeears/MOD11A2.006_aid0001.nc?raw=true"
## 
## # download them
## download.file(lulc_url,destfile="data/MCD12Q1.051_aid0001.nc", mode="wb")
## download.file(lst_url,destfile="data/MOD11A2.006_aid0001.nc", mode="wb")

#' 
#' 
#' You should also edit your .gitignore file (in your tasks repository folder) to include `*data*` on one line. This will prevent git from adding these files.  
#' 
#' 
#' ## Load data into R
## ---- warning=F, message=F, results="hide"------------------------------------
lulc=stack("data/MCD12Q1.051_aid0001.nc",varname="Land_Cover_Type_1")
lst=stack("data/MOD11A2.006_aid0001.nc",varname="LST_Day_1km")

#' 
#' You will probably see some errors about 
#' 
#' ```
#' >>>> WARNING <<<  attribute longitude_of_projection_origin is an 8-byte value, but R"
#' [1] "does not support this data type. I am returning a double precision"
#' [1] "floating point, but you must be aware that this could lose precision!"
#' ```
#' 
#' You can safely ignore this.  
#' 
#' 
#' ## Explore LULC data
## ---- warning=F, message=FALSE,results='hide'---------------------------------
plot(lulc)

#'  
#' 
#' We'll just pick one year to work with to keep this simple:
## ---- warning=F---------------------------------------------------------------
lulc=lulc[[13]]
plot(lulc)

#' 
#' ### Process landcover data
#' 
#' Assign land cover clases from [MODIS website](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mcd12q1)
#' 
## -----------------------------------------------------------------------------
  Land_Cover_Type_1 = c(
    Water = 0, 
    `Evergreen Needleleaf forest` = 1, 
    `Evergreen Broadleaf forest` = 2,
    `Deciduous Needleleaf forest` = 3, 
    `Deciduous Broadleaf forest` = 4,
    `Mixed forest` = 5, 
    `Closed shrublands` = 6,
    `Open shrublands` = 7,
    `Woody savannas` = 8, 
    Savannas = 9,
    Grasslands = 10,
    `Permanent wetlands` = 11, 
    Croplands = 12,
    `Urban & built-up` = 13,
    `Cropland/Natural vegetation mosaic` = 14, 
    `Snow & ice` = 15,
    `Barren/Sparsely vegetated` = 16, 
    Unclassified = 254,
    NoDataFill = 255)

lcd=data.frame(
  ID=Land_Cover_Type_1,
  landcover=names(Land_Cover_Type_1),
  col=c("#000080","#008000","#00FF00", "#99CC00","#99FF99", "#339966", "#993366", "#FFCC99", "#CCFFCC", "#FFCC00", "#FF9900", "#006699", "#FFFF00", "#FF0000", "#999966", "#FFFFFF", "#808080", "#000000", "#000000"),
  stringsAsFactors = F)
# colors from https://lpdaac.usgs.gov/about/news_archive/modisterra_land_cover_types_yearly_l3_global_005deg_cmg_mod12c1
kable(head(lcd))

#' 
#' Convert LULC raster into a 'factor' (categorical) raster.  This requires building the Raster Attribute Table (RAT).  Unfortunately, this is a bit of manual process as follows.
## -----------------------------------------------------------------------------
# convert to raster (easy)
lulc=as.factor(lulc)

# update the RAT with a left join
levels(lulc)=left_join(levels(lulc)[[1]],lcd)


#' 

#' 
#' # Land Surface Temperature

#' 
#' ## Convert LST to Degrees C 
#' You can convert LST from Degrees Kelvin (K) to Celcius (C) with `offs()`.
#' 
## -----------------------------------------------------------------------------
offs(lst)=-273.15
plot(lst[[1:10]])

#' 
#' 
#' <div class="well">
#' 
#' # MODLAND Quality control
#' 
#' See a detailed explaination [here](https://lpdaac.usgs.gov/sites/default/files/public/modis/docs/MODIS_LP_QA_Tutorial-1b.pdf).  Some code below from [Steven Mosher's blog](https://stevemosher.wordpress.com/2012/12/05/modis-qc-bits/).
#' 
#' Expand this to learn more about MODIS quality control.  This is optional for this class, but important if you want to work with this kind of data 'for real'.
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">More Info</button>
#' <div id="demo1" class="collapse">
#' ## MOD11A2 (Land Surface Temperature) Quality Control
#' 
#' [MOD11A2 QC Layer table](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mod11a2)
#' 

#' 
#' ### LST QC data
#' 
#' QC data are encoded in 8-bit 'words' to compress information.
#' 

#' 

#' #### MODIS QC data are _Big Endian_
#' 
#' Format          Digits              value     sum
#' ----            ----                ----      ----
#' Little Endian   1 0 0 0 0 0 1 0     65        2^0 + 2^6
#' Big Endian      0 1 0 0 0 0 0 1     65        2^6 + 2^0
#' 
#' 
#' Reverse the digits with `rev()` and compare with QC table above.
#' 

#' QC for value `65`:
#' 
#' * LST produced, other quality, recommend examination of more detailed QA
#' * good data quality of L1B in 7 TIR bands
#' * average emissivity error <= 0.01
#' * Average LST error <= 2K
#' 
#' ### Filter the the lst data using the QC data
#' 

#' 
#' ### Select which QC Levels to keep

#' 
#' ### How many observations will be dropped?
#' 

#' 
#' Do you want to update the values you are keeping?
#' 
#' ### Filter the LST Data keeping only `keepvals`
#' 
#' These steps take a couple minutes.  
#' 
#' Make logical flag to use for mask

#' 
#' Plot the mask

#' 
#' 
#' Mask the lst data using the QC data and overwrite the original data.

#' 
#' </div>
#' </div>
#' 
#' 
#' 
#' ## Add Dates to Z (time) dimension
#' 
#' The default layer names of the LST file include the date as follows:
#' 

#' 
#' Convert those values to a proper R Date format by dropping the "X" and using `as.Date()`.
## -----------------------------------------------------------------------------
tdates=names(lst)%>%
  sub(pattern="X",replacement="")%>%
  as.Date("%Y.%m.%d")

names(lst)=1:nlayers(lst)
lst=setZ(lst,tdates)

#' 
#' 
#' ## Part 1: Extract timeseries for a point
#' 
#' Extract LST values for a single point and plot them.
#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo2">Show Hints</button>
#' <div id="demo2" class="collapse">
#' 
#' 1. Use `lw=SpatialPoints(data.frame(x= -78.791547,y=43.007211))` to define a new Spatial Point at that location.
#' 2. Set the projection of your point with `projection()` to `"+proj=longlat"`.
#' 3. Transform the point to the projection of the raster using `spTransform()`.
#' 4. Extract the LST data for that location with: `extract(lst,lw,buffer=1000,fun=mean,na.rm=T)`.  You may want to transpose them with `t()` to convert it from a wide matrix to long vector.
#' 5. Extract the dates for each layer with `getZ(lst)` and combine them into a data.frame with the transposed raster values.  You could use `data.frame()`, `cbind.data.frame()` or `bind_cols()` to do this. The goal is to make a single dataframe with the dates and lst values in columns.
#' 6. Plot it with `ggplot()` including points for the raw data and a smooth version as a line.  You will probably want to adjust both `span` and `n` in `geom_smooth`.
#' 
#' </div>
#' </div>
#' 
#' Your graph should look like this:

#' 
#' See the `library(rts)` for more timeseries related functions.
#' 
#' 
#' # Part 2: Summarize weekly data to monthly climatologies
#' 
#' Now we will use a function called `stackApply()` to calculate monthly mean land surface temperature.
#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo3">Show Hint</button>
#' <div id="demo3" class="collapse">
#' 
#' Hints:
#' 
#' 1. First make a variable called `tmonth` by converting the dates to months using `as.numeric(format(getZ(lst),"%m"))`
#' 2. Use `stackApply()` to summarize the mean value per month (using the `tmonth` variable you just created) and save the results as `lst_month`.
#' 3. Set the names of the layers to months with `names(lst_month)=month.name`
#' 4. Plot the map for each month with `gplot()` in the RasterVis Package.
#' 5. Calculate the monthly mean for the entire image with `cellStats(lst_month,mean)`
#' 
#' </div>
#' </div>
#' 
#' A plot of the monthly climatologies will look like this:

#' 
#' And the table should be as follows:

#' 
#' 
#' ## Part 3: Summarize Land Surface Temperature by Land Cover
#' 
#' Make a plot and table to contrast Land Surface Temperature in _Urban & built-up_ and _Deciduous Broadleaf forest_ areas. 
#' 
#' <div class="well">
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo4">Show Hints</button>
#' <div id="demo4" class="collapse">
#' 
#' 1. Resample `lc` to `lst` grid using `resample()` with `method=ngb`.
#' 2. Extract the values from `lst_month` and `lulc2` into a data.frame as follows:
#'    ``` 
#'    lcds1=cbind.data.frame(
#'    values(lst_month),
#'    ID=values(lulc2[[1]]))%>%
#'    na.omit()
#'    ```
#' 3. Gather the data into a 'tidy' format using `gather(key='month',value='value,-ID)`. 
#' 4. Use `mutate()` to convert ID to numeric (e.g. `ID=as.numeric(ID)` and month to an _ordered_ factor with `month=factor(month,levels=month.name,ordered=T)`.
#' 5. do a left join with the `lcd` table you created at the beginning.
#' 6. Use `filter()` to keep only `landcover%in%c("Urban & built-up","Deciduous Broadleaf forest")`
#' 7. Develop a ggplot to illustrate the monthly variability in LST between the two land cover types.  The exact form of plot is up to you.  Experiment with different geometries, etc.
#' 
#' </div>
#' </div>
#' 

#' 
#' One potential plot is as follows:
#' 
## ----fig.height=6, echo=F, message=F------------------------------------------
lcds2 %>% 
  filter(landcover%in%c("Urban & built-up","Deciduous Broadleaf forest")) %>% 
  ggplot(aes(y=value,x=month))+
  facet_wrap(~landcover)+
  geom_point(alpha=.5,position="jitter")+
  geom_smooth()+
  geom_violin(alpha=.5,col="red",scale = "width",position="dodge")+
  theme(axis.text.x=element_text(angle=90, hjust=1))+
  ylab("Monthly Mean Land Surface Temperature (C)")+
  xlab("Month")+
  ggtitle("Land Surface Temperature in Urban and Forest areas in Buffalo, NY")

#' 
#' 
#' 
#' <div class="well">
#' 
#' If you have extra time, try to reproduce the table in this box.
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo5">Extra time?</button>
#' <div id="demo5" class="collapse">
#' 
#' This is a more complicated table which involves using the `zonal` function to aggregate, followed by `gather`ing, `spread`ing, and creative `paste`ing to combine text fields.
#' 

#' 

#' 
#' 
#' 

#' 
#' </div>
#' </div>
#' 
