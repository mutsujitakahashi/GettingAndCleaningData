library(data.table)
library(dplyr)
wd <- "~/cw/data-science/GettingAndCleaningData/Assignment/GettingAndCleaningData/"
baseDir <- "UCI_HAR_Dataset/"
trainDir <- paste0(wd, baseDir, "train/")
testDir  <- paste0(wd, baseDir, "test/")
mid <- "Inertial Signals/"
trainAccDir <- paste0(trainDir, mid)
testAccDir  <- paste0(testDir, mid)

setwd(wd)
act_kind <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
features <- read.table(paste0(baseDir, "features.txt"), sep=" ", col.names=c("num","label")) %>%
    as_tibble %>% filter(regexpr("mean|std",label)!=-1)
n <- as.vector(features$num)
l <- as.vector(features$label)
#--------------------------------------------
subject_train <- read.table(paste0(trainDir,"subject_train.txt"),
                        col.names="subject.id")
y_train <- read.table(paste0(trainDir,"y_train.txt"),col.names="activity") %>%
    mutate(activity=act_kind[activity])
X_train <- fread(paste0(trainDir,"X_train.txt"),
                        select=n, col.names=l)
tbl_train <- data.table(subject_train, y_train, X_train)
#--------------------------------------------
subject_test <- read.table(paste0(testDir,"subject_test.txt"),
                           col.names="subject.id")
y_test <- read.table(paste0(testDir,"y_test.txt"),col.names="activity") %>%
    mutate(activity=act_kind[activity])
X_test <- fread(paste0(testDir,"X_test.txt"),
                select=n, col.names=l)
tbl_test <- data.table(subject_test, y_test, X_test)
#--------------------------------------------
motion_features <- merge(tbl_train,tbl_test, all=T, sort=T)
#--------------------------------------------
write.csv(motion_features, "motion_features.csv")
#--------------------------------------------
# average_motion_features
average_motion_features <- motion_features %>% group_by(subject.id, activity) %>% summarize_all(mean)
avg_l <- sapply(l, function(x){paste0("avg_", x)}) %>% unlistnewNames <- c("subject.id", "activity", avg_l)
newNames <- c("subject.id", "activity", avg_l)
names(average_motion_features) <- newNames
write.csv(average_motion_features, "average_motion_features.csv")
