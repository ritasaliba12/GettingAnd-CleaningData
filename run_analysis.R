

#download samsung data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./assignment4.zip")

#uzip data
unzip("./assignment4.zip")

#read test and train sets
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")

#merge data sets

data <- rbind(train,test)

#read features
features <- read.table("./features.txt")

#keep only mean and std features
meanstd<- data[,grep("mean\\(|std",features$V2)]

#rename with feature names
colnames(meanstd) <-grep("mean\\(|std",features$V2,value = TRUE)

#read labels files
trainl <- read.table("./train/y_train.txt")
testl <- read.table("./test/y_test.txt")
activity <- read.table("./activity_labels.txt")

#merge label files
labels <- rbind(trainl,testl)


#read subject files
trainsubject <- read.table("./train/subject_train.txt")
testsubject <- read.table("./test/subject_test.txt")

#merge subject files
subject <- rbind(trainsubject,testsubject)

#rename column
colnames(subject) <- ("subject")

#combine all files
all <- cbind(meanstd,labels,subject)

#merge activity lables
datatouse<-merge(all,activity,by = "V1")
head(datatouse)
colnames(datatouse)[ncol(datatouse)] <- ("activity")
#get mean according to different varibales
meandata <- aggregate(datatouse[,2:(ncol(datatouse)-2)],by=list(datatouse$activity,datatouse$subject), FUN=mean, na.rm=TRUE)
colnames(meandata) <- colnames(meandata, prefix = "mean of")
colnames(meandata)[3:ncol(meandata)] <- paste("Mean of", colnames(meandata)[3:ncol(meandata)])

#output text file (tidy data)
write.table(meandata,"./tidydataset.txt",row.names=FALSE)
nrow(meandata)
ncol(meandata)
head(meandata)
