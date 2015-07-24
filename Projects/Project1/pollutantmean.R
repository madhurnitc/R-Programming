pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  total_data <- c()
  for(i in id)
  {
    file_name <- paste(directory,"/",sprintf("%03d",i),".csv",sep = "")
    file_data <- read.csv(file_name)
    pollutant_column_data <- file_data[,pollutant]
    valid_data <- pollutant_column_data[!is.na(pollutant_column_data)]
    total_data <- c(total_data,valid_data)
  }
  
  mean(total_data)
  
}
 