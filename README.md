#Getting and cleaning data/Assignment

The purpose of this work is to make original data('getdata_projectfiles_UCI HAR Dataset.zip')
to a tidy # which means one column is one variable, one  row is one observation, 
# one sheet stores one kind of observation.
one.
  The precedure includes: 

1.The original observations those were separated to 'train' and 'test' dataset, are united.

2.There are many features(561 features) in original X_train.txt/X_test.txt. Only those labels which contains 'mean' or 'std' are extracted.

3.activities in y_train.txt/y_test.txt(1,2,3,4,5,6) are converted to labels(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) respectively acording to 'activity_labels.txt', to make it more descriptive.

4.The extracted features are averaged by activity and subject.id in 'average_motion_features.csv'.

The procedures are described in run_analysis.R precisely.

Files:
  README.txt : this file
  run_analysis.R: a script to make a tidy dataset
  motion_features.csv: output
  average_motion_features.csv: features are averaged by activity and subject.id.
  'getdata_projectfiles_UCI HAR Dataset.zip': the original dataset
