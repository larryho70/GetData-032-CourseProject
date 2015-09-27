## install packages dplyr and tidyr
install.packages("dplyr")
install.packages("tidyr")

library(dplyr)
library(tidyr)

## Read the test files
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read the training files
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Read the activity labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_label) <- c("activity_id", "activity")

## Read the features (column names)
features <- read.table("UCI HAR Dataset/features.txt")

## Create a vector containing the position of the mean and std columns
## not needed since using dplyr
mean_col <- grep("mean\\(\\)", features$V2) + 2
std_col <- grep("std\\(\\)", features$V2) + 2

## combine subject (volunteer), y (activity_id) and x (measures) files
train <- cbind(train_subject, train_y, train_x)
test <- cbind(test_subject, test_y, test_x)

## combine test and train files together
comb <- rbind(train, test)

## Add column names
names(comb) <- c("volunteer", "activity_id", as.character(features$V2))
 
## select the columns for mean() and std() only
comb <- comb[,c(1,2,mean_col,std_col)]

## replace the activity number with the activity label
comb <- inner_join(activity_label, comb, by = "activity_id")

write.table(comb, file="tidy_data.txt", row.names = FALSE)

comb_mean <- comb %>% 
        group_by(activity_id, activity, volunteer) %>%
        summarise_each(funs(mean)) 

write.table(comb_mean, file="tidy_data_mean.txt", row.names = FALSE)
