# data-cleaning_W4_Assigment
Getting and Cleaning Data Course Project

To run the "run_analysis.R" script user needs to 

1.) First download the smartphone dataset (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2.) unzip the file.
3.) set the working directory by ajusting the following clause: setwd("./DataScienceDoc/data/C3W4/UCI HAR Dataset")

The script leverages the dplyr package and following the 5 steps blow:

1.) Merges the training and the test sets to create one data set.
2.) Extracts only the measurements on the mean and standard deviation for each measurement.
3.) Uses descriptive activity names to name the activities in the data set
4.) Appropriately labels the data set with descriptive variable names.
5.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The filanl output from step 5 is stored in a text file named Summarize_dataset.txt
