 {
      ## run_analysis will perform the tasks for the assignment in the 
      ## getting and cleaning data course
       
      ## **********************************************************************************************************
      ## 1. merge the test and training dataset to create one dataset
      ##
      ## First, we read the test dataset
       path2files <- "./assignment/UCI HAR Dataset/"
       
       ## The slowest part of the program is reading the large test and train measurement files
       ## The following technique improves performance http://www.biostat.jhsph.edu/~rpeng/docs/R-large-tables.html
       tab5rows <- read.table(paste(path2files,"test/X_test.txt", sep = ""),header=FALSE,nrows=5)
       classes <- sapply(tab5rows, class)
       
       
       
       measuredf <- read.table(paste(path2files,"test/X_test.txt", sep = ""), header = FALSE, colClasses = classes)
       activitydf <- read.table(paste(path2files,"test/Y_test.txt", sep = ""))
       subjectsdf <- read.table(paste(path2files,"test/subject_test.txt", sep = ""))
       
       ## From the data dictionary for the UCI HAR Dataset we know that the train data has
       ## the same structure, therefore we can directly bind the train datasets when reading for efficiency
       measuredf <- rbind(measuredf,read.table(paste(path2files,"train/X_train.txt", sep = ""), header = FALSE, colClasses = classes))
       activitydf <- rbind(activitydf,read.table(paste(path2files,"train/Y_train.txt", sep = "")))
       subjectsdf <- rbind(subjectsdf,read.table(paste(path2files,"train/subject_train.txt", sep = "")))
       
       ## we now have three dataframes combining all the test and training data measurements, subjects and activities
       
       ## **********************************************************************************************************
       ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
       ##
       ## First, read the variable names from the features.txt file
       varnamesdf <- read.table(paste(path2files,"features.txt", sep = ""))
       ## vnames is now a dataframe with two colunms, the measurement number and the variable name
       
       ## Next, define a new dataframe called "selcols" which will include the columns to be selected
       selcols <- c(grep("mean",varnamesdf$V2),grep("std",varnamesdf$V2))
       ## selcols is now a vector with the numbers for the variables that contain "mean" or "std" in their names. 
       ## However, this includes variables that contain "meanFreq", which is a measure (as opposed to the mean of a measure)
       ## The function setdiff allows us to eliminate those items from selcols
       selcols <- setdiff(selcols, grep("meanFreq", varnamesdf$V2))
       
       
       ## next, we extract the mean and standard deviation from the dataframe
       measuredf <- measuredf[,selcols]
       measuredf <- cbind(activitydf, subjectsdf, measuredf)
       ## The measuredf dataframe now contains only the activity definition (first column) and appropriate measurements
       ## Next, we will ensure that the dataframes are correctly named.
       
       
       ## **********************************************************************************************************
       ## 3. Uses descriptive activity names to name the activities in the data set. 
       ##
       ## In this step we need to use the activity names to identify the measurements
       actlabels <- read.table(paste(path2files,"activity_labels.txt", sep = ""))
       
       ## The "merge" function allows us to execute a database "join" between two dataframes
       ## (as a personal note, I'd be more comfortable to use a simple sqlcommand with the appropriate libraries, but
       ##  will use the "merge" function as practice)
       ## The "merge" function will result in a sorted dataframe, but that is not an issue since the measuredf dataframe
       ## already includes all the appropriate columns and data
       
       ## Finally, the "merge" function requires the dataframe columns to be appropriately named (no duplicate names),
       ## which is not the case for the measuredf dataframe (because the activitydf and subjectsdf dataframes had columnes
       ## named "V1") so we are going to assign new column names
       colnames(actlabels) <- c("actno","actname")
       ## Since we are renaming columns on measuredf, we might as well use the variable names from varnamesdf
       
       colnames(measuredf) <- c("actno", "subjectno", as.vector(varnamesdf$V2[selcols]))
       ## We use the 'as.vector' function on the varnamesdf dataframe because the dataframe has 477 levels.
       ## (this is due to the repeated variable names. This approach works in this exercise because the mean and std
       ##  variables are not repeated)
              
       measuredf <- merge(actlabels, measuredf)
       
       ## The second Column in the measuredf dataframe contains the name of the activity, and the third contains the subject
       ## (we could delete the first column containing the activity number, but it's not mandatory)

       ## **********************************************************************************************************
       ## 4. Appropriately labels the data set with descriptive variable names. 
       ##
       ## Since we renamed the columns of the measuredf taking the variable names in the last instruction of step 2, this is already
       ## done.
       ## 
       ## usedcolnames <- colnames(measuredf)
       ## usedcolnames <- sub('Acc', ' Acceleration', usedcolnames)
       ## **********************************************************************************************************
       ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
       ## for each activity and each subject.
       ##
       ## The easiest way to accomplish this is by using the dplyr package
       ## The summarise_each function is an elegant way of applying the same function (or set of functions) to multiple columns
       library(dplyr)
       tidymeasuredf <- measuredf %>%
             group_by (actno, actname, subjectno) %>%
             summarise_each(funs(mean))
       
       ## The tidymeasuredf dataframe contains the second dataset
       ## The final step is to write down the file with the results
       
       write.table(tidymeasuredf, file = paste(path2files,"tidy_measures.txt", sep = ""), row.name=FALSE)
       
    }
