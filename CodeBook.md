CodeBook.md

Meaning of variables are the same as original ones in 'UCI_HAR_Dataset/README.txt', except that:

1.subject are labeled as 'subject.id'

2.activities: labels(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which corresponds to 1-6 in the original.y-train/test.txt respectively.

3.The labels of features are same as 'UCI_HAR_Dataset/features.txt'

4.In 'average_motion_features.csv', features are averaged by activity and subject.id and labels are preceded by 'avg_' to original labels.
