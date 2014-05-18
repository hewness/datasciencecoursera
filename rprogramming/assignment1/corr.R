corr <- function(directory, threshold = 0) {
  
  completeData <- complete(directory)

  thresholdData <- subset(completeData, nobs >= threshold)
  
  corrData <- c()
  
  for(i in thresholdData$id)
  {
    fileNumber <- formatC(i, width = 3, format = "d", flag = "0") 
    filePath <- paste(directory, "\\", fileNumber, ".csv", sep = "")
    data <- na.omit(read.csv(filePath))
    #formattedCor = formatC(, format = "f", digits = 5) 
    corrData <- c(corrData, cor(data$sulfate, data$nitrate))
  }
  
  return (corrData)
}