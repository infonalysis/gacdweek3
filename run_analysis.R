##  run_analysis.R
##  1 Merges the training and the test sets to create one data set.
##  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3 Uses descriptive activity names to name the activities in the data set
##  4 Appropriately labels the data set with descriptive activity names. 
##  5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


##
##  The good stuff
##
testX <- read.table("UCI\ HAR\ Dataset/test/X_test.txt") ##  read in the main test data
colnames(testX) <- t(read.table("UCI\ HAR\ Dataset/features.txt"))[2,] ##  set the column names
testX["Subject.ID"] <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt") ##  include the subject IDs

trainX <- read.table("UCI\ HAR\ Dataset/train/X_train.txt") ##  read in the main test data
colnames(trainX) <- t(read.table("UCI\ HAR\ Dataset/features.txt"))[2,] ##  set the column names
trainX["Subject.ID"] <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt") ##  include the subject IDs


##
##  random lines of code
##
##  read.table("UCI\ HAR\ Dataset/test/Inertial\ Signals/body_acc_x_test.txt")

##  colHeaders <- read.table("UCI\ HAR\ Dataset/features.txt")



##  testSubjects <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
##  colnames(testSubjects) <- c("Subject.ID")



##  trainSubjects <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
##  colnames(trainSubjects) <- c("Subject.ID")


##  colnames(testX) <- c(t(read.table("UCI\ HAR\ Dataset/features.txt")[2,]))
