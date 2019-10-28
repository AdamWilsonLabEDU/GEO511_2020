---
title: "Tasklist"
output:
  html_document:
    toc: true
    toc_depth: 1
---



Below are a set of tasks that we will work on in class (either alone or in small groups).



___
## [ CS_01 :  Your first script ]( ./CS_01.html ) 
   
 
  Write a script that reads in data, calculates a statistic, and makes a plot.  
 
 <a class="btn btn-link" href="./CS_01.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i1">Preview Readings & Tasks </button><div id="i1" class="collapse">
## Readings
- Datacamp's [_How to Make a Histogram with Basic R_](https://www.datacamp.com/community/tutorials/make-histogram-basic-r)
- Datacamp's [_How to Make a Histogram with ggplot_](https://www.datacamp.com/community/tutorials/make-histogram-ggplot2)

## Tasks
- Create a new R script in RStudio
- Load the iris dataset with `data(iris)`
- Read the help file for the function that calculates the mean ( you can run `?mean` or use the GUI).
- Calculate the mean of the `Petal.Length` field
- Plot the distribution of the `Petal.Length` column as a histogram
- Save the script
- Click 'Source' in RStudio to run your script from beginning to end
</div>
___
## [ TK_01 :  Getting Started ]( ./TK_01.html ) 
   
 
    
 
 <a class="btn btn-link" href="./TK_01.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i2">Preview Readings & Tasks </button><div id="i2" class="collapse">
## Readings
- Chapters [1-2 in R4DS](http://r4ds.had.co.nz){target='blank'}

## Tasks
- Read the [course syllabus](Syllabus.html) and make sure you understand our class routine and grading
- Install R on your computer [from here](https://cloud.r-project.org){target='blank'}
- Install RStudio Desktop (free version) on your computer [from this source](https://www.rstudio.com/products/rstudio/download/){target='blank'}
- Join the Slack Channel by following the link sent via email (ask if you did not receive this link)
- Join our DataCamp class following the link sent via email.  Start working on the first assignment (try to finish by Thursday)
- Create a [GitHub account](https://github.com/join?source=header-home){target="blank"} and submit your github username [here](https://forms.gle/wDUSvhEQfRYGHN8u8). This username may follow you for years, use something professional that you will want to share with your future employer.
</div>
___
## [ CS_02 :  My grandfather says climate is cooling ]( ./CS_02.html ) 
   
 
  Import data and plot a timeseries  
 
 <a class="btn btn-link" href="./CS_02.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i3">Preview Readings & Tasks </button><div id="i3" class="collapse">
## Readings
- The [ggplot2 vignette](https://ggplot2.tidyverse.org/)

## Tasks
- Create a new R script in RStudio
- Load data from a comma-separated-values formatted text file hosted on a website
- Graph the annual mean temperature in June, July and August (`JJA`) using ggplot
- Add a smooth line with `geom_smooth()`
- Add informative axis labels using `xlab()` and `ylab()` including [units](https://data.giss.nasa.gov/cgi-bin/gistemp/stdata_show.cgi?id=425003010120&dt=1&ds=5)
- Add a graph title with `ggtitle()`
- Save a graphic to a png file using `png()` and `dev.off()` OR [`ggsave`](https://ggplot2.tidyverse.org/reference/ggsave.html)
- Save the script
- Click 'Source' in RStudio to run the script from beginning to end to re-run the entire process
</div>
___
## [ TK_02 :  Graphics Background and Getting started with RStudio ]( ./TK_02.html ) 
   
 
    
 
 <a class="btn btn-link" href="./TK_02.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i4">Preview Readings & Tasks </button><div id="i4" class="collapse">
## Readings
- Chapters [3 in R4DS](http://r4ds.had.co.nz)
- Chapter [8 R for Data Science - Projects](http://r4ds.had.co.nz/workflow-projects.html){target='blank'}

## Tasks
- Watch [John Rauser Talk](https://youtu.be/fSgEeI2Xpdc){target='blank'}
- Watch [Introduction to RStudio](https://resources.rstudio.com/wistia-rstudio-essentials-2/rstudioessentialsprogrammingpart1-2)
</div>
___
## [ CS_03 :  Wealth over time ]( ./CS_03.html ) 
   
 
  Data wrangling plus more advanced ggplot  
 
 <a class="btn btn-link" href="./CS_03.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i5">Preview Readings & Tasks </button><div id="i5" class="collapse">
## Readings
- The [ggplot2 vignette](https://ggplot2.tidyverse.org/){target='blank'}
- R4DS [Chapter 3 - Data visualization](http://r4ds.had.co.nz/data-visualisation.html){target='blank'}
- The [Hans Rosling The River of Myths](https://youtu.be/OwII-dwh-bk){target='blank'}
- Watch the [Hons Rosling video](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen){target="blank"}

## Tasks
- Recreate layered graphics with ggplot including raw and transformed data
- Save graphical output as a .png file
- Save your script as a .R or .Rmd in your course repository
</div>
___
## [ TK_03 :  Git Repository ]( ./TK_03.html ) 
   
 
  Start using Github to manage course materials  
 
 <a class="btn btn-link" href="./TK_03.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i6">Preview Readings & Tasks </button><div id="i6" class="collapse">
## Readings
- Chapters [4-5 in R4DS](http://r4ds.had.co.nz){target='blank'}
- Chapters [4-8 in Happy Git and Github for the useR - Installation](http://happygitwithr.com/installation-pain.html){target='blank'}
- Chapters [13-15 in Happy Git and Github for the useR - Installation](http://happygitwithr.com){target='blank'}

## Tasks
- RStudio and [the Git GUI](https://www.youtube.com/watch?v=E2d91v1Twcc){target='blank'}
- Install git on your computer
- Configure Git
- Make sure git works in R-Studio
- Optionally sign up for the [GitHub Education pack](https://education.github.com/pack)
- Click on [this link to access the course repository](https://classroom.github.com/a/eekUpAO-)
- Create a new project in Rstudio and connect it to the new repository in GitHub. Helpful instructions are [here](http://happygitwithr.com/rstudio-git-github.html#clone-the-new-github-repository-to-your-computer-via-rstudio)
- Edit the README.md file in your repository to include a brief description of the repository (e.g. "Coursework for Spatial Data Science").
- Stage and Commit your changes to Git (using the git tab in the upper right of RStudio)
- Push the repository up to GitHub
- Confirm that the changes are visible on your github page
</div>
___
## [ CS_04 :  Farthest airport from New York City ]( ./CS_04.html ) 
   
 
  Joining Relational Data  
 
 <a class="btn btn-link" href="./CS_04.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i7">Preview Readings & Tasks </button><div id="i7" class="collapse">
## Readings
- R4DS [Chapter 13 - Relational Data](http://r4ds.had.co.nz/relational-data.html){target='blank'}

## Tasks
- Join two datasets using a common column
- Answer a question that requires understanding how multiple tables are related
- Save your script as a .R or .Rmd in your course repository
</div>
___
## [ TK_04 :  Data Wrangling 2 ]( ./TK_04.html ) 
   
 
  Joining data  
 
 <a class="btn btn-link" href="./TK_04.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i8">Preview Readings & Tasks </button><div id="i8" class="collapse">
## Readings
- Chapters [11-13 in R4DS](http://r4ds.had.co.nz)

## Tasks
- Briefly describe functions that seem especially useful in the README.md file for this week.
- Confirm that all tasks and case studies you have completed have been committed in your course repository and pushed to Github.
- Look ahead at Task 6 (Project Proposal) and start thinking about possibilities
- Post at least one rough project idea (with links, etc.) to Slack in the [Project Channel](https://ubspatialdatascience.slack.com/messages/CDNEG4WN8).
</div>
___
## [ CS_05 :  Beware the Canadians! ]( ./CS_05.html ) 
   
 
  Working with Spatial Data and the sf package  
 
 <a class="btn btn-link" href="./CS_05.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i9">Preview Readings & Tasks </button><div id="i9" class="collapse">
## Readings
- The [Spatial Features Package (sf)](https://r-spatial.github.io/sf/){target='blank'}

## Tasks
- Reproject spatial data using `st_transform()`
- Perform spatial operations on spatial data (e.g. intersection and buffering)
- Generate a polygon that includes all land in NY that is within 10km of the Canadian border and calculate the area
- Save your script as a .R or .Rmd in your course repository
</div>
___
## [ TK_05 :  Spatial Vector Data ]( ./TK_05.html ) 
   
 
  Vector data processing. Integrating ‘traditional GIS’ analyses with statistical modelling.  Data intersection, overlays, zonal statistics  
 
 <a class="btn btn-link" href="./TK_05.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i10">Preview Readings & Tasks </button><div id="i10" class="collapse">
## Readings
- Chapters [1-2 in GCR](https://geocompr.robinlovelace.net/)

## Tasks
- Quickly describe functions that seem especially useful in the README.md file for this week.
</div>
___
## [ CS_06 :  Find hottest country on each continent ]( ./CS_06.html ) 
   
 
  Use sf and raster to quantify maximum temperature for each country and then identify the hottest one on each continent.  
 
 <a class="btn btn-link" href="./CS_06.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i11">Preview Readings & Tasks </button><div id="i11" class="collapse">
## Readings
- Raster Vector Interactions [GCR](https://geocompr.robinlovelace.net/geometric-operations.html#raster-vector){target='blank'}

## Tasks
- Calculate annual maximum temperatures from a monthly spatio-temporal dataset
- Remove Antarctica from the `world` dataset
- Summarize raster values within polygons
- Generate a summary figure and table.
- Save your script as a .R or .Rmd in your course repository
</div>
___
## [ TK_06 :  Spatial Raster Data ]( ./TK_06.html ) 
   
 
  Gridded spatial data  
 
 <a class="btn btn-link" href="./TK_06.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i12">Preview Readings & Tasks </button><div id="i12" class="collapse">
## Readings
- Chapters [3-4 in GCR](https://geocompr.robinlovelace.net/)

## Tasks
- Quickly describe functions that seem especially useful in the README.md file for this week.
</div>
___
## [ CS_07 :  Getting Help! ]( ./CS_07.html ) 
   
 
  Learning more about finding help  
 
 <a class="btn btn-link" href="./CS_07.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i13">Preview Readings & Tasks </button><div id="i13" class="collapse">
## Readings
- How to [write a reproducible example](http://adv-r.had.co.nz/Reproducibility.html)
- Using [Reprex package](https://reprex.tidyverse.org/)

## Tasks
- Learn how to read R help files effectively
- Learn how to search for help
- Learn how to create a Minimum Working Example (MWE)
- Debug existing code
- Save your reprex to your course repository as an html file using Export -> "Save As Webpage" in the RStudio "Viewer" Tab.
</div>
___
## [ TK_07 :  Project Proposal ]( ./TK_07.html ) 
   
 
    
 
 <a class="btn btn-link" href="./TK_07.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i14">Preview Readings & Tasks </button><div id="i14" class="collapse">
## Readings
- Chapters [3-4 in GCR](https://geocompr.robinlovelace.net/)

## Tasks
- Complete project proposal and upload .Rmd and .md to Github
- Post links to your project proposal .md file in the [Project Channel on Slack](https://ubspatialdatascience.slack.com/messages/CDNEG4WN8).
</div>
___
## [ CS_08 :  One Script, Many Products ]( ./CS_08.html ) 
   
 
  RMarkdown to create dynamic research outputs.  Publishing to github/word/html/etc  
 
 <a class="btn btn-link" href="./CS_08.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i15">Preview Readings & Tasks </button><div id="i15" class="collapse">
## Readings
- Browse website about [RMarkdown](https://rmarkdown.rstudio.com/index.html)
- Browse [R Markdown, the Definitive Guide](https://bookdown.org/yihui/rmarkdown/)

## Tasks
- Build a RMarkdown document that downloads a dataset, produces one graph and one table, and exports to four different formats (HTML, GitHub Markdown, Word, Powerpoint).
</div>
___
## [ TK_08 :  Create Final Project Webpage ]( ./TK_08.html ) 
   
 
  Data I/O. RMarkdown to create dynamic research outputs.  Publishing to github/word/html/etc  
 
 <a class="btn btn-link" href="./TK_08.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i16">Preview Readings & Tasks </button><div id="i16" class="collapse">
## Readings
- Chapters  [11, 26-30 in R4DS](http://r4ds.had.co.nz)
- Browse website about [RMarkdown](https://rmarkdown.rstudio.com/index.html)
- Browse details about creating [RMarkdown Websites](https://rmarkdown.rstudio.com/rmarkdown_websites.htm)

## Tasks
- Create repository for final project
- Explore various options for your project website
- Push changes back to GitHub
- Enable website on GitHub
</div>
___
## [ CS_09 :  Tracking Hurricanes! ]( ./CS_09.html ) 
   
 
  Analyze historical storm data from the NOAA API  
 
 <a class="btn btn-link" href="./CS_09.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i17">Preview Readings & Tasks </button><div id="i17" class="collapse">
## Readings
- Overview of the [International Best Track Archive for Climate Stewardship (IBTrACS)](https://www.ncdc.noaa.gov/ibtracs/index.php?name=ibtracs-data-access)
- Performing [Spatial Joins with sf](https://r-spatial.github.io/sf/reference/st_join.html)

## Tasks
- Write a .Rmd script to perform the following tasks
- Use an API to access NOAA Storm data over the web
- Intersect the storms with US states to quantify how many storms in the database have hit each state.
</div>
___
## [ TK_09 :  APIs, time-series, and weather Data ]( ./TK_09.html ) 
   
 
  Processing daily weather data from NOAA  
 
 <a class="btn btn-link" href="./TK_09.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i18">Preview Readings & Tasks </button><div id="i18" class="collapse">
## Readings
- Overview of the [GHCN Dataset](https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/global-historical-climatology-network-ghcn)
- Overview of [R and APIs](https://tclavelle.github.io/blog/r_and_apis/)
- Optional DataCamp course [Working with Web Data in R](https://www.datacamp.com/courses/working-with-web-data-in-r)

## Tasks
- Complete the Case Study for this week.
</div>
___
## [ CS_10 :  Satellite Remote Sensing ]( ./CS_10.html ) 
   
 
  Analyze Satellite Data  
 
 <a class="btn btn-link" href="./CS_10.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i19">Preview Readings & Tasks </button><div id="i19" class="collapse">
## Readings
- 

## Tasks
- Extract a timeseries from a single location in a netcdf file (part 1)
- Calculate a monthly climatology from a weekely timeseries (part 2)
- Summarize Land Surface Temperature by Land Cover (part 3)
</div>
___
## [ TK_10 :  Remote Sensing ]( ./TK_10.html ) 
   
 
  Processing MODIS data from NASA  
 
 <a class="btn btn-link" href="./TK_10.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i20">Preview Readings & Tasks </button><div id="i20" class="collapse">
## Readings
- NULL

## Tasks
- Work through the materials on [processing MODIS RS data](09_RemoteSensing_appeears.html)
- Take notes on interesting or useful things you learned in your course repository.
</div>
___
## [ CS_11 :  Parallel Computing with R ]( ./CS_11.html ) 
   
 
  Write a parallel for loop  
 
 <a class="btn btn-link" href="./CS_11.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i21">Preview Readings & Tasks </button><div id="i21" class="collapse">
## Readings
- Parallel [Computing with the R Language in a Supercomputing Environment](https://link.springer.com/chapter/10.1007/978-3-642-13872-0_64)
- CRAN Task View [High Performance and Parallel Computing with R](http://cran.r-project.org/web/views/HighPerformanceComputing.html)

## Tasks
- Reproject `world` dataset to a global equal area projection
- Write a parallel `foreach()` loop to identify the a spatial relationships of each country
- Set the output of the `foreach()` funtion to return a simple matrix
- Confirm that your parallel loop returns the same answer as a typical "sequential" approach
</div>
___
## [ TK_11 :  Project First Draft ]( ./TK_11.html ) 
   
 
  Submit the first draft of your project for peer review  
 
 <a class="btn btn-link" href="./TK_11.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i22">Preview Readings & Tasks </button><div id="i22" class="collapse">
## Readings
- Documentation for [RMarkdown Websites](https://rmarkdown.rstudio.com/rmarkdown_websites.htm)

## Tasks
- Commit your first draft of your project to GitHub
</div>
___
## [ CS_12 :  Dynamic HTML graph of Daily Temperatures ]( ./CS_12.html ) 
   
 
  Using DyGraph library.  
 
 <a class="btn btn-link" href="./CS_12.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i23">Preview Readings & Tasks </button><div id="i23" class="collapse">
## Readings
- Explore the [DyGraphs webpage](http://rstudio.github.io/dygraphs/)

## Tasks
- Download daily weather data for Buffalo, NY using an API
- Generate a dynamic html visualization of the timeseries.
- Save the graph to your project folder using Export->Save as Webpage
</div>
___
## [ TK_12 :  Project Peer Review ]( ./TK_12.html ) 
   
 
    
 
 <a class="btn btn-link" href="./TK_12.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i24">Preview Readings & Tasks </button><div id="i24" class="collapse">
## Readings
- GitHub [Pull Requests](https://help.github.com/articles/about-pull-requests/)
- Chapter [28 in R4DS](http://r4ds.had.co.nz)

## Tasks
- Review at least two other students' projects and make comments via a _pull request_ in GitHub.
- Browse the [Leaflet website](http://rstudio.github.io/leaflet/) and take notes in your readme.md about potential uses in your project. What data could you use?  How would you display it?
- Browse the [HTML Widgets page](http://gallery.htmlwidgets.org/) for many more examples. Take notes in your readme.md about potential uses in your project.
</div>
___
## [ TK_13 :  Thanksgiving Week (Tuesday Class Optional) ]( ./TK_13.html ) 
   
 
  Optional Course Workshop  
 
 <a class="btn btn-link" href="./TK_13.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i25">Preview Readings & Tasks </button><div id="i25" class="collapse">
## Readings
- NULL

## Tasks
- Continue working on final project
- Come to class with any questions
</div>
___
## [ TK_14 :  Final Project 2nd Draft / Building and summarizing models ]( ./TK_14.html ) 
   
 
  Building a species distribution model  
 
 <a class="btn btn-link" href="./TK_14.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i26">Preview Readings & Tasks </button><div id="i26" class="collapse">
## Readings
- Chapter [23-25 in R4DS](http://r4ds.had.co.nz)

## Tasks
- Commit second draft of final project to GitHub for review
- Demonstrate a simple presence/absence model in spatial context.
- Model spatial dependence (autocorrelation) in the response.
</div>
___
## [ TK_15 :  Final Presentation ]( ./TK_15.html ) 
   
 
  Present your project to the class  
 
 <a class="btn btn-link" href="./TK_15.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i27">Preview Readings & Tasks </button><div id="i27" class="collapse">
## Readings
- Wikipedia pages about [Lightning talks](http://en.wikipedia.org/wiki/Lightning_Talk)
- Wikipedia pages about [Ignite Sessions](http://en.wikipedia.org/wiki/Ignite_(event))

## Tasks
- Prepare to give your 5 minute presentation
- Present your analysis to your roommates, significant other, etc. and update your presentation based on the feedback
- Get feedback from 2-3 fellow classmates on your presentation and update it based on their feedback
- Give your 5 minute presentation in class
</div>
___
## [ TK_16 :  Publish Final Project ]( ./TK_16.html ) 
   
 
  Commit the final version of your project  
 
 <a class="btn btn-link" href="./TK_16.html" role="button" >Full Description</a><button data-toggle="collapse" class="btn btn-link" data-target="#i28">Preview Readings & Tasks </button><div id="i28" class="collapse">
## Readings
- 

## Tasks
- Finalize your project and commit to GitHub
- Confirm the final version renders correctly on your website
</div>

