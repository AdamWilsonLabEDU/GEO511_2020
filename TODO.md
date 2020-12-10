TODO:

Geocomputation: https://geocompr.robinlovelace.net/transport.html
Teaching resources: https://www.carlboettiger.info/teaching


# Content updates / additions

* data in/out
* data cleaning
* date processing
* text processing
* linear modeling
* kriging?

code style:
* more line returns with comments

Viz style:
* log transform color ramps and axis, not data...

# Final project

single infographic displaying some kind of spatio-temporal change

examples:
* http://mapbiomas.org/
* https://www.digitalartsonline.co.uk/features/graphic-design/award-winning-infographic-designer-nadieh-bremer-on-how-create-powerful-data-visualisations/
* https://flowingdata.com/tag/r/
* https://blog.visme.co/cool-infographics/
* https://geovisualist.com/
* https://www.earthdatascience.org/courses/earth-analytics/


# Structure updates

first draft submitted earilier for video feedback.


File Structure

* put all case studies in .Rmd with github markdown output (include summary of project, name, etc.)
* Use github actions to ensure content builds
* gitignore data
* Grand checklist for completed tasks?
* update links to course repository


General repository rules:
* never use an absolute path (e.g. ~/Desktop/RClass/...)
* never commit large files (100MB max, better < 5mb)
    * instructions if you did this accidentally
* push before your pull error
  ```>>> git push origin refs/heads/master
   ! [rejected]        master -> master (fetch first)
    error: failed to push some refs to
    hint: Updates were rejected because the remote contains work that you do
    hint: not have locally. This is usually caused by another repository pushing
    hint: to the same ref. You may want to first integrate the remote changes
    hint: (e.g., 'git pull ...') before pushing again.
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.```


Package presentation?  IF keeping, use a Rmd structure inside course repositories so they can be opened on the fly.


## 2020

* Break assignments into separate repositories with tests?
* Spatial regression using buffalo data?
* Use piggyback for associated data?

## Tasks to add
early:
* Data visualization: https://dcl-2017-04.github.io/curriculum/vis-perception.html


## Git Classroom
* setup git account
* use github classroom
* set up course folder structure
* update profile on github
* Add short description to top-level README in github repository

### Project related tasks
* convert project to separate tasks (?) and upload to git repository

## Every Semester
* update google sheets links - do I still need to do this with classroom?
* Create new assignments
* Update github classroom links in task 2