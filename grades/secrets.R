#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# get details
myapp <- oauth_app(appname = "R_grading",
                   key = "b1680c7bf83d2e7b4457",
                   secret = "5ce266217aa12691ba113b99da4073100caa9d5c")
