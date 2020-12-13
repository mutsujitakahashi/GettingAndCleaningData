# CodeBook.md

Meaning of variables is the same as original ones in 'UCI_HAR_Dataset/README.txt', except that:

1. subject are labeled as 'subject.id'

2. activities: labels(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which corresponds to 1-6 in the original.y-train/test.txt according to 'activity_labels.txt' respectively.

3. The labels of the features are same as 'UCI_HAR_Dataset/features.txt'

4. In 'average_motion_features.csv', features are averaged by activity and subject.id, that is data with same subject.id and activity are averaged.
Labels are preceded by 'avg_' to original labels.
