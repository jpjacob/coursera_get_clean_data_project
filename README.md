# coursera_get_clean_data_project
Project for the Getting and Cleaning Data project from Coursera/ Johns Hopkins University

#What is this about?
This project is intended to showcase abilities to work with messy data and create a 'tidy' dataset that can be used for further analysis. The data used in this case represents volunteer data for Samsung Galaxy SII users, capturing accelerometer and gyroscope readings. The data for this can be sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Coding
The run_analysis.R code is intended to take different snippets of data, which has been broken into training(70%) and test(30%) data, and separated into datasets containing attributes, subject identifiers and activity lookups. The instructions provided are as follows:

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In accordance with the instructions, the first part of the code does some housekeeping. It reads the data and applies column names. The next part deals with selecting only 'mean' and 'standard deviations' for each measurement, and then brings all the different datasets into one big dataset, correctly subsetted to include only relevant columns. The next part involves making the column names descriptive. I've tried to do this, but I'm not sure if it is very meaningful to someone not working on this. Finally, this data is summarized for means at an activity and subject level, and the results are written out into a tab delimited text file.

#More
The CodeBook.md file has information on variables used here
