
**"Getting and Cleaning Data"** Course Project Code Book
========================================
## Initial data for research

The data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 


### **Dataset**

1. `features_info.txt:` Shows information about the variables used on the features.
2. `features.txt:` List of all features measured
3. `activity_labels.txt:` Links the class labels with their activity name.
4. `train/X_train.txt:` inclusive of measurements of the features in a training set.
5. `train/y_train.txt:` activity (from 1 to 6) for each measurement from the trainset
6. `test/X_test.txt:` Test set.
7. `test/y_test.txt:` activity (from 1 to 6) for each measurement from the training  set.

### **Variables**

This dataset provide the following variables for each activity:

  1. *subject* - ID(`1 to 30`) of participant 
  
  2. *activity* - ID(`Walking, walking upstairs, walking down stairs, sitting, standing, laying`) of activity type
  
  3. **Mean** and **Standard deviation** for the following features: 
      * tBodyAcc-XYZ
      * tGravityAcc-XYZ
      * tBodyAccJerk-XYZ
      * tBodyGyro-XYZ
      * tBodyGyroJerk-XYZ
      * tBodyAccMag
      * tGravityAccMag
      * tBodyAccJerkMag
      * tBodyGyroMag
      * tBodyGyroJerkMag
      * fBodyAcc-XYZ
      * fBodyAccJerk-XYZ
      * fBodyGyro-XYZ
      * fBodyAccMag
      * fBodyAccJerkMag
      * fBodyGyroMag
      * fBodyGyroJerkMag
      
## Transformations

**Transformations** that were applied on the source data are as follow:

1. Load *training* and *test* data [see datasets section](#Dataset) into data frames and appropriately label data frames with descriptive names 

2. Independently load activity labels and subjects for measurements from files **train/y_train.txt** and **train/subject_train.txt** and add to data frame as separated columns.

3. Training and test sets were merged to create one data set.

4. The measurements on the *mean* and *standard deviation* (i.e. signals containing the strings *mean* and *std*) were extracted for each measurement, and the others were discarded.
5. The activity `identifiers` (originally coded as integers between 1 and 6) were replaced with descriptive activity names (`i.e Walking, walking upstairs, walking down stairs, sitting, standing, laying`)

6. The final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the `run_analysis.R` R script 