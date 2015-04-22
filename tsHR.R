# setwd("~/Documents/playBallDeeper/")
load("hr_tables.RData")
library(dplyr)
library(xts)
library(dygraphs)

tmp <- hr_tables[[25]]
names(tmp)
HR <- xts(as.numeric(tmp$NUMBER), as.Date(tmp$DATE, format='%Y/%m/%d'))
head(HR)
tail(HR)

dygraph(HR)
