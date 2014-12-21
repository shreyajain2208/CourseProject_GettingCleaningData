
##Purpose:
#1. Merges the training and the test sets to create one data set.
#2. Uses descriptive activity names to name the activities in the data set.
#3. Appropriately labels the data set with descriptive variable names

##Output:
# "data" is the dataset final dataset obtained at this step (10299 obs and 563 var).

#downloading the data
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileurl,temp)
unzip(temp)

labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
feature<-read.table("./UCI HAR Dataset/features.txt")

##tidying test data
library(data.table)
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(sub_test)<-"subject"
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(xtest)<-feature$V2
unique(ytest)
labels
ytest<-merge(ytest,labels,by="V1")
names(ytest)<- c("act_num","activity")
unique(ytest)
test<-cbind(xtest,sub_test,activity=ytest$activity)
###cleaning space in R
rm(xtest)
rm(ytest)
rm(sub_test)

##tidying train data
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(sub_train)<-"subject"
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(xtrain)<-feature$V2
ytrain<-merge(ytrain,labels,by="V1")
names(ytrain)<- c("act_num","activity")
train<-cbind(xtrain,sub_train,activity=ytrain$activity)
###cleaning space in R
rm(xtrain)
rm(ytrain)
rm(sub_train)

rm(feature)
rm(labels)


##combining test and train datasets

##logical variable to confirm the names are identical in test and train
if(identical(names(test),names(train))){
        data<-rbind(test,train)
        rm(test)
        rm(train)
}else {
        message("test and train datasets have different names")
}
