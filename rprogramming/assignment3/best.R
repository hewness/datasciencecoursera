best <- function(state, outcome) {
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  index <- which.min(outcomeData[,matchedColumn])
  
  return(outcomeData[index,]$Hospital.Name)
}

#best("BB", "heart attack")
#best("NY", "hert attack")
#best("N", "heart attack")#

#best("TX", "heart attack")
#best("TX", "heart failure")
#best("MD", "heart attack")
#best("MD", "pneumonia")