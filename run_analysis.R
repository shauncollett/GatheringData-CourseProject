## Script loads and tidy's a "wearables" dataset, which tracks sensor signals
##  using the wearable's accelerometer and gyroscope.
## Script assumes the working directory has been preset to fit the dataset's
##  format.
library(dplyr)
## Step 1: Load and combine test and training data sets.
# Plan to loop through each data set type to combine
data_types <- c("test","train")
dataset_names <- c("subject_id", "activity_id")
# Load activity labels to later integrate into combined data set
activity_labels <- read.csv("activity_labels.txt", header=FALSE, sep=" ")
feature_labels <- read.csv("features.txt", header=FALSE, sep=" ")
names(activity_labels) <- c("activity_id", "activity_name")
names(feature_labels) <- c("feature_id", "feature_name")

# Loop through data types and load into initial data set
for(i in data_types){
    subject_file <- paste(i, "/subject_", i, ".txt", sep="")
    x_file <- paste(i, "/x_", i, ".txt", sep="")
    y_file <- paste(i, "/y_", i, ".txt", sep="")
    subject_data <- read.csv(subject_file, header=FALSE, sep="")
    x_data <- read.csv(x_file, header=FALSE, sep="", 
                       col.names=feature_labels$feature_name)
    y_data <- read.csv(y_file, header=FALSE, sep="")
    if(!exists("dataset")) {
        dataset <- cbind(subject_data, y_data, 
                         x_data[,grepl("mean()",names(x_data)) | grepl("std()",names(x_data))])
        names(dataset)[1:2] <- c(dataset_names)
    } else {
        if(exists("temp_data")) rm(temp_data)
        temp_data <- cbind(subject_data, y_data, 
                           x_data[,grepl("mean()",names(x_data)) | grepl("std()",names(x_data))])
        names(temp_data)[1:2] <- c(dataset_names)
        dataset <- rbind(dataset, temp_data)
    }
    rm(subject_data)
    rm(x_data)
    rm(y_data)
}
dataset <- merge(activity_labels, dataset, by="activity_id")

#rm(list=ls())
#print(object.size(dataset),units="Mb")