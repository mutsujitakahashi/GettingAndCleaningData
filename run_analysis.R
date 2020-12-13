#-----------------------------------run_analysis.R------------------------------
#  Make motion feature data('getdata_projectfiles_UCI HAR Dataset.zip') tidy,
#  A more compact dataset that averages features is also made(
# 'average_motion_features.csv').
# Refer to CodeBook.md for meaning of variables, README.md for the 
# purpose of data processing.                   muz 2020/12/13
#-------------------------------------------------------------------------------
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
# make activity more descriptive
act_kind <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
features <- read.table(paste0(baseDir, "features.txt"), sep=" ", col.names=c("num","label")) %>%
    as_tibble %>% filter(regexpr("mean|std",label)!=-1)
n <- as.vector(features$num)
l <- as.vector(features$label)
#--- input train dataset -----------------------------------------
subject_train <- read.table(paste0(trainDir,"subject_train.txt"),
                        col.names="subject.id")
y_train <- read.table(paste0(trainDir,"y_train.txt"),col.names="activity") %>%
                mutate(activity=act_kind[activity])
X_train <- fread(paste0(trainDir,"X_train.txt"), select=n, col.names=l)
tbl_train <- data.table(subject_train, y_train, X_train)
#--- input test  dataset -----------------------------------------
subject_test <- read.table(paste0(testDir,"subject_test.txt"),
                        col.names="subject.id")
y_test <- read.table(paste0(testDir,"y_test.txt"),col.names="activity") %>%
                mutate(activity=act_kind[activity])
X_test <- fread(paste0(testDir,"X_test.txt"), select=n, col.names=l)
tbl_test <- data.table(subject_test, y_test, X_test)
#----- merge them, sort by subject.id ------------------------------
motion_features <- merge(tbl_train,tbl_test, all=T, sort=T)
#--------------------------------------------
write.csv(motion_features, "motion_features.csv")
#--------------------------------------------
# average_motion_features
# average features by subjectid and activity
average_motion_features <- motion_features %>%
                group_by(subject.id, activity) %>%
                summarize_all(mean)               # make mean(s) at once
avg_l <- sapply(l, function(x){paste0("avg_", x)}) %>% unlist # add avg_ to labels
names(average_motion_features) <- c("subject.id", "activity", avg_l)
write.csv(average_motion_features, "average_motion_features.csv")
#------------------END_OF_SCRIPT------------------------------
