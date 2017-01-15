pollutantmean <- function(directory, pollutant, id=1:332) {
        
        ## returns the mean of the pollutant across all monitors list
        
        ## directory -> location of the csv files.  Char vector length 1
        ## pollutant -> pollutant name: "sulfate", "nitrate".  Char vector length 1
        ## id        -> monitor ID numbers.  Int vector
        
        directory <- paste("./", directory, "/", sep="")
        
        ## vector to receive all files from directory
        ##files <- as.character(list.files(directory))
        
        files <- list.files(directory)
        location <- paste(directory, files, sep="")
        
        data_total <- c()
        
        ## loop through the file list to store the contents in vector data_total
        for (i in id) {
                data <- read.csv(location[i], header=TRUE, sep = ",")

                pollutant_column <- data[!is.na(data[, pollutant]), pollutant]
                data_total <- c(data_total, pollutant_column)
        }
        
        return (mean(data_total))
        
}

