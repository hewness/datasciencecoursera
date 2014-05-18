pollutantmean <- function(directory, pollutant, id = 1:332) {

  allData <- data.frame(Date=as.Date(character()),
                   File=character(), 
                   User=character(), 
                   stringsAsFactors=FALSE) 
  
  for(i in id)
  {
    fileNumber <- formatC(i, width = 3, format = "d", flag = "0") 
    filePath <- paste(directory, "\\", fileNumber, ".csv", sep = "")
    data <- read.csv(filePath)
    allData <- rbind(allData, data)
  }
  
  meanPollutant <- 0
  
  if(pollutant == "sulfate")
    meanPollutant <- mean(allData$sulfate, na.rm = T)
  else if(pollutant == "nitrate")
    meanPollutant <- mean(allData$nitrate, na.rm = T)
  
  return (formatC(meanPollutant, format = "f", digits = 3));
}