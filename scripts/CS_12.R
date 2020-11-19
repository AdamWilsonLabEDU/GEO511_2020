#' ---
#' title: Dynamic HTML graph of Daily Temperatures
#' subtitle: Using DyGraph library.
#' week: 12
#' type: Case Study
#' reading:
#'    - Browse the [HTML Widgets page](http://gallery.htmlwidgets.org/) for many more examples. Take notes in your readme.md about potential uses in your project.
#'    - Explore the [DyGraphs webpage](http://rstudio.github.io/dygraphs/)
#' tasks:
#'    - Download daily weather data for Buffalo, NY using an API
#'    - Generate a dynamic html visualization of the timeseries. 
#'    - Save the graph to your project folder using Export->Save as Webpage
#' ---
#' 
#' 

#' 
#' # Reading
#' 

#' 
#' 
#' # Tasks
#' 

#' 
#' ## Background
#' In this session you will explore several ways to generate dynamic and interactive data displays.  These include making maps and graphs that you can pan/zoom, select features for more information, and interact with in other ways.  The most common output format is HTML, which can easily be embedded in a website (such as your final project!).
#' 
## ----cache=F, message=F,warning=FALSE-----------------------------------------
library(dplyr)
library(ggplot2)
library(ggmap)
library(htmlwidgets)
library(widgetframe)

#' 
#' If you don't have the packages above, install them in the package manager or by running `install.packages("widgetframe")`, etc. 
#' 
#' # Objective
#' > Make a dygraph of recent daily maximum temperature data from Buffalo, NY.
#' 
#' ## Detailed Steps
#' 
#' First use the following code to download the daily weather data.
#' 
## ---- messages=F, warning=F, results="hide"-----------------------------------
library(tidyverse)
library(rnoaa)
library(xts)
library(dygraphs)
 
d=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("TMAX"),
                   keep_flags=T) %>% 
   mutate(date=as.Date(date),
          tmax=as.numeric(tmax)/10) #Divide the tmax data by 10 to convert to degrees.

#' 
#' Remaining steps:
#' 
#' 1. Convert `d` into an `xts` time series object using `xts()`.  You will need to specifify which column has the data (`d$tmax`) and `order.by=d$date`.   See `?xts` for help. 
#' 2. Use `dygraph()` to draw the plot
#' 3. Set the title of the dygraph to be `main="Daily Maximum Temperature in Buffalo, NY"`
#' 4. Add a `dyRangeSelector()` with a `dateWindow` of `c("2020-01-01", "2020-10-31")`
#' 5. Explore other options.  You could download another variable (precipitation?) and add it to the plot. Or imagine another way to visualize the data using one of the other interactive libraries.  
#' 
#' ## Output
#' 
#' At a minimum, your final graph should look something like this:
#' 

#' 
#' What other visualizations can you make with these data?
