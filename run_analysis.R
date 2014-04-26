##  run_analysis.R
##  1 Merges the training and the test sets to create one data set.
##  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3 Uses descriptive activity names to name the activities in the data set
##  4 Appropriately labels the data set with descriptive activity names. 
##  5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

read.table("UCI\ HAR\ Dataset/test/Inertial\ Signals/body_acc_x_test.txt")

testHeaders <- read.table("UCI\ HAR\ Dataset/features.txt")
test2 <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
colnames(test2) <- t(testHeaders)[2,]
