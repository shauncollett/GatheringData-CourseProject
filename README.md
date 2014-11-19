## Gathering and Cleaning Data - CourseProject

One of the most exciting areas in all of data science right now is wearable computing.  Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

As part of the Data Science Specialization on Coursera, the run_analysis.R script in this repo takes data collected from wearable computers and summarizes it into a tidy, summarized dataset for analysis.  The summarized dataset describes the results of an experiment conducted with 30 volunteers who were asked to perform 6 different activities, with the measurements being captured by a Samsung Galaxy S II.  The variables in the dataset represent the mean of either the mean or standard deviation recorded by the accelerometer or gyroscope per activity per subject.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' within the downloaded dataset for more details.

### Script Execution
To execute the script, you must:
* Download the dataset into the local repo for this project.  The data is linked here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Unzip the data just downloaded, placing the contents of UCI HAR Dataset in the root of the local repo.  For example, run_analysis.R should be in the same directory as features.txt.
* In R, set your working directory to be the root of the repo.

### Code Book
run_analysis.R will export a tidy dataset into tidy.txt at the root of the repo, with the following variables:
* activityname: a descriptive name given to each activity the volunteer performed.
* subjectid: volunteer id.
* mean and standard deviation measurements: for each variable, this is the mean of either the mean or standard deviation as noted in the variable's name.  The variable name is descriptive of the source and type of mesaurement - source being the accelerometer or gyroscope.  All variable names have been reformatted to be lower name, remove dots and remove underscores.  For more information on the feature names, please see features_info.txt and features.txt file in the root of the data directory.  I also recommend reading the README.txt, located in the root of the data directory.
