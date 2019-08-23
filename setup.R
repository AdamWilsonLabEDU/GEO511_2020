# Compile all presentations in the "presentations" folder
pres=list.files("pres",full=T,pattern="Rmd")
lapply(pres,function(x) rmarkdown::render(x))



