
Getting And Cleaning Data - Course Project
===========================================

Author: Rituraj Singh
-----------------------
Date: January 25, 2015
-----------------------

###Introduction

This repo contains my course project to Coursera "Getting And Cleaning Data" course that is part of Data Science specialization.

There is just one script called run_analysis.R

Input for the Project is from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The input data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The purpose of the script file is to create a tidy data set that is a combination of both the test and train data sets.
The output measurements are limited to mean and standard deviation values.

### Output ##
The 1st output under "./data/output/samsung_merged_data.txt"is a tidy data set with only the measurements on the mean and standard deviation for each measurement. 

The 2nd data set under "./data/output/samsungdata_means.txt" is a tidy data set with the average of each variable for each activity and each subject from the 1st output data set.

### Instructions ##

1. Create a directory called "data" in the same folder where the "run_analysis.R" is located.
2. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
3. Unzip the contents in the Data folder.
4. Run the "run_analysis.R file.
5. The output is located in "./data/output"
