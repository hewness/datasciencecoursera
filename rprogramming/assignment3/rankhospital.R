rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  stateMatcher <- paste("^", state, "$", sep="")
  if(length(grep(stateMatcher,outcomeData$State, ignore.case=TRUE, value=TRUE)) <= 0) {
    stop("invalid state")
  }
  
  outcomeData <- subset(outcomeData, State == toupper(state))
  
  outcomeMatcher <- paste('^Hospital.30.Day.Death..Mortality..Rates.from.', gsub(" ", ".", outcome), '$', sep="")
  
  matchedColumn <- grep(outcomeMatcher,colnames(outcomeData), ignore.case=TRUE, value=TRUE)
  
  if(length(matchedColumn) <= 0) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  #orderIndexes <- order(outcomeData[,matchedColumn], na.last=NA)

  outcomeData <- outcomeData[order(as.numeric(outcomeData[,matchedColumn]), outcomeData$Hospital.Name, na.last=NA),]
  
  if(num == "best") {
    return(outcomeData[0,]$Hospital.Name)
  } else if(num == "worst") {
    return(tail(outcomeData,1)$Hospital.Name)
  }
  
  return(outcomeData[num,]$Hospital.Name)
}

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)