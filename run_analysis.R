## Script loads and tidy's a "wearables" dataset, which tracks sensor signals
##  using the wearable's accelerometer and gyroscope.
## Script assumes the working directory has been preset to fit the dataset's
##  format.
if (!require("dplyr")) install.packages("dplyr")
if (!require("stringr")) install.packages("stringr")
if (!require("reshape")) install.packages("reshape")
if (!require("reshape2")) install.packages("reshape2")
library(dplyr)
library(stringr)
library(reshape)
library(reshape2)
## Step 1: Load and combine test and training data sets.
# Plan to loop through each data set type to combine
data_types <- c("test","train")
dataset_names <- c("subject_id", "activity_id")
# Use descriptive labels for activities and variables
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
    rm(list=c("subject_data","x_data","y_data","temp_data"))
}
dataset <- merge(activity_labels, dataset, by="activity_id")
# Format variable names to be more readable by lowering case and removing dots
names(dataset) <- tolower(names(dataset))
names(dataset) <- gsub("\\.","",names(dataset))
names(dataset) <- gsub("_","",names(dataset))

# Melt and Die Cast data set to create an independent tidy data set with the
#   average of each variable for each activity and each subject.
datasetMelt <- melt(dataset, id=c("activityid", "activityname","subjectid"),
                    measures.vars=names(dataset)[4:82])
datasetData <- dcast(datasetMelt, activityname + subjectid ~ variable, mean)
# Write using write.table with row.names=FALSE
write.table(datasetData, file="tidy.txt", row.names=FALSE)

# Clean up variables
rm(list=c("data_types","dataset_names","i","subject_file","x_file","y_file"))
rm(list=c("activity_labels","feature_labels"))
#rm(list=ls())
#print(object.size(datasetMelt),units="Mb")