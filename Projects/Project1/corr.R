corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  correlation_vector<- c()
  complete_cases <- complete(directory)
  cases_greater_than_threshold <- complete_cases[complete_cases$nobs > threshold,]
  
  for (id in cases_greater_than_threshold$id)
  {

    file_name <- paste(directory,"/",sprintf("%03d",id),".csv",sep = "")
    file_data <- read.csv(file_name)
    file_data <- file_data[complete.cases(file_data),]
    correlation_vector<- c(correlation_vector,cor(file_data$sulfate,file_data$nitrate))
  }
  correlation_vector
}