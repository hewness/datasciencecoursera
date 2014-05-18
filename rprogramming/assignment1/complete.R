complete <- function(directory, id = 1:332) {
  
  completeData <- data.frame()
  
  for(i in id)
  {
    fileNumber <- formatC(i, width = 3, format = "d", flag = "0") 
    filePath <- paste(directory, "\\", fileNumber, ".csv", sep = "")
    data <- na.omit(read.csv(filePath))
    completeData <- rbind(completeData, c(i, nrow(data)))
  }
  
  colnames(completeData)[1] = 'id'
  colnames(completeData)[2] = 'nobs'

  return (completeData)
}

complete("specdata", 1)

complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 30:25)

complete("specdata", 3)