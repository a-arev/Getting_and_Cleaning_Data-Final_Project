The run_analysis.R script gets and cleans data as follows.
1. **Upload the dataset **
- Dataset is uploaded from the folder called UCI HAR Dataset
2. **Assign each data to variables**
- x_test <- test/X_test.txt : 2947 rows by 561 columns, Holds collected feature data from test group
- y_test <- test/y_test.txt : 2947 rows by 1 columns, Holds the activitiy labels of test data
- x_train <- test/X_train.txt : 7352 rows by 561 columns, Holds collected feature data for train group
- y_train <- test/y_train.txt : 7352 rows by 1 columns, Holds activitiy labels for train data
- features <- features.txt : 561 rows, 2 columns, Has the names of collected variables from accelerometer and gyroscope 3-axial raw signals (tAcc-XYZ, tGyro-XYZ).
- activity_labels <- activity_labels.txt : 6 rows, 2 columns, List of activities performed when the corresponding measurements were taken and its codes (labels)


3. **Merges the training and the test sets to create one data set for X and Y**
- X_train_test(10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
- Y_train_test(10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
4. **Extracts only the measurements on the mean and standard deviation for each measurement**
- X_train_test_mean_labels (33 rows, 1 columns) - holds the names for mean features
- X_train_test_std_labels (33 rows, 1 columns) - holds the names for std features
- X_train_test_means_vals(53 rows, 1 columns) - holds the values for mean features
- X_train_test_means_vals(53 rows, 1 columns) - holds the values for std features
- full_X_train_test_data(10299 rows, 87 columns) - is holds all the mean and std values along with their feature labels
5. **Uses descriptive activity names to name the activities in the data set**
- The column with activity codes was replaced with the actual activity name
6. **Appropriately labels the data set with descriptive variable names**
- All features have been assigned a more descriptive name, based on the feature.txt file
7. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
- Final_Data (6 rows, 87 columns) is the same as but all values have been averaged according to activity for each feature (variable). 
- Lastly, export Final_Data into Final_Data.txt text file.

