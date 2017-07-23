---
title: "CodeBook"
output: html_document
---


##Variables
- subject : Subject ID from 1 to 30
- activity : Acitity name. There are 6 factors: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING".

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals

- mean(): Mean value
- std(): Standard deviation
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

##Data
- activity_labels: Acvitity names
- features: Various measurments of signals
- x_test: Test set. 2947*561 
- x_train: Training set. 7352*561
- y_test: Test labels
- y_train: Training labels
- subject_test: Subjects who performed the activity
- subject_train: Subjects who performed the activity
- test: Merged data. 2947*563
- train: Merged data. 2947*563
- data: Merged data. 10299*81
- data2: Extracted data. 180*81 

##Steps
1. Using `read.table, read the files needed from "UCI HAR Dataset" folder.
2. Merge the "subject_train", "y_train", and "x_train". Same for the training sets. `rbind` and `cbind` are used. 
3. Only the measurements on the "mean" and "std" are subsetted, including "meanfreq". `grep` is used.
4. Name the activities in "data" using `as.factor`. 1 is assigned to "WALKING", 2 is assigned to "WALKING_UPSTAIRS", etc.
5. Using `colnames`, change the variable names. The first column is "subject" and the seccond one is "activity".
6. Subset the "subject" and "activity" to make a group of each subject and each activity.
7. Compute the mean of each variable by that group. `aggregate` is used.