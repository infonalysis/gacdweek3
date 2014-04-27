##  run_analysis.R
##  1 Merges the training and the test sets to create one data set.
##  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3 Uses descriptive activity names to name the activities in the data set
##  4 Appropriately labels the data set with descriptive activity names. 
##  5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

tidyUP <- function() {
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
##  Print some output
##
    return(combinedData)
}

write.csv(tidiedData, file="tidiedData1.csv")


##  trainX["Subject.ID"] <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt") ##  include the subject IDs


##
##  random lines of code
##
##  read.table("UCI\ HAR\ Dataset/test/Inertial\ Signals/body_acc_x_test.txt")

##  colHeaders <- read.table("UCI\ HAR\ Dataset/features.txt")

##  testX["Subject.ID"] <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt") ##  include the subject IDs

##  testSubjects <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
##  colnames(testSubjects) <- c("Subject.ID")



##  trainSubjects <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
##  colnames(trainSubjects) <- c("Subject.ID")


##  colnames(testX) <- c(t(read.table("UCI\ HAR\ Dataset/features.txt")[2,]))


##  combinedData[,grep("mean()|std()", colnames(combinedData))]

##  setwd("/Users/Ben/Documents/School/Coursera/Cleaning Data/gacdweek3")
##  names(testX)[1] <- "Action"