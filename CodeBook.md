Getting And Cleaning Data - Course Project Codebook
===========================================

Author: Rituraj Singh
-----------------------
Date: January 25, 2015
-----------------------

This document describes the code inside run_analysis.R

### Downloading the data

1. Check to see if the data directory exists, if not create it and give an error.
2. Create the ./data/output directory if it does not exist.
3. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
3. Unzip the contents under the Data folder.

### Files used in the script

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* The following files are available for the train and test data. Their descriptions are equivalent. 
  'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


### Steps taken to generate the tidy data set

1. Check to see if the data directory exists, if not create it and give an error.
2. Create the ./data/output directory if it does not exist.
3. Read the activity label file  "./data/activity_labels.txt" - purpose is to exract the activity labels
4. Read the features file under "./data/features.txt" - purpose is to extract the feature labels.
5. Clean up the activity labels by removing unwanted chracters and making the labels more readable
6. Read the test activity data for all measurements from "./data/test/y_test.txt"
7. Read the test subject data from "./data/test/subject_test.txt"
8. Read the test measurement data file from "./data/test/X_test.txt" using the feature desc as column headings from step 5.
9. Extract only the columns that have "_mean" or "_std" in their column headers.
10. Column Bind the activity and subject data to the test data measurement from step 8.
11. The test data is in a data frame called "test_data_mean_std" (2947 obs of 82 variables)
12. Follow the steps 6 to 10 to read the traiing data from "./data/train" folder.
13. The train data is in a data frame called "train_data_mean_std", dimensions (2947 obs of 82 variables)
14. Merge the test & train Data sets (10299 obs of 82 variables)
15. Remove the activity_id column leaving the activity descripion in the merged data set (10299 obs of 81 variables)
16. Write out the 1st tidy data set to  "./data/output/samsung_merged_data.txt"
17. Group the data from step 15 by activity and subject.
18. Calculate the mean of each variable per activity and per subject on the grouped data set. (180 obs of 81 variables)
19. Output the 2nd resut set to "./data/output/samsungdata_means.txt"
 
