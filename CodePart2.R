##Purpose:
#1. Extracts only the measurements on the mean and standard deviation 
#       for each measurement.

#Input: "data" is the merged test and train data frame

#identifying the std columns
stdCols<-grep(pattern="std()",fixed=T,x=names(data),value=F)

#identifying the mean columns
meanCols<-grep(pattern="mean()",fixed=T,x=names(data),value=F)
names<-names(data[,c(meanCols,stdCols)])

##subetting the data only to std and mean columns for subject and activity
data<-data[,c(meanCols,stdCols,562,563)]

rm(stdCols)
rm(meanCols)
rm(names)