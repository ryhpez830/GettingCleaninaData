setwd("./UCI HAR Dataset")

read.table("./activity_labels.txt")->activity_labels
read.table("./features.txt")->features
read.table("./test/x_test.txt")->x_test
read.table("./test/y_test.txt")->y_test
read.table("./test/subject_test.txt")->subject_test
read.table("./train/x_train.txt")->x_train
read.table("./train/y_train.txt")->y_train
read.table("./train/subject_train.txt")->subject_train

#step1------------------
#Merging the training and the test sets

cbind(subject_train,y_train,x_train)->train
cbind(subject_test,y_test,x_test)->test
rbind(test,train)->data


#step2---------------------------
#Subsetting the measurements on the mean and standard deviation

grep("mean|std",features$V2)->subset
data[,c(1,2,subset+2)]->data


#step3---------------------------
#making factors in order to match activity names and numbers

as.factor(data[,2])->data[,2]
levels(data[,2])<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")


#step4---------------------------
#labeling variable names

colnames(data)<-c("subject","activity",as.character(features[subset,]$V2))


#step5---------------------------
#Creating new data with the mean of each variable for each activity and each subject

by1<-data$subject
by2<-data$activity
aggregate(x=data[,-(1:2)],by=list(by1,by2),FUN="mean")->data2
colnames(data2)[1:2]<-c("subject","activity")
data2[order(data2$subject),]->data2

write.table(data2,"./data2.txt",row.names=F)
