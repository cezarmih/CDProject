library("data.table")

##1. Read files

#These return different number of columns:
#x_test <- read.csv("test/X_test.txt", sep = " ", header= FALSE)
#x_train <- read.csv("train/X_train.txt", sep = " ", header= FALSE)

x_test<-read.table("test/X_test.txt", header=FALSE,sep="")
x_train<-read.table("train/X_train.txt", header=FALSE,sep="") #sep = "" means any white space (including double spaces)


y_test <- read.csv("test/y_test.txt", sep = " ", header= FALSE)
y_train <- read.csv("train/y_train.txt", sep = " ", header= FALSE)

subject_test <- read.csv("test/subject_test.txt", sep = " ", header= FALSE)
subject_train <- read.csv("train/subject_train.txt", sep = " ", header= FALSE)

features <- read.csv("features.txt", sep = " ", header= FALSE)
activity_labels <- read.csv("activity_labels.txt", sep = " ", header= FALSE)

##2. Column bind Dataframes y_test and subject_test and add column names Activity and Subject to it. ->testas

testas <- cbind(y_test, subject_test)
colnames(testas) <- c("Activity", "Subject")

##3. Column bind Dataframes y_train and subject_train and add column names Activity and Subject to it. ->trainas

trainas <- cbind(y_train, subject_train)
colnames(trainas) <- c("Activity", "Subject")

##4. Merge (rbind) trainas and testas (dim == 10299*2) -> as

as <- rbind(trainas, testas)
head(as)


##5. Merge (rbind) x_train and x_test data (dim == 10299*561) -> x

x <- rbind(x_train, x_test)


##6. Change column names of x from features.txt

colnames(x) <- features[,2]

##7. Eliminate columns from x which do not have "mean()" or "std()" in the column names. -> cdata (dim-10299*66)


toMatch <- c(".*mean\\(\\).*", ".*std\\(\\).*")
matches <- unique (grep(paste(toMatch,collapse="|"), colnames(x), value=TRUE))
xdata <- x[,matches]


## 8. Column bind as and cdata (dim == 10299*68) -> cdata

cdata <- cbind(as, xdata)



## 9. Replace activity numbers with Activity names from activity_lables.txt-> Final Table
labels <- as.vector(activity_labels[,2])
cdata$Activity <- factor(cdata$Activity, labels = labels)

## 10. Take mean of observations per activity per subject. (dim == 180*68). 
dtdata <- data.table(cdata)
mdata <- dtdata[, lapply(.SD, function(x)mean(x[!is.na(x)])), by=list(Subject,Activity)]

## 11. use write.table to get a text file from the above Data Frame

write.table(mdata, "tidyDataSet.txt", sep=" ", row.names = FALSE)

