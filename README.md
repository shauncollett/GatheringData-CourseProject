## Gathering and Cleaning Data - CourseProject

One of the most exciting areas in all of data science right now is wearable computing.  Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

As part of the Data Science Specialization on Coursera, the run_analysis.R script in this repo takes data collected from wearable computers and summarizes it into a tidy dataset for analysis.

To execute the script, you must:
* Download the dataset into the local repo for this project.  The data is linked here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Unzip the data just downloaded, placing the contents of UCI HAR Dataset in the root of the local repo.  For example, run_analysis.R should be in the same directory as features.txt.
* In R, set your working directory to be the root of the repo.

run_analysis.R will export a tidy dataset into tidy.txt at the root of the repo, with the following variables:
* activity_name
* subject_id
* mean and standard deviation measurements.
