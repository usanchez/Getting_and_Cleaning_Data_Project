# Getting and Cleaning Data: Course Project
This repo explains how all of the scripts work and how they are connected. In this project only one script is needed and its name has to be ```run_analysis.R```

## Script run_analysis.R

### Behaviour 

The ```run_analysis.R``` script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Dependencies

This script doesn't depend on any other script, but needs the following libraries to work:

* reshape2
* data.table

### Making it work

Follow these steps to be able to replicate the project:

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it.  It will create a folder called ```UCI HAR Dataset'''.
2. The folder ```UCI HAR Dataset``` and the script ```run_analysis.R``` must be on the same folder level (script and folder on the same parent directory).
3. Set the parent directory as the working directory using the setwd() function.
4. Run ```source("run_analysis.R")```. It will generate a new file ```tiny_data.txt``` in the working directory.
