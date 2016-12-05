Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Requirement

You will be required to submit:

A tidy data set as described below.
A link to a Github repository with your script for performing the analysis.
A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
Include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
Reference and Data Set

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description: run_analysis.R

R script called run_analysis.R that does the following.

Create a directory and download and extract the UCI HAR Dataset zip file.
Following files are read:
test data
train data
features
activity labels
Test and train data are merged by grouping features(X), activity(Y), and subject ID.
Select indices that only contain mean() and std(), and reset the data with the selected indices. Observations of the variable, activity(Y), is replaced the numeric values with the descriptive activity names.
The data is now combined in order of Subject ID, activity(Y), features(X)
The mean of activities and subject IDs is created in a separate tidy data set.
Independent tidy data set with the mean of each variable for each activity and each subject is exported as TidyDataSet.txt
