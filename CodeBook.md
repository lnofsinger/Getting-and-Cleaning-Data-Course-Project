# CodeBook.md

The original data were acquired from the Human Activity Recognition Using Smartphones Dataset Version 1.0 from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The aim of the original project, for which the data was created, was to predict activity from the measured recordings while wearing a smartphone (Samsung Galaxy S II) on the waist. The data are from an experiment carried out with a group of 30 volunteers. Each person performed six activities; “walking,” “walking upstairs,” “walking downstairs,” “sitting,” “standing” and “laying.”

The data from the 30 participants consisted of 10,299 observations but were originally partitioned into a training set (70%) and a test set (30%).

Each observation had 561 measured variable readings from the smartphone. For the scope of this project (run_analysis.R) we were only interested in the measurements on the mean and standard deviation for each variable, of which there were 66 variables.

The script run_analysis.R:

•	Reads in each of the necessary data files

•	Merges only the desired columns from each file into a single data frame (“combined”) for both the training and test data sets.

•	Appropriately labels the data frame with descriptive column names and descriptive activity names.

•	Extracts the mean and standard deviation for each featured measurement and stores the values in a new data frame (“tidy_data1”) 

•	Creates a second, independent tidy data set (“tidy_data2”) with the average of each variable for each activity and each subject. 
