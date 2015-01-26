library(plyr)
library(dplyr)

#check to see if the data directory exists, if not create it
if(!file.exists("data")) { 
  dir.create("data") 
  stop("Input data not found, please unzip the data to the data directory")
}

#check to see if ./data/output directory exists, if not create it
if(!file.exists("data/output")) { dir.create("data/output") }

# Read the activity label file
activity_labels <- read.table("./data/activity_labels.txt", header = FALSE, sep = " ", stringsAsFactors = FALSE, col.names = c("activity_id", "activity"))

# Read the features file
features <- read.table("./data/features.txt", header=FALSE, sep = " ", stringsAsFactors = FALSE, col.names = c("feature_id", "feature_desc"), colClasses = c("character"))

#make a charcter vector with feature label
#clean up the activity labels by removing unwanted chracters and making the labels more readable
feature_labels <- features[,"feature_desc"]
feature_labels <- sub(",", "_", feature_labels, fixed = TRUE)
feature_labels <- sub("()", "", feature_labels, fixed= TRUE)
feature_labels <- sub("-", "_", feature_labels, fixed= TRUE)
feature_labels <- sub("-", "_", feature_labels, fixed= TRUE)
feature_labels <- sub("(", " ", feature_labels, fixed= TRUE)
feature_labels <- sub(")", " ", feature_labels, fixed= TRUE)

#
# Test Data section
#
#read the test activity data for all measurements
test_activity <- read.table("./data/test/y_test.txt", colClasses = c("integer"), col.names = c("activity_id"))

#read the test subject data
test_subject <- read.table("./data/test/subject_test.txt", colClasses = c("integer"), col.names = c("subject"))

# read the test measurement data file
test_data_measurements <- read.table("./data/test/X_test.txt", stringsAsFactors = FALSE, col.names = feature_labels, colClasses= c("numeric"))

#strip out all columns except the measurements on mean and standard deviation
test_data_mean_std <- select (test_data_measurements, contains("_mean"))
test_data_std <- select (test_data_measurements, contains("_std"))
test_data_mean_std <- bind_cols (test_data_mean_std,test_data_std)

#add the activity for each measurement to the test data set
test_data_mean_std <- bind_cols (test_activity, test_data_mean_std)

#add the subject for each measurement to the test data set
test_data_mean_std <- bind_cols (test_subject, test_data_mean_std)

# add the activity labels
test_data_mean_std <- merge(activity_labels, test_data_mean_std, by.x = "activity_id", by.y = "activity_id")

#
# Train Data section
#

#read the train activity data for all measurements
train_activity <- read.table("./data/train/y_train.txt", colClasses = c("integer"), col.names = c("activity_id"))

#read the tran subject data
train_subject <- read.table("./data/train/subject_train.txt", colClasses = c("integer"), col.names = c("subject"))

# read the train measurement data file
train_data_measurements <- read.table("./data/train/X_train.txt", stringsAsFactors = FALSE, col.names = feature_labels, colClasses= c("numeric"))

#strip out all columns except the measurements on mean and standard deviation
train_data_mean_std <- select (train_data_measurements, contains("_mean"))
train_data_std <- select (train_data_measurements, contains("_std"))
train_data_mean_std <- bind_cols (train_data_mean_std,train_data_std)

#add the activity for each measurement to the train data set
train_data_mean_std <- bind_cols (train_activity, train_data_mean_std)

#add the subject for each measurement to the test data set
train_data_mean_std <- bind_cols (train_subject, train_data_mean_std)

# add the activity labels
train_data_mean_std <- merge(activity_labels, train_data_mean_std, by.x = "activity_id", by.y = "activity_id", sort = FALSE)

#merge the test & train Data sets
samsungTotal <- rbind(test_data_mean_std, train_data_mean_std)

#arrange the data set by subject & activity
samsungTotal <- arrange(samsungTotal, subject, activity_id)

#remove the activity id
samsungTotal <- select (samsungTotal, -activity_id)

#write out the 1st data set 
write.table(samsungTotal, "./data/output/samsung_merged_data.txt",row.name=FALSE) # write out the 1st dataset

#group by activity and subject
by_activity_subject <- group_by(samsungTotal, activity, subject)

#calculate the mean of each variable per activity and per subject
samsungDataFinal<- summarise_each (by_activity_subject, funs(mean))

#write out the result set in the output directory
write.table(samsungDataFinal, "./data/output/samsungdata_means.txt", row.name=FALSE) 

