#read raw data
x1 <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y1 <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
s1 <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

x2 <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y2 <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
s2 <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

c <- read.table(".\\UCI HAR Dataset\\features.txt")
a <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

#grep mean and std columns
m <- subset(c,  grepl("mean()", c$V2, fixed=TRUE)|grepl("std()", c$V2, fixed=TRUE))

x1<-x1[,m$V1]
x2<-x2[,m$V1]

#set column names
colnames(x1)<-m$V2
colnames(x2)<-m$V2

colnames(y1)<-"ActivityCode"
colnames(y2)<-"ActivityCode"

colnames(s1)<-"Subject"
colnames(s2)<-"Subject"

colnames(a)<-c("ActivityCode","ActivityLabel")

#merge raw data file
t1<-cbind(s1,y1,x1)
t2<-cbind(s2,y2,x2)

#combin training and test data
df<-rbind(t1,t2)

#decode Activitycode
mdf = merge(df,a, by.x="ActivityCode", by.y="ActivityCode", All=True)

#change column names
names(mdf) <- gsub("^t", "Time", names(mdf))
names(mdf) <- gsub("^f", "Frequency", names(mdf))
names(mdf) <- gsub("-mean\\(\\)", "Mean", names(mdf))
names(mdf) <- gsub("-std\\(\\)", "StdDev", names(mdf))
names(mdf) <- gsub("-", "", names(mdf))
names(mdf) <- gsub("BodyBody", "Body", names(mdf))

#first Data Set
mdf

#aggreate / average data by subject and Activiy
aggdata <-aggregate(mdf[ ,names(mdf) != "ActivityLabel"] , by=list(mdf$Subject, mdf$ActivityCode, mdf$ActivityLabel), FUN=mean, na.rm=TRUE)

# Tidy / Second Data Set
aggdata
write.table(aggdata, "aggdata.txt", row.names = FALSE)
