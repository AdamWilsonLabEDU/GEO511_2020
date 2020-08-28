#' ---
#' title:  One Script, Many Products
#' subtitle: RMarkdown to create dynamic research outputs.  Publishing to github/word/html/etc
#' week: 8
#' type: Case Study
#' reading:
#'   - Browse website about [RMarkdown](https://rmarkdown.rstudio.com/index.html)
#'   - Browse [R Markdown, the Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
#' tasks:
#'    - Build a RMarkdown document that downloads a dataset, produces one graph and one table, and exports to four different formats (HTML, GitHub Markdown, Word, Powerpoint).
#' ---
#' 

#' 
#' # Reading
#' 
## ----reading,results='asis',echo=F--------------------------------------------
md_bullet(rmarkdown::metadata$reading)

#' 
#' # Tasks
#' 
## ----tasks,results='asis',echo=F----------------------------------------------
md_bullet(rmarkdown::metadata$tasks)

#' 
#' # Background
#' 
#' You are working on a team that needs to provide regular updates about a dataset that is regularly updated.  Currently, an employee does the following steps once per week:
#' 
#' 1. Goes to a website with the source data
#' 2. Downloads the data as a text file
#' 3. Opens a graphing program and clicking through a set of procedures to make a particular set of graphs
#' 4. Saves the updated data in several formats including:
#'    * Powerpoint presentation
#'    * Website hosted on the team website
#'    * Word document that is included in company reports
#'    * A PDF document for downloading/printing
#'    
#' This takes the employee about 3 hours every week.  You are a new member of the team and you confidently declare you could automate the procedure using R and RMarkdown (and that you could complete the automation in less than three hours!).  The team looks at you with wide eyes.  You realize you better get working.
#' 
#' ## Specifying multiple outputs with RMarkdown
#' You can specify that RMarkdown should produce multiple outputs using the following syntax in the YAML header:
#' 
#' ```
#' output:
#'   html_document: default
#'   github_document: default
#'   powerpoint_presentation: default
#'   word_document: default
#' ```
#' 
#' You can read more about the YAML header and all the options [here](https://bookdown.org/yihui/rmarkdown/html-document.html).  Note that you can specify many options for each output format to change the theme, structure, etc.
#' 
#' However, if you click the "Knit" button in RStudio, it will only make one output.  To 'render' all of them, you have to use a command like this in the R Console.
#' 
#' ```
#' rmarkdown::render("path/to/file.Rmd",output_format = "all")
#' ```
#' 
#' ## Data
#' You will be working with the data available [here](https://www.esrl.noaa.gov/gmd/ccgg/trends/data.html). You can read it in using `read_table()` but you will have to look at the text file and specify how many lines to `skip`.  
#' 
#' ## Outputs
#' 
#' Your objective is to automatically produce various outputs like [MS Word](CS_08_Template/CS_08_template.docx), [PPTX](CS_08_Template/CS_08_template.pptx), and [HTML](CS_08_Template/CS_08_template.html). 
#' 
#' The document should:
#' 
#' 1. Download the data (including correctly importing it)
#' 2. Make one timeseries plot (ggplot of CO2~time)
#' 3. Make one table. This table can summarize anything you want (top 5 years?  Mean CO2 every decade?)
#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">Show Hints</button>
#' <div id="demo1" class="collapse">
#' 
#' ## Hints
#' 1.  Create a new RMarkdown Document (possibly starting with the template in `File -> New File -> R Markdown`
#' 2. Edit the YAML header at the top of the .Rmd file to specify the desired file types as noted above.
#' 3. Write code to read the "Mauna Loa CO2 annual mean data" from [this website](https://www.esrl.noaa.gov/gmd/ccgg/trends/data.html). 
#'    * check out `tidyverse::read_table()` or similar to import the dataset into R directly from the URL (ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt)
#'    * after you look at the format of the text file, you will want to check out the `skip` parameter of `read_table()`
#' 4. Use ggplot to plot a time series of CO2 levels through time
#' 5. Add an additional table below the graph and format it nicely with `knitr:kable()` or similar.  
#' 6. Use `rmarkdown::render(file, output_format = "all")` to render all the outputs specified in the YAML.
#' 7. Consider changing the 'chunk' settings so that the underlying code (and any messages) are hidden in the output documents.  For example, consider `results='hide',message=FALSE, echo=F`.
#' 8. Tables can be a little tricky to embed in multiple formats.  One approach is to use `as_image()` in kableExtra package which generates a png file that is easy to embed.  You can use it like this:
#' ```
#' data %>% 
#'   kable() %>% 
#'   as_image(width = 10,file = "table.png")
#' ```  
#' 7. Save the outputs in your repository.
#' </div>
#' </div>
#' 
#' Explore my version of the html output [here](CS_08_Template/CS_08_template.html).
#' 
#' # Reflection
#' 
#' Think about how you could use this "one document, several outputs" approach in a project.
