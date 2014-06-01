rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  outcomeMatcher <- paste('^Hospital.30.Day.Death..Mortality..Rates.from.', gsub(" ", ".", outcome), '$', sep="")
  
  matchedColumn <- grep(outcomeMatcher,colnames(outcomeData), ignore.case=TRUE, value=TRUE)
  
  if(length(matchedColumn) <= 0) {
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  states <- unique(outcomeData$State)
  states <- states[order(states)]
  
  hospitals = c()
  
  for (i in 1:length(states) ) {
    stateOutcomeData <- subset(outcomeData, State == states[i])
    stateOutcomeData <- stateOutcomeData[order(as.numeric(stateOutcomeData[,matchedColumn]), stateOutcomeData$Hospital.Name, na.last=NA),]
    
    if(num == "best") {
      #print(stateOutcomeData[0,]$Hospital.Name)
      hospitals <- append(hospitals, stateOutcomeData[1,]$Hospital.Name)
    } else if(num == "worst") {
      hospitals <- append(hospitals, tail(stateOutcomeData,1)$Hospital.Name)
    } else {
      hospitals <- append(hospitals, stateOutcomeData[num,]$Hospital.Name)
    }
  }
  
  #print(length(hospitals))
  
  rank <- data.frame(hospitals=hospitals, states=states)
  colnames(rank)[1] = 'hospital'
  colnames(rank)[2] = 'state'
  
  return(rank)
}

#head(rankall("heart attack", 20), 10)
#tail(rankall("pneumonia", "worst"), 3)
#stail(rankall("heart failure"), 10)
