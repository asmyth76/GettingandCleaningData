==================================================================
run_analysis.R
Author: Abigail Smyth
==================================================================

The script reads the following training data:
 - training set data (train/X_train.txt)
 - training activities (train/y_train.txt)
 - training subjects (train/subject_train.txt)

It then binds the activities and subjects to the training set data.

The same is done for the test data:
 - test set data (test/X_test.txt)
 - test activities (test/y_test.txt)
 - test subjects (test/subject_test.txt)

It then binds the activities and subjects to the test set data.

The two datasets are then combined into 'mergedTables'

The labels file is read (features.txt) and rbind is used to add 'Activity' and 'Subject'.

The labels are then set to column names for the combined test and training dataset.

Only columns for subject, activity, mean and standard deviation (std) are extracted.

Descriptive text replaces the activity id in the activity column.

An aggregate table is created based on subject, activity and gives the mean of each associated mean and std deviation column.
