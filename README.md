---
title: "Getting and cleaning Data Course Project"
output: html_document
---

##Overview

- One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

- You can download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Steps

Create run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##About run_analysis.R
- It reads 8 txt files from the working directory.

- The subject, the activity, the test data and the train data are merged into one data.

- Using the `grep()`, the measurements on the mean and standard deviation are subsetted.

- It uses `as.factor()` in order to match activity names and numbers.

- Then it labels variable names. (tBodyAcc-mean()-X, tBodyAcc-std()-X, etc.) 

- Finally, new data containing the mean of the variables from previous data is created. The data is sorted in asceding order.