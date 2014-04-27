gettingandcleaningData
======================

Getting and Cleaning Data Repo for Coursera

This repo hosts the runanalysis.R script assigned for the Peer Assessment

The file assumes that you have extracted the data from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and kept all the data text files in the original "UCI HAR Dataset" folder

The script works in the following steps:

* It extracts the data from the text files using read.table
* Then binds the train and test data together to form a unified data table
* It labels the activities with the appropriate names
* Adds the feature names to the data table columns
* The tidy data set with labels and both training and test data is outputted to a text file in the work directory
* A second tidy data set is created where the mean of each feature for each activity for each subject 
* This second data set is outputted to a text file as well 
