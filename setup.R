# Compile all presentations in the "presentations" folder
pres=list.files("pres",full=T,pattern="Rmd")
lapply(pres,function(x) rmarkdown::render(x))


if(F){
pres_html=list.files("pres",full=T,pattern="html")
system("cp -R pres/ docs/pres/")
}


