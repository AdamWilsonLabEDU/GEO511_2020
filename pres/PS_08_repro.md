---
title: "Reproducible Research"
type: Presentation
week: 8
---

## Project Proposals

* Refine your objectives:
   * answer 1-3 _important_ questions OR
   * solve 1-3 _important_ problems
* Better to demonstrate 1-3 things well than 10 things poorly.

## Resource Presentations

## Case Study

Topics for leaders:

1. In what situations can a 'reproducible example' be useful?
2. Check out the help for `reprex()`.  When might you use these different parameters?

# RMarkdown 

## The goal of reproducible research
> "The goal of reproducible research is to tie specific instructions to data analysis and experimental data so that scholarship can be recreated, better understood and verified."  <small> Max Kuhn, CRAN Task View: Reproducible Research </small>


## Our work exists on a spectrum of reproducibility
<img src="img_12/peng-spectrum.jpg" alt="alt text" width="800">

<small>Peng 2011, Science 334(6060) pp. 1226-1227</small>


## Goal: expose more of the research workflow

<img src="img_12/peng-pipeline.jpg" alt="alt text" width="600">

<small><small>http://www.stodden.net/AMP2011/slides/pengslides.pdf</small></small>


## Common practices of many scientists  {.columns-2}
1. Enter data in Excel
2. Use Excel for data cleaning & descriptive statistics
2. Use ArcGIS and use point-and-click options for processing / visualization
3. Import data into SPSS/SAS/Stata for further analysis
4. Use point-and-click options to run statistical analyses
5. Copy & paste output to Word document, repeatedly

---

<img src="img_12/phd-comic-vcs.gif" alt="alt text" width="400">

---

<small>![alt text](img_12/lemon.png)</small>

---

## Click trails are ephemeral {.columns-2}

- Lots of human effort for tedious & time-wasting tasks
- Error-prone due to manual & ad hoc data handling
- Difficult to record -  hard to reconstruct a 'click history'
- Tiny changes in data or method require extensive reworking

---

## Case study: Reinhart and Rogoff controversy 

- 2010: Claimed high debt-to-GDP ratios led to low GDP growth
- Threshold to growth at a debt-to-GDP ratio of >90%
- Substantial popular impact on autsterity politics 

---

<img src="img_12/reinhart_rogoff_coding_error_0.png" alt="alt text" width="400">

---

<img src="img_12/reinhart_rogoff_econ_mag.png" alt="alt text" width="500">

Excel coding error sliced several countries out of the data set....
[The Economist](http://www.economist.com/news/finance-and-economics/21576362-seminal-analysis-relationship-between-debt-and-growth-comes-under)


---

## Case study: Seizure Medicine

#### 2013 Seizure study retracted after authors realize data got "terribly mixed"

> "The article has been retracted at the request of the authors. After carefully re-examining the data presented in the article, they identified that data of two different hospitals got terribly mixed. The published results cannot be reproduced in accordance with scientific and clinical correctness."" <small> Authors of Low Dose Lidocaine for Refractory Seizures in Preterm Neonates </small>

[Source](http://retractionwatch.com/2013/02/01/seizure-study-retracted-after-authors-realize-data-got-terribly-mixed/)


## Bad spreadsheet merge kills depression paper, quick fix resurrects it
Authors informed the journal that the merge of lab results and other survey data used in the paper resulted in an error regarding the identification codes. Results of the analyses were based on the data set in which this error occurred. 

> "**Lower** levels of CSF IL-6 were associated with current depression and with future depression […]" <small>Original conclusion</small>

> "**Higher** levels of CSF IL-6 and IL-8 were associated with current depression […]" <small> Revised conclusion </small>

[Source](http://retractionwatch.com/2014/07/01/bad-spreadsheet-merge-kills-depression-paper-quick-fix-resurrects-it/)


## Open scripted analyses provide a solution  {.columns-2}

  <img src="img_12/open-science.png" alt="alt text" width="200px">


  - Plain text files readable for a _long_ time
  - Improved transparency, automation, maintanability, accessibility, standardisation, modularity, portability, efficiency, communicability of process (what more could we want?)
  - Steeper learning curve  

## Literate statistical programming 

> "Instead of imagining that our main task is to instruct a computer what to do, let us concentrate rather on explaining to humans what we want the computer to do." <small>Donald E. Knuth, Literate Programming, 1984</small>



For example...
If I say that 2 + 2 = 4, why would you believe me?


```r
2+2
```

```
## [1] 4
```
The text and R code are interwoven in the output.  The products are ephemeral - focus is on the methods!

## Literate statistical programming 

Of course `2+2` is trivial, but what if I said:

<img src="img_12/model.png" alt="alt text" width="800">


## Literate programming: pros and cons   {.columns-2}

**Pros**

- Text & code in one place, in logical order
- Tables and figures automatically updated
- Automatic test when building document

**Cons**

- Text and code in one place; can be hard to read
- Can slow down the processing of documents (use caching!)


## Markdown formatting language  {.columns-2}

<img src="img_12/markdown.png" alt="alt text" width="100">

Markdown: lightweight document formatting syntax. Easy to write, read and publish as-is.

The human-readable part:

- minor extensions to allow R code display and execution
- embed images in html files (convenient for sharing)
- equations
-  `*` for bullet,  `_` for underline

## Dynamic documents in R  {.columns-2}

`knitr` - descendant of Sweave  

Engine for dynamic report generation in R

<img src="img_12/knitr.png" alt="alt text" width="200">

- Narrative and code in the same file or explicitly linked
- When data or narrative are updated, the document is automatically updated
- Data treated as 'read only'
- Output treated as disposable

## Pandoc: document converter  {.columns-2}

<img src="img_12/pandoc-workflow-rmd-md.png" alt="alt text" height="500px">
<small><small><small>http://kieranhealy.org/blog/archives/2014/01/23/plain-text/ </small></small></small>

---

A universal document converter, open source, cross-platform

* Write code and narrative in rmarkdown   
* knitr->markdown (with computation)   
* use pandoc to get HTML/PDF/DOCX
 
##  Final

> Abandoning the habit of secrecy in favor of process transparency and peer review was the crucial step by which alchemy became chemistry.  <br> <small>Raymond, E. S., 2004, The art of UNIX programming: Addison-Wesley.</small>

## Colophon

* [Slides based on Ben Marwick's presentation to the UW Center for Statistics and Social Sciences (12 March 2014)](https://github.com/benmarwick/CSSS-Primer-Reproducible-Research) ([OrcID](http://orcid.org/0000-0001-7879-4531))

**References:** See Rmd file for full references and sources



