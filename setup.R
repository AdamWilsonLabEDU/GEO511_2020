# Compile all presentations in the "presentations" folder
pres=list.files("pres",full=T,pattern="Rmd")
lapply(pres,function(x) rmarkdown::render(x))


if(F){
system("cp -R pres/ docs/pres/")
system("cp leaflet.html docs/leaflet.html")
system("cp table.png docs/table.png")
}


