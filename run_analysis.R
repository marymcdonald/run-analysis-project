

#read in files
testXfile<-read.table("~/UCI_HAR_Dataset/test/X_test.txt", stringsAsFactors=FALSE)
testYfile<-read.table("~/UCI_HAR_Dataset/test/y_test.txt")
SubjTest<-read.table("~/UCI_HAR_Dataset/test/subject_test.txt")

trainXfile<-read.table("~/UCI_HAR_Dataset/train/X_train.txt", stringsAsFactors=FALSE)
trainYfile<-read.table("~/UCI_HAR_Dataset/train/y_train.txt")
SubjTrain<-read.table("~/UCI_HAR_Dataset/train/subject_train.txt")

#add features.txt as column names for X Sets
features<-read.table("~/UCI_HAR_Dataset/features.txt")
colnames(testXfile)<-features$V2
colnames(trainXfile)<-features$V2

#rename column name for Y sets
colnames(testYfile)<-c("V2")
colnames(trainYfile)<-c("V2")

#combine test and train files, respectively, then merge together
testFile<-cbind(SubjTest, testYfile, testXfile)
trainFile<-cbind(SubjTrain, trainYfile, trainXfile)
mergedFile<-rbind(testFile,trainFile)

#separate out mean() and std() measurements, then combine
means<-mergedFile[,grepl("mean()",colnames(mergedFile), fixed=TRUE)]
stds<-mergedFile[,grepl("std()",colnames(mergedFile), fixed=TRUE)]

dataSet1<-cbind(mergedFile[,1:2],means,stds)

#add activity names
activities<-read.table("~/UCI_HAR_Dataset/activity_labels.txt")
v_active<-sapply(dataSet1$V2, function(x) x=activities[x,2])

#add variable names
fileUrl<-source("https://github.com/marymcdonald/run-analysis-project/blob/master/VariableNamesDS1.txt")
variableNames<-read.table(fileUrl)
colnames(dataSet1)<-variableNames$V1

#averages of each variable for each subject and each activity
dataSet2<-aggregate(dataSet1[3:68], dataSet2[1:2], mean)
fileUrl2<-source("https://github.com/marymcdonald/run-analysis-project/blob/master/VariableNamesDS2.txt")
variableNames2<-read.table(fileUrl2)
colnames(dataSet2)<-variableNames2$V1

dataSet2



