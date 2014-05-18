source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)

summary(cr)

cr <- corr("specdata", 400)
head(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)

cr <- corr("specdata")
summary(cr)

length(cr)