"Getting and Cleaning Data" Project - The Code Book
========================================================

This Code Book describes the variables you can find in the tidyDataSet.txt dataset.
This is a tidy dataset containing a summarization of the data provided in the "Human Activity Recognition Using Smartphones Dataset
Version 1.0" (see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data contains raw measurements obtained during an experiment with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The study captured a large variety of data provided by the device' accelerometer and gyroscope. For more details about the study design, see the readme.txt file at the above URL.

This tidy dataset provides only a subset of all initial data, namely those related to the mean and standard deviation attributes.
Further, these continous variables were aggregated by two criteria: Subject (ordinal referring to 30 volunteers) and Type of Activity (categorical with 6 values) 

Types of Activities:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING )




```{r}
library(knitr)
pdata<-read.table("tidyDataSet.txt", sep="", header = TRUE)
#head(pdata)
vars <- colnames(pdata)
dtype <- rep("Continous", length(vars))
dtype[1] <- "ordinal"
dtype[2] <- "categorical"
colnames <- c("variable", "data type")

varstable <- data.frame(vars,dtype)
kable(varstable, format = "markdown")

```

|vars                         |dtype        |
|:----------------------------|:------------|
|Subject                      |ordinal      |
|Activity                     |categorical  |
|tBodyAcc.mean...X            |Continous    |
|tBodyAcc.mean...Y            |Continous    |
|tBodyAcc.mean...Z            |Continous    |
|tBodyAcc.std...X             |Continous    |
|tBodyAcc.std...Y             |Continous    |
|tBodyAcc.std...Z             |Continous    |
|tGravityAcc.mean...X         |Continous    |
|tGravityAcc.mean...Y         |Continous    |
|tGravityAcc.mean...Z         |Continous    |
|tGravityAcc.std...X          |Continous    |
|tGravityAcc.std...Y          |Continous    |
|tGravityAcc.std...Z          |Continous    |
|tBodyAccJerk.mean...X        |Continous    |
|tBodyAccJerk.mean...Y        |Continous    |
|tBodyAccJerk.mean...Z        |Continous    |
|tBodyAccJerk.std...X         |Continous    |
|tBodyAccJerk.std...Y         |Continous    |
|tBodyAccJerk.std...Z         |Continous    |
|tBodyGyro.mean...X           |Continous    |
|tBodyGyro.mean...Y           |Continous    |
|tBodyGyro.mean...Z           |Continous    |
|tBodyGyro.std...X            |Continous    |
|tBodyGyro.std...Y            |Continous    |
|tBodyGyro.std...Z            |Continous    |
|tBodyGyroJerk.mean...X       |Continous    |
|tBodyGyroJerk.mean...Y       |Continous    |
|tBodyGyroJerk.mean...Z       |Continous    |
|tBodyGyroJerk.std...X        |Continous    |
|tBodyGyroJerk.std...Y        |Continous    |
|tBodyGyroJerk.std...Z        |Continous    |
|tBodyAccMag.mean..           |Continous    |
|tBodyAccMag.std..            |Continous    |
|tGravityAccMag.mean..        |Continous    |
|tGravityAccMag.std..         |Continous    |
|tBodyAccJerkMag.mean..       |Continous    |
|tBodyAccJerkMag.std..        |Continous    |
|tBodyGyroMag.mean..          |Continous    |
|tBodyGyroMag.std..           |Continous    |
|tBodyGyroJerkMag.mean..      |Continous    |
|tBodyGyroJerkMag.std..       |Continous    |
|fBodyAcc.mean...X            |Continous    |
|fBodyAcc.mean...Y            |Continous    |
|fBodyAcc.mean...Z            |Continous    |
|fBodyAcc.std...X             |Continous    |
|fBodyAcc.std...Y             |Continous    |
|fBodyAcc.std...Z             |Continous    |
|fBodyAccJerk.mean...X        |Continous    |
|fBodyAccJerk.mean...Y        |Continous    |
|fBodyAccJerk.mean...Z        |Continous    |
|fBodyAccJerk.std...X         |Continous    |
|fBodyAccJerk.std...Y         |Continous    |
|fBodyAccJerk.std...Z         |Continous    |
|fBodyGyro.mean...X           |Continous    |
|fBodyGyro.mean...Y           |Continous    |
|fBodyGyro.mean...Z           |Continous    |
|fBodyGyro.std...X            |Continous    |
|fBodyGyro.std...Y            |Continous    |
|fBodyGyro.std...Z            |Continous    |
|fBodyAccMag.mean..           |Continous    |
|fBodyAccMag.std..            |Continous    |
|fBodyBodyAccJerkMag.mean..   |Continous    |
|fBodyBodyAccJerkMag.std..    |Continous    |
|fBodyBodyGyroMag.mean..      |Continous    |
|fBodyBodyGyroMag.std..       |Continous    |
|fBodyBodyGyroJerkMag.mean..  |Continous    |
|fBodyBodyGyroJerkMag.std..   |Continous    |
