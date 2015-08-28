best <- function(state,outcome){
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  if (!state %in% data$State)
  {
    stop("invalid State")
  }
  outcomes <- c("heart attack","heart failure","pneumonia")
  if(! outcome %in% outcomes)
  {
    stop("Invalid outcome")
  }
  
  data[,11] <- suppressWarnings(as.numeric(data[,11]))
  data[,17] <- suppressWarnings(as.numeric(data[,17]))
  data[,23] <- suppressWarnings(as.numeric(data[,23]))
  
  # get the data specific to the given state
  state_data <- data[grep(state, data$State,ignore.case = TRUE),]
  if (outcome == "heart attack") 
  {
    column <- 11
  }
  else if ( outcome == "heart failure")
  {
    column <- 17
  }
  else if (outcome == "pneumonia")
  {
    column <- 23
  }
  
  sorted_data <- state_data[order(state_data[,column],state_data[,2]),]
  sorted_data[1,2]
  
  
  
}


