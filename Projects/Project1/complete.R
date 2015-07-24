complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  nobs<-c()
  for(i in id)
  {
    file_name <- paste(directory,"/",sprintf("%03d",i),".csv",sep = "")
    file_data <- read.csv(file_name)
    complete_cases<- file_data[complete.cases(file_data),]
    nobs <- c(nobs,nrow(complete_cases))
  }
  data.frame(id= id,nobs=nobs)
  
}