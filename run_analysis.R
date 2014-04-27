##  run_analysis.R
##  1 Merges the training and the test sets to create one data set.
##  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3 Uses descriptive activity names to name the activities in the data set
##  4 Appropriately labels the data set with descriptive activity names. 
##  5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##
##  Load libraries
##
library("plyr")


tidyUp <- function() {
##
##  Load some supplemental files
##
    columnNames <- t(read.table("UCI\ HAR\ Dataset/features.txt"))[2,] ## read in column names
    actionKeys <- read.table("UCI\ HAR\ Dataset/activity_labels.txt", col.names=c("Action.ID", "Action.Name")) ## read in activity key

##
##  Bring in testing data
##
    testX <- read.table("UCI\ HAR\ Dataset/test/X_test.txt", col.names=columnNames, check.names=FALSE) ##  read in the main test data
    testX <- cbind(read.table("UCI\ HAR\ Dataset/test/Y_test.txt", col.names=c("Action")), testX) ## add activity codes
    testX <- cbind(read.table("UCI\ HAR\ Dataset/test/subject_test.txt", col.names=c("Subject.ID")), testX) ## add subject IDs
    testX$Action <- actionKeys$Action.Name[match(testX$Action,actionKeys$Action.ID)] ##  replace action codes with descriptive names


##
##  Bring in training data
##
    trainX <- read.table("UCI\ HAR\ Dataset/train/X_train.txt", col.names=columnNames, check.names=FALSE) ##  read in the main test data
    trainX <- cbind(read.table("UCI\ HAR\ Dataset/train/Y_train.txt", col.names=c("Action")), trainX) ## add activity codes
    trainX <- cbind(read.table("UCI\ HAR\ Dataset/train/subject_train.txt", col.names=c("Subject.ID")), trainX) ## add subject IDs
    trainX$Action <- actionKeys$Action.Name[match(trainX$Action,actionKeys$Action.ID)] ##  replace action codes with descriptive names

##
##  Combine testing and training data sets
##
    combinedData <- rbind(testX, trainX) ##  combine testing and training sets
    combinedData <- combinedData[,grep("Action|Subject.ID|mean\\(\\)|std\\(\\)", colnames(combinedData))] ##  remove columns that don't represent a mean() or std()

##
##  Return
##
    return(combinedData)
}


##
##  Use tidied data to create a summary
##
summarizeTidy <- function(tidiedData) {
	summarizedData <- as.data.frame(t(colMeans(tidiedData[,-2])))[0,]
	for (subject in unique(tidiedData$Subject.ID)) {
		for (activity in unique(tidiedData[tidiedData$Subject.ID==subject,]$Action)) {
			summarizedData[nrow(summarizedData)+1,] <- colMeans(tidiedData[tidiedData$Subject.ID==subject & tidiedData$Action==activity,][,-2])
		}
	}
	
	return(summarizedData)
	
}

##
## Run fanctions and write output files
##

tidiedData <- tidyUP()
write.csv(tidiedData, file="tidiedData1.csv")
summarizedData <- summarizeTidy(tidiedData)
write.csv(summarizedData, file="summarizedData1.csv")
