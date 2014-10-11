pollutantmean <- function(d, p, id = 1:332) {
     wd <- paste("C:/Users/nanguiano/Documents/CODE/R/assignment1/", d, sep = "")
     setwd(wd)
     polData <- NA
     for(i in id) {
          allData <- read.csv(list.files()[i])
          gooData <- allData[p][!is.na(allData[p])]
          polData <- c(polData, gooData)
     }
     return(mean(polData[!is.na(polData)]))
}