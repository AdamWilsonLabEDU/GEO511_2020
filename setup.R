# Compile all presentations in the "presentations" folder
pres=list.files("pres",full=T,pattern="Rmd")
lapply(pres,function(x) rmarkdown::render(x))


if(F){
system("cp -R pres/ docs/pres/")
system("cp -R pres/_site/* docs/pres/")
system("cp leaflet.html docs/leaflet.html")
system("cp table.png docs/table.png")
}

if(F){
library(DiagrammeR)
  DiagrammeR::grViz("digraph {

graph [layout = dot, rankdir = LR]

# define the global styles of the nodes. We can override these in box if we wish
node [shape = rectangle, style = filled, fillcolor = Linen]

data1 [label = 'Dataset 1', shape = folder, fillcolor = Beige]
data2 [label = 'Dataset 2', shape = folder, fillcolor = Beige]
script [label =  'RMarkdown Script \n .Rmd']
knitr [label = 'Knitr \n (runs R code)']
md [label = 'Markdown \n .md']
results1 [label= 'Webpage (html)']
results2 [label= 'Word document (docx)']

# edge definitions with the node IDs
{data1 data2}  -> script -> knitr -> md -> {results1 results2}
}")
  
  
}