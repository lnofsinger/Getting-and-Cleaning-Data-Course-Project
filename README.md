# Getting-and-Cleaning-Data-Course-Project

The purpose of this project is to demonstrate the ability to collect and clean data. The goal is to prepare a tidy data set that can be used for further analysis. The data was collected from the accelerometers from the Samsung Galaxy S smartphone outside the scope of this project. The raw data sets were downloaded Samsung here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repo contains:

•	run_analysis.R 

•	CodeBook.md 


# run_analysis.R

run_analysis.R is a single R script that preforms several objectives with the training and test data from the Samsung datasets. The data files necessary to use the run_analysis.R script must be stored in the same directory, however the script is designed to do this directly. In addition, the run_analysis.R script will preform the following objectives:

•	Reads in each of the necessary data files

•	Merges only the desired columns from each file into a single data frame (“combined”) for both the training and test data sets.

•	Appropriately labels the data frame with descriptive column names and descriptive activity names.

•	Extracts the mean and standard deviation for each feature and stores the values in a new data frame (“tidy_data1”) 

•	Creates a second, independent tidy data set (“tidy_data2”) with the average of each variable for each activity and each subject. 


# CodeBook.md

This file will explain each step of the script and defines the variables. 



