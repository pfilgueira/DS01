complete <- function(directory, id=1:332) {
        
        ## returns the number of complete cases
        
        ## directory -> location of the csv files.  Char vector length 1
        ## id        -> monitor ID numbers.  Int vector
        
        directory <- paste("./", directory, "/", sep="")
        
        ## vector to receive all files from directory
        
        files <- list.files(directory)
        location <- paste(directory, files, sep="")
        
        ##vector_len <- length(id)
        data_total <- c()
        
        ## loop through the file list to store the contents in vector data_total
        
        k <- 1
        for (i in id) {
                data <- read.csv(location[i], header=TRUE, sep = ",")
                data_total[k] <- sum(complete.cases(data))
                k <- k + 1
        }
        
        return (data.frame(id = id, nobs = data_total))
        
}

