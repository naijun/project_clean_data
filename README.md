project_clean_data
==================
### Introduction:

This repo is created for "Getting and Cleaning Data" course project. It contains an R script called "run_analysis.R" that transforms a few fragmented datasets contained in the following link into a tidy and clean dataset with calculated average of some key variables. It also contains a code book "CodeBook.md" that describes the variable names in detail in the final tidy dataset.

### Initial Data:
Here is the link of the fragmented datasets:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Once unzipped, the fragmented datasets are contained in the folder "UCI HAR Dataset". You can find out the relevant information in the "README.txt".


### High-level Processes on Data Transformation:
1. Read in the required data that is needed to calculate the average of all measurements on mean and standard deviation. The following files are read: activity_labels, features, subject_test, X_test, y_test, subject_train, X_train and y_train.
2. Merge the training and test data with row bind 
3. Identify variable names with mean and standard deviation using grep. Variables are described in more detail in the CodeBook.
4. Extract columns with mean and standard deviation measures only
5. Replace the activity labels with meaningful language instead of integer codes
6. Clean up on the variable names by removing special characters and repetitions
7. Calculates the mean for each variable by subject and activity
8. Write the data into a text file and also output the data as function return

### Key Watchouts:
You are recommended to run the R script in RStudio Version 0.98.978. Before you run, please set the working directory to the parent folder (i.e. one-level up folder) of the dataset "UCI HAR Dataset". Please also ensure "plyr" package is installed and library(plyr) is loaded.
