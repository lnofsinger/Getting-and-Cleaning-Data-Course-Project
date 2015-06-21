## Getting and Cleaning Data Course Project

#Step1: Download and unzip the Samsung Project data
dirHAR = "./HAR"
if(!file.exists(dirHAR)) {dir.create(dirHAR)}
zipFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile = paste(dirHAR, "data.zip", sep="/")
download.file(zipFileUrl, destfile=destFile, method="curl")
unzip(destFile, exdir=dirHAR)

#Step 2: Read in the data from "UCI HAR Dataset" using read.table() and setting the header to be false because the files do not contain column names
X_test <- read.table("./HAR/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
y_test <- read.table("./HAR/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
subject_test <- read.table("./HAR/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
X_train <- read.table("./HAR/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
y_train <- read.table("./HAR/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
subject_train <- read.table("./HAR/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
activity_labels <- read.table("./HAR/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
features <- read.table("./HAR/UCI HAR Dataset/features.txt", header = FALSE, sep = "")

#Step 3: Subset each data frame to contain only the data (columns) we are interested in. 
features <- features[,2]
colunm_names1 <- as.character(features)
colunm_names <- c(colunm_names1, "subject", "activity")

activity_labels <- activity_labels[,2]
activity_labels <- as.character(activity_labels)

y_train <- y_train[,1]
y_test <- y_test[,1]
subject_test <- subject_test[,1]
subject_train <- subject_train[,1]

#Step 4: Create and define columns "subject" and "activity" for the X_train and X_test data frames
X_train$subject <- subject_train
X_test$subject <- subject_test
X_train$activity <- y_train
X_test$activity <- y_test

#Step 5: Combine the two data frames "X_train" and "X_test" into one large data frame
combined <- rbind(X_train, X_test)

#Step 6: Assign activity names to the numeric activity place holders
combined$activity <- gsub(1, activity_labels[1], combined$activity)
combined$activity <- gsub(2, activity_labels[2], combined$activity)
combined$activity <- gsub(3, activity_labels[3], combined$activity)
combined$activity <- gsub(4, activity_labels[4], combined$activity)
combined$activity <- gsub(5, activity_labels[5], combined$activity)
combined$activity <- gsub(6, activity_labels[6], combined$activity)

#Step 7: Add column names to the data frame
names(combined) <- colunm_names

#Step 8: Extract the measurements on the mean and standard deviation for each measurement. 
t_data <- combined[ , grepl( "subject|activity|mean|std", names(combined))]
tidy_data1 <- select(t_data, -contains("meanFreq"))

# Answer to parts 1-4
write.table(tidy_data1, "tidy_data1.txt", sep=" ", row.name=FALSE)

#Step 9: Write a function(x) that will calculate the average of each variable for each activity and place them in a matrix.
activity_matrix <- matrix(nrow=66, ncol=6)
activity_function <- function(x){
        a <- tapply(tidy_data1[,x], tidy_data1$activity, mean)
        for(i in 1:6){
                activity_matrix[x,i] <<- a[i]
        }
}
sapply(1:66, activity_function)

#Step 10: Write a function(x) that will calculate the average of each variable for each subject and place them in a matrix
subject_matrix <- matrix(nrow=66, ncol=30)
subject_function <- function(x){
        a <- tapply(tidy_data1[,x], tidy_data1$subject, mean)
        for(i in 1:30){
                subject_matrix[x,i] <<- a[i]
        }
}
sapply(1:66, subject_function)

#Step 11: Combine the activity and subject matrices
combined_matrix <- cbind(activity_matrix, subject_matrix)

#Step 14: Create a new, independent, data frame that will contain the average of each variable for each activity and subject and write it to a txt file.
tidy_data2 <- data.frame(combined_matrix)
tidy_data2  <- cbind(names(tidy_data1[1:66]), tidy_data2)
subject_names <- c("Subject1", "Subject2", "Subject3", "Subject4", "Subject5", "Subject6", "Subject7", "Subject8", "Subject9", "Subject10", "Subject11", "Subject12", "Subject13", "Subject14", "Subject15", 
                   "Subject16", "Subject17", "Subject18", "Subject19", "Subject20", "Subject21", "Subject22", "Subject23", "Subject24", "Subject25", "Subject26", "Subject27", "Subject28", "Subject29", "Subject30")
names(tidy_data2) <- c("Measure", activity_labels, subject_names)

# Answer to part 5: 
write.table(tidy_data2, "tidy_data2.txt", sep=" ", row.name=FALSE)
