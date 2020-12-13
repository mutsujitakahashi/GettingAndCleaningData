# Getting and cleaning data/Assignment

The purpose of this work is to make original data('getdata_projectfiles_UCI HAR Dataset.zip')
to a tidy one, which means one column is one variable, one  row is one observation, one sheet stores one kind of observation.

The procedure includes: 

1. The original observations those were separated to 'train' and 'test' dataset, are united.

2. There are many features(561 features) in original X_train.txt/X_test.txt. Only those labels which contains 'mean' or 'std' are extracted.

3. activities in y_train.txt/y_test.txt(1,2,3,4,5,6) are converted to labels(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) respectively acording to 'activity_labels.txt', to make it more descriptive.

4. The data in subject_train/subject_test.txt are merged to activities and features as a variable named 'subject.id'. Just 'id' is ambiguous as just observation id, so named as this.

5. The extracted features are averaged by activity and subject.id in 'average_motion_features.csv'.

The procedures are described in run_analysis.R precisely.

Files:

- README.txt : this file
- run_analysis.R: an R script to make a tidy dataset
-  motion_features.csv: output1
-  average_motion_features.csv: output1,features are averaged by activity and subject.id.
- 'getdata_projectfiles_UCI HAR Dataset.zip': the original dataset
