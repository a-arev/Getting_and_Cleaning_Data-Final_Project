**Getting and Cleaning Data: Final Project**
This repository contains submission for Getting and Cleaning Data final course project. It holds the necessary code for analyzing movement-sensor data from smartphones.

**Dataset**


[Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Files**
- CodeBook.md which holds the data, its measured variables, and the transformations that gets the data into a clean set for future analysis.
- run_analysis.R uploads the data and cleans it up as the following steps show
 - Merges training and test datasets to create one data set.
 - Extracts only measurements/variables that involve a mean and standard deviation.
 - Assigns descriptive names for each activity in the dataset.
 - Labels variables with descriptive names.
 - Lastly, creates a new dataset (Final_Data.txt) identical to the cleaned up dataset, but includes only the averages for each activity within each variable.
- The dataset containing the averages (Final_Data.txt) is then exported and saved as as a txt file.
