## Code Book

### Data Set Files
* tidiedData1.csv - Full tidied data set
* summarizedData1.csv - Contains the averages of the measurements presented in tidiedData1.csv by subject and activity


### Tidying the Data
The data sets presented here are derived from the UCI HAR dataset.  Those data were modified as described below only by the accompanying run_analysis.R file.

1. Column names are extracted from features.txt
2. A set of action codes and description are extracted from activity_labels.txt
3. The training data, including the following measurements, were loaded into a data table using the previously loaded column names
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope. 
  - A 561-feature vector with time and frequency domain variables. 
  - Its activity label. 
  - An identifier of the subject who carried out the experiment.
4. The subject IDs and activity codes for each measurements were loaded from seperate files and added as additional columns
5. The action codes were then replaced with descriptive labels using the previously loaded action code data
6. Steps 3, 4, and 5 were repeated with the test data to create a separate data table