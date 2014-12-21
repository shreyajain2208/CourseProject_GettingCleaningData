names<-names(data[,1:66])

#Purpose:
#Computes the mean of every variable for each activity and each subject and appends them together.
library(reshape2)
meltedData<-melt(data,id=c("subject","activity"),measure.vars=names)
subData<-dcast(meltedData,subject~variable,mean)
actData<-dcast(meltedData,activity~variable,mean)

identical(names(actData[,2:67]),names(subData[,2:67]))
subData$activity_subject<-paste("Subject : ",subData$subject)
actData$activity_subject<-paste("Activity : ",actData$activity)
finalData<-rbind(actData[,2:68],subData[,2:68])
finalData<-cbind(activity_subject=finalData[,67],finalData[,1:66])
write.table(finalData,"finalData.txt",row.name=F)