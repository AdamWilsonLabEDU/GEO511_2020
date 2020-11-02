---
title:  Processing Data from Satellite Remote Sensing
type: Presentation
week: 10
---




## Course Schedule
<iframe
  src="http://wilsonlab.io/GEO511/Schedule.html"
  width="100%" height="800">
</iframe>
[source](http://wilsonlab.io/GEO511/Schedule.html)

## Resource Presentations

<iframe
  src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&single=true"
  width="100%" height="800">
</iframe>
[source](https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&single=true)

## Case Study: Let's pick a winner!

<iframe
  src="https://wheelofnames.com/bw4-gdt"
  width="100%" height="500">
</iframe>
<iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSm_SdDqTPR5j7dXg_VeaUaKSxCVevvytsWQYKcT_kBCgOkKMsouHfafZ6wtbVjXaUSYxODReZgxAC3/pubhtml?gid=868447735&amp;single=true&amp;widget=true&amp;headers=false" style="height: 200px; width: 100%;"></iframe>

## Next Week's Case Study

<iframe
  src="http://wilsonlab.io/GEO511/CS_10.html"
  width="100%" height="800">
</iframe>
[source](http://wilsonlab.io/GEO511/CS_10.html)


## Objectives

* Brief introduction to remote sensing
* Obtaining NASA remote sensing data
* MODIS
* MODIS data processing


## Active Earth Observing Satellites (EOS) (as of 8/31/2015)

* Total number of operating satellites: 2,062
    * United States: 901
    * China: 299
    * Russia: 153
* Total Earth Observing Satellites (EOS): 710

From the [Union of Concerned Scientists Satellite Database](http://www.ucsusa.org/nuclear-weapons/space-weapons/satellite-database.html#.VjzlnoS98VQ) and [Pixalytics Blog](http://www.pixalytics.com/blog/)

## Debris & Satellites in low Earth orbit

<img src="PS_10_assets//satellites.jpg" alt="alt text" width="75%">

Image courtesy of [European Space Agency](http://www.esa.int/spaceinimages/Images/2008/03/Debris_objects_-_mostly_debris_-_in_low_Earth_orbit_LEO_-_view_over_the_equator)


## NASA's Earth Observing System

<img src="PS_10_assets//eos.jpg" alt="alt text" width="75%">

## Electromagnetic Radiation
<img src="PS_10_assets/spectrum.png" alt="alt text" width="100%">

## EarthData

[EarthData.nasa.gov](https://earthdata.nasa.gov)

Datasets, news, articles, information

<img src="PS_10_assets//Earthdata1.png" alt="alt text" width="75%">

## EarthData

[EarthData.nasa.gov](https://earthdata.nasa.gov)

Datasets, news, articles, information

<img src="PS_10_assets//Earthdata2.png" alt="alt text" width="75%">

# Image Processing in R

## Raster Package

```r
library(raster)
```

```
## Loading required package: sp
```

```r
# Blue
b2 <- raster('data/rs/LC08_044034_20170614_B2.tif')
# Green
b3 <- raster('data/rs/LC08_044034_20170614_B3.tif')
# Red
b4 <- raster('data/rs/LC08_044034_20170614_B4.tif')
# Near Infrared (NIR)
b5 <- raster('data/rs/LC08_044034_20170614_B5.tif')
b2
```

```
## class      : RasterLayer 
## dimensions : 1245, 1497, 1863765  (nrow, ncol, ncell)
## resolution : 30, 30  (x, y)
## extent     : 594090, 639000, 4190190, 4227540  (xmin, xmax, ymin, ymax)
## crs        : +proj=utm +zone=10 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
## source     : /Users/adamw/Documents/repos/GEO511/data/rs/LC08_044034_20170614_B2.tif 
## names      : LC08_044034_20170614_B2 
## values     : 0.0748399, 0.7177562  (min, max)
```

## Metadata


```r
# coordinate reference system (CRS)
crs(b2)
```

```
## CRS arguments:
##  +proj=utm +zone=10 +datum=WGS84 +units=m +no_defs +ellps=WGS84
## +towgs84=0,0,0
```

```r
# Number of cells, rows, columns
ncell(b2)
```

```
## [1] 1863765
```

```r
dim(b2)
```

```
## [1] 1245 1497    1
```

```r
# spatial resolution
res(b2)
```

```
## [1] 30 30
```

```r
# Number of bands
nlayers(b2)
```

```
## [1] 1
```

```r
# Do the bands have the same extent, number of rows and columns, projection, resolution, and origin 
compareRaster(b2,b3)
```

```
## [1] TRUE
```

## Check the properties of the RasterStack

```r
s <- stack(b5, b4, b3)
s
```

```
## class      : RasterStack 
## dimensions : 1245, 1497, 1863765, 3  (nrow, ncol, ncell, nlayers)
## resolution : 30, 30  (x, y)
## extent     : 594090, 639000, 4190190, 4227540  (xmin, xmax, ymin, ymax)
## crs        : +proj=utm +zone=10 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
## names      : LC08_044034_20170614_B5, LC08_044034_20170614_B4, LC08_044034_20170614_B3 
## min values :            0.0008457669,            0.0208406653,            0.0425921641 
## max values :               1.0124315,               0.7861769,               0.6924697
```

## Import multiple bands

```r
filenames <- paste0('data/rs/LC08_044034_20170614_B', 1:11, ".tif")
filenames
```

```
##  [1] "data/rs/LC08_044034_20170614_B1.tif" 
##  [2] "data/rs/LC08_044034_20170614_B2.tif" 
##  [3] "data/rs/LC08_044034_20170614_B3.tif" 
##  [4] "data/rs/LC08_044034_20170614_B4.tif" 
##  [5] "data/rs/LC08_044034_20170614_B5.tif" 
##  [6] "data/rs/LC08_044034_20170614_B6.tif" 
##  [7] "data/rs/LC08_044034_20170614_B7.tif" 
##  [8] "data/rs/LC08_044034_20170614_B8.tif" 
##  [9] "data/rs/LC08_044034_20170614_B9.tif" 
## [10] "data/rs/LC08_044034_20170614_B10.tif"
## [11] "data/rs/LC08_044034_20170614_B11.tif"
```

```r
landsat <- stack(filenames)
landsat
```

```
## class      : RasterStack 
## dimensions : 1245, 1497, 1863765, 11  (nrow, ncol, ncell, nlayers)
## resolution : 30, 30  (x, y)
## extent     : 594090, 639000, 4190190, 4227540  (xmin, xmax, ymin, ymax)
## crs        : +proj=utm +zone=10 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
## names      : LC08_044034_20170614_B1, LC08_044034_20170614_B2, LC08_044034_20170614_B3, LC08_044034_20170614_B4, LC08_044034_20170614_B5, LC08_044034_20170614_B6, LC08_044034_20170614_B7, LC08_044034_20170614_B8, LC08_044034_20170614_B9, LC08_044034_20170614_B10, LC08_044034_20170614_B11 
## min values :            9.641791e-02,            7.483990e-02,            4.259216e-02,            2.084067e-02,            8.457669e-04,           -7.872183e-03,           -5.052945e-03,            3.931751e-02,           -4.337332e-04,             2.897978e+02,             2.885000e+02 
## max values :              0.73462820,              0.71775615,              0.69246972,              0.78617686,              1.01243150,              1.04320455,              1.11793602,              0.82673049,              0.03547901,             322.43139648,             317.99530029
```

## Blue, Green, Red, NIR

```r
par(mfrow = c(1,2))
plot(b4, main = "Red", col = gray(0:100 / 100))
plot(b5, main = "NIR", col = gray(0:100 / 100))
```

![](PS_10_RS_files/figure-revealjs/unnamed-chunk-6-1.png)


## Plotting

```r
landsatRGB <- stack(b4, b3, b2)

par(mfrow = c(1,2))
plotRGB(landsatRGB, axes=TRUE, stretch="lin", main="Landsat True Color")

landsatFCC <- stack(b5, b4, b3)
plotRGB(landsatFCC, axes=TRUE, stretch="lin", main="Landsat False Color")
```

![](PS_10_RS_files/figure-revealjs/unnamed-chunk-7-1.png)

## Vegetation indices



```r
fndvi <- function(x, y) {
    (x - y) / (x + y)
}
ndvi <- overlay(landsat[[5]], landsat[[4]], fun=fndvi)
plot(ndvi, col=rev(terrain.colors(10)), main="Landsat-NDVI")
```

![](PS_10_RS_files/figure-revealjs/unnamed-chunk-9-1.png)

## More resources

* [_Spatial Data Science_ chapter on Remote Sensing Image Analysis](https://rspatial.org/raster/rs/index.html)
* R Packages:
   * [rLandsat](https://github.com/atlanhq/rLandsat)
   ![rLandsat flow](https://camo.githubusercontent.com/2577927b74027f444f39a652d2de0cf7c773cc4b/68747470733a2f2f692e696d6775722e636f6d2f636d6a746567472e706e67)
   * [MODIStsp](https://ropensci.github.io/MODIStsp/): automatizing the creation of time series of raster images derived from MODIS Land Products data.
   * [RStoolbox](http://bleutner.github.io/RStoolbox/): RS data processing
   * [hsdar](https://cran.r-project.org/package=hsdar): Hyperspectral data
   * [rasterVis](https://oscarperpinan.github.io/rastervis/): Visualization 

# MODIS

## Moderate Resolution Imaging Spectroradiometer (MODIS)


<img src="PS_10_assets//TerraLaunch.png" alt="alt text" width="75%">

2 Satellites _Terra_ launched in 1999, _Aqua_ in 2002.


## Technical Details: swath

<img src="PS_10_assets//terra.png" alt="alt text" width="75%">

Viewing swath width of 2,330 km

Technical Details: spatial coverage

---

<img src="PS_10_assets//first_complete_day_from_modis.jpg" alt="alt text" width="75%">

Covers Earth every one to two days

Technical Details: spectral coverage

---

<img src="PS_10_assets//spectrum2.png" alt="alt text" width="75%">

36 spectral bands between 0.405 and 14.385 µm

Technical Details: spatial resolution

---

<img src="PS_10_assets//resolution.jpg" alt="alt text" width="50%">

3 spatial resolutions -- 250m, 500m, and 1,000m 

## MODIS Data Processing

* Tracking and Data Relay Satellite System in White Sands, New Mexico
* EOS Data and Operations System @ Goddard Space Flight Center in Greenbelt, MD
* MODIS Adaptive Processing System (MODAPS)
* 3 DAACs for distribution

## MODIS products (a subset...)

### Atmosphere

* Aerosol & Clouds
* Total Precipitable Water

### Cryosphere Products

* Snow Cover
* Sea Ice and Ice Surface Temperature

### Ocean Products

* Sea Surface Temperature
* Sub-surface Chlorophyll-a Concentration
* Particulate Carbon
* Photosynthetically Available Radiation

---

### Land Products

* Surface Reflectance
* Land Surface Temperature and Emissivity
* Land Cover Products
* Vegetation Index Products (NDVI and EVI)
* Thermal Anomalies - Active Fires
* Photosynthetically Active Radiation (FPAR) / Leaf Area Index (LAI)
* Evapotranspiration
* Primary Productivity
* Vegetation Continuous Fields
* Water Mask
* Burned Area Product

## Example product workflow

 <img src="PS_10_assets//VI_flow.png" alt="alt text" heigt="90%">

 
MODIS Products used to generate vegetation indices. From the [MOD13 Algorithm Theoretical Basis Document](http://modis.gsfc.nasa.gov/data/atbd/atbd_mod13.pdf).  

# Data

## Data formats

Most NASA EOS data distributed as HDF files, which are very similar to netCDF.

<img src="PS_10_assets//NETCDF4Library.jpg" alt="alt text" width="75%">

## NetCDF / HDF

<img src="PS_10_assets//netcdf2.png" alt="alt text" width="75%">


## Reading EO Data

`raster` package functions can read NetCDF/HDF files if `ncdf4` package is installed.

```r
ncfile="data/MOD11A2.006_aid0001.nc"
nc=ncdf4::nc_open(ncfile,verbose = F)
str(nc$var)
```

```
## List of 3
##  $ crs        :List of 20
##   ..$ id                :List of 5
##   .. ..$ id         : num 0
##   .. ..$ group_index: num -1
##   .. ..$ group_id   : int 65536
##   .. ..$ list_index : num 1
##   .. ..$ isdimvar   : logi FALSE
##   .. ..- attr(*, "class")= chr "ncid4"
##   ..$ name              : chr "crs"
##   ..$ ndims             : int 0
##   ..$ natts             : int 10
##   ..$ size              : num 1
##   ..$ dimids            : int NA
##   ..$ prec              : chr "byte"
##   ..$ units             : chr ""
##   ..$ longname          : chr "crs"
##   ..$ group_index       : int 1
##   ..$ chunksizes        : int NA
##   ..$ storage           : int 1
##   ..$ shuffle           : int 0
##   ..$ compression       : logi NA
##   ..$ dims              : list()
##   ..$ unlim             : logi FALSE
##   ..$ make_missing_value: logi FALSE
##   ..$ missval           : logi NA
##   ..$ hasAddOffset      : logi FALSE
##   ..$ hasScaleFact      : logi FALSE
##   ..- attr(*, "class")= chr "ncvar4"
##  $ LST_Day_1km:List of 24
##   ..$ id                :List of 5
##   .. ..$ id         : num 4
##   .. ..$ group_index: num -1
##   .. ..$ group_id   : int 65536
##   .. ..$ list_index : num 2
##   .. ..$ isdimvar   : logi FALSE
##   .. ..- attr(*, "class")= chr "ncid4"
##   ..$ name              : chr "LST_Day_1km"
##   ..$ ndims             : int 3
##   ..$ natts             : int 14
##   ..$ size              : int [1:3] 42 47 811
##   ..$ dimids            : int [1:3] 2 1 0
##   ..$ prec              : chr "int"
##   ..$ units             : chr "K"
##   ..$ longname          : chr "8-day daytime 1km grid Land-surface Temperature"
##   ..$ group_index       : int 1
##   ..$ chunksizes        : int [1:3] 21 24 406
##   ..$ storage           : int 2
##   ..$ shuffle           : int 1
##   ..$ compression       : int 4
##   ..$ dims              : list()
##   ..$ dim               :List of 3
##   .. ..$ :List of 10
##   .. .. ..$ name         : chr "xdim"
##   .. .. ..$ len          : int 42
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 2
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 3
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "m"
##   .. .. ..$ vals         : num [1:42(1d)] 1373722 1374649 1375575 1376502 1377429 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   .. ..$ :List of 10
##   .. .. ..$ name         : chr "ydim"
##   .. .. ..$ len          : int 47
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 1
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 2
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "m"
##   .. .. ..$ vals         : num [1:47(1d)] 2362432 2361505 2360578 2359652 2358725 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   .. ..$ :List of 11
##   .. .. ..$ name         : chr "time"
##   .. .. ..$ len          : int 811
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 0
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 1
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "days since 2000-01-01 00:00:00"
##   .. .. ..$ calendar     : chr "julian"
##   .. .. ..$ vals         : int [1:811(1d)] 48 56 64 72 80 88 96 104 112 120 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   ..$ varsize           : int [1:3] 42 47 811
##   ..$ unlim             : logi FALSE
##   ..$ make_missing_value: logi TRUE
##   ..$ missval           : int 0
##   ..$ hasAddOffset      : logi TRUE
##   ..$ addOffset         : num 0
##   ..$ hasScaleFact      : logi TRUE
##   ..$ scaleFact         : num 0.02
##   ..- attr(*, "class")= chr "ncvar4"
##  $ QC_Day     :List of 22
##   ..$ id                :List of 5
##   .. ..$ id         : num 5
##   .. ..$ group_index: num -1
##   .. ..$ group_id   : int 65536
##   .. ..$ list_index : num 3
##   .. ..$ isdimvar   : logi FALSE
##   .. ..- attr(*, "class")= chr "ncid4"
##   ..$ name              : chr "QC_Day"
##   ..$ ndims             : int 3
##   ..$ natts             : int 7
##   ..$ size              : int [1:3] 42 47 811
##   ..$ dimids            : int [1:3] 2 1 0
##   ..$ prec              : chr "short"
##   ..$ units             : chr ""
##   ..$ longname          : chr "Quality control for daytime LST and emissivity"
##   ..$ group_index       : int 1
##   ..$ chunksizes        : int [1:3] 42 47 811
##   ..$ storage           : int 2
##   ..$ shuffle           : int 1
##   ..$ compression       : int 4
##   ..$ dims              : list()
##   ..$ dim               :List of 3
##   .. ..$ :List of 10
##   .. .. ..$ name         : chr "xdim"
##   .. .. ..$ len          : int 42
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 2
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 3
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "m"
##   .. .. ..$ vals         : num [1:42(1d)] 1373722 1374649 1375575 1376502 1377429 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   .. ..$ :List of 10
##   .. .. ..$ name         : chr "ydim"
##   .. .. ..$ len          : int 47
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 1
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 2
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "m"
##   .. .. ..$ vals         : num [1:47(1d)] 2362432 2361505 2360578 2359652 2358725 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   .. ..$ :List of 11
##   .. .. ..$ name         : chr "time"
##   .. .. ..$ len          : int 811
##   .. .. ..$ unlim        : logi FALSE
##   .. .. ..$ group_index  : int 1
##   .. .. ..$ group_id     : int 65536
##   .. .. ..$ id           : int 0
##   .. .. ..$ dimvarid     :List of 5
##   .. .. .. ..$ id         : int 1
##   .. .. .. ..$ group_index: int 1
##   .. .. .. ..$ group_id   : int 65536
##   .. .. .. ..$ list_index : num -1
##   .. .. .. ..$ isdimvar   : logi TRUE
##   .. .. .. ..- attr(*, "class")= chr "ncid4"
##   .. .. ..$ units        : chr "days since 2000-01-01 00:00:00"
##   .. .. ..$ calendar     : chr "julian"
##   .. .. ..$ vals         : int [1:811(1d)] 48 56 64 72 80 88 96 104 112 120 ...
##   .. .. ..$ create_dimvar: logi TRUE
##   .. .. ..- attr(*, "class")= chr "ncdim4"
##   ..$ varsize           : int [1:3] 42 47 811
##   ..$ unlim             : logi FALSE
##   ..$ make_missing_value: logi TRUE
##   ..$ missval           : int 0
##   ..$ hasAddOffset      : logi FALSE
##   ..$ hasScaleFact      : logi FALSE
##   ..- attr(*, "class")= chr "ncvar4"
```

## Read NetCDF with raster()

```r
lst=stack(ncfile,varname="LST_Day_1km")
```

```r
lst
```

```
## class      : RasterStack 
## dimensions : 47, 42, 1974, 811  (nrow, ncol, ncell, nlayers)
## resolution : 926.6254, 926.6254  (x, y)
## extent     : 1373259, 1412177, 2319343, 2362895  (xmin, xmax, ymin, ymax)
## crs        : +proj=aea +lat_0=23 +lat_1=29.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=WGS84 +lat_2=45.5 
## names      : X2000.02.18, X2000.02.26, X2000.03.05, X2000.03.13, X2000.03.21, X2000.03.29, X2000.04.06, X2000.04.14, X2000.04.22, X2000.04.30, X2000.05.08, X2000.05.16, X2000.05.24, X2000.06.01, X2000.06.09, ... 
## Date        : 2000-02-18 - 2017-10-16 (range)
```


## Plot Raster Stack




```r
lst[[1:10]] %>% gplot()+
    geom_raster(aes(fill=value))+
    facet_wrap(~variable,nrow=1)+
    coord_equal()+
    theme(axis.text=element_blank())
```

![](PS_10_RS_files/figure-revealjs/unnamed-chunk-14-1.png)

## Collection-Level Naming Conventsions 

`MODIS/Terra Surface Reflectance 8-Day L3 Global 500m SIN Grid V005`

* `MODIS/Terra` - Instrument/Sensor
* `Surface Reflectance` - Geophysical Parameter
* `8-Day` - Temporal Resolution
* `L3` - Processing Level
* `Global` - Global or Swath
* `500m` - Spatial Resolution
* `SIN Grid` - Gridded or Not
* `V005` - Collection Version

## MODIS Gridding system


![](PS_10_assets/modgrid.gif)


## Filename Conventions


`MOD09A1.A2006001.h08v05.005.2006012234657.hdf`

* `MOD09A1` - Product Short Name
* `.A2006001` - Julian Date of Acquisition (A-YYYYDDD)
* `.h08v05` - Tile Identifier (horizontalXXverticalYY)
* `.005` - Collection Version
* `.2006012234567` - Julian Date of Production (YYYYDDDHHMMSS)
* `.hdf` - Data Format (HDF-EOS)

## MODIS Temporal Resolution


* Daily
* 8-Day
* 16-Day
* Monthly
* Quarterly
* Yearly

## MODIS Spatial Resolution


* **Bands 1–2**  250-meter
* **Bands 3–7**  500-meter
* **Bands 8–36**  1000-meter

## MODIS Data

### Distributed Active Archive Centers (DAACs)

* **Level 1 data:** geolocation, cloud mask, and atmosphere products [ladsweb.nascom.nasa.gov](http://ladsweb.nascom.nasa.gov/)
* **Land products:** [lpdaac.usgs.gov](https://lpdaac.usgs.gov/)
* **Cryosphere (snow/ice) products:** [nsidc.org/daac/modis](http://nsidc.org/daac/modis/index.html)
* **Ocean color and sea surface temperature:** [oceancolor.gsfc.nasa.gov](http://oceancolor.gsfc.nasa.gov/)


## Accessing data


The Land Processes Distributed Active Archive Center has a nice "Data Discovery" Tool:
![](PS_10_assets/lpdaac.png)

## MODIS Products Table

Lists [all available MODIS land products]()

![](PS_10_assets/lpdaac1.png)

## Annual Land Cover Type Description

![](PS_10_assets/lpdaac2.png)


## Detailed layer information

![](PS_10_assets/lpdaac3.png)


## Data access links

![](PS_10_assets/lpdaac4.png)

Downloading: `http`/`ftp` access

---

![](PS_10_assets/lpdaac5.png)

or the [LP DAAC2Disk Download Manager](https://lpdaac.usgs.gov/sites/default/files/public/datapool/DAAC2DiskUserGuide.pdf) which builds a download script.

## MODIS Reprojection Tool

Available at [lpdaac.usgs.gov/tools/modis_reprojection_tool](https://lpdaac.usgs.gov/tools/modis_reprojection_tool).

![](PS_10_assets/MRT1.png)

## MODIS Reprojection Tool:  Subset & Reproject


![](PS_10_assets/MRT.png)

`MCD12Q1.A2012001.h12v04.051.2014288200441.hdf`

## Application for Extracting and Exploring Analysis Ready Samples (AppEEARS)

![](PS_10_assets/appeears.png)

[https://lpdaacsvc.cr.usgs.gov/appeears/](https://lpdaacsvc.cr.usgs.gov/appeears/)

* Provide access to regional subsets
* Merge across tiles
* Download full time series

## Data Subset

![](PS_10_assets/appeears2.png)

Submit and wait for results...

## Case Study

Analysis of Land Use Land Cover and Land Surface Temperature across Buffalo using MODIS timeseries.


## Presentation Credits

* Images: NASA
* Some contents from Steve Ackerman `stevea@ssec.wisc.edu`, Cooperative Institute for Meteorological Satellite Studies, University of Wisconsin-Madison
