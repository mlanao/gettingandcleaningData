#Getting and Cleaning Data - Peer Assessment
#Data obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#This script, run_analysis.R completes the multiple requirements for the assignment

#Part 1. Merge the Training and the Test sets into one data set

#read data from files and merge training and test data sets into one table

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")

X <- rbind(xtrain,xtest)

ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

Subject <- rbind(subtrain,subtest)

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#find indices on y files and match to appropriate activity labels

for (i in seq_along(activity$V1)){
  ind <- which(ytest$V1 == i)
  ytest$V1[ind] <- as.character(activity$V2[i])
  ind2 <- which(ytrain$V1 == i)
  ytrain$V1[ind] <- as.character(activity$V2[i])
}

Y <- rbind(ytrain,ytest)

#match feature names to X columns

names(X) <- features$V2

#find indices of mean and std features

indFeat <- grep("-mean\\(\\)|-std\\(\\)",features$V2)

#only maintain the desired(mean and std) columns in the X table
X <- X[,indFeat]

#add subject and activity columns with column label to complete data set
Data <- cbind(X,Subject,Y)
end <- ncol(Data)
names(Data)[end]<-"Activity"
names(Data)[end-1]<-"Subject"

#write cleaned and merged data table to appropriately named file
write.table(Data,"mean_and_std_merged_data.txt")

#create the second data set with the averages of each feature of each activity for each subject
numSubjects = length(unique(Subject$V1))
numActivities = length(unique(activity$V1))
Data2 <- Data[1:(numSubjects*numActivities),1:end]

i = 1
for (s in 1:numSubjects){
  for (a in 1:numActivities){
    ind <- which(Data$Subject == s & Data$Activity == as.character(activity$V2[a]))
    Data2[i,1:(end-2)] <- colMeans(Data[ind,1:(end-2)])
    Data2[i,end-1] <- s
    Data2[i,end] <- as.character(activity$V2[a])
    i <- i+1
  }
}

#write second data set to file
write.table(Data2,"data_with_mean_of_vars.txt")