corr <- function(directory, threshold = 0) {
        
        ## returns the correlation between two vectors
        
        ## directory -> location of the csv files.  Char vector length 1
        ## id        -> monitor ID numbers.  Int vector
        
        directory <- paste("./", directory, "/", sep="")
        
        ## vector to receive all files from directory
        
        files <- list.files(directory)
        location <- paste(directory, files, sep="")
        
        ## complete cases from the function complete.R developed before
        complete_cases <- complete("specdata", 1:332)
        nobs <- complete_cases$nobs
        
        ## identify which IDs have complete cases
        id_complete_cases <- complete_cases$id[nobs > threshold]
        
        # initialize vector to receive the results
        corr_result <- rep(0, length(id_complete_cases))
        
        ## loop through the file list to store the contents in vector data_total
        k <- 1
        for (i in id_complete_cases) {
                data <- read.csv(location[i], header=TRUE, sep = ",")
                corr_result[k] <- cor(data$sulfate, data$nitrate, use = "complete.obs")
                k <- k + 1
        }
        return(corr_result)
}