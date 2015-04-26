# run-analysis-project
Course Project for 'Getting and Cleaning Data' course on Coursera

This dataset creates two data tables, dataSet1 and dataSet2, created from the SAMSUNG Human Activity Recognition Using Smartphones DatasetVersion 1.0, but only returns dataSet2.

Each record contains: a subject (numbered 1-30), an activity (numbered 1-6) and the averages of 66 variables relating to measurements ('features' of the mean or standard deviation from the original dataset (from SAMSUNG).

The measurements and averages are bounded between [-1,1].
The measurements selected were the 'features' containing either mean() or std() in the variable name, but did not include the features where the mean or standard deviation was not of body acceleration/gyration, gravity acceleration or jerk of either of these two measurements (e.g. MeanFreq() was not included).

Variable names are sourced from VariableNamesDS1.txt and VariableNamesDS2.txt, also included in repo.

r_analysis.R begins by creating a dataset by reading in the test and train files. The test and train files are first merged respectively and then together. mean() and std() measurements are then separated from the table, then merged together, creating DataSet1. Activity and variable names are then added.
DataSet2 is created after calling the aggregate function to figure out the average for each variable, for each activity and for each subject. Variable names are updated to display this.
