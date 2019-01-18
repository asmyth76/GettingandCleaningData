
## This is a new R script to merge the training and test sets into one data set.

## Read the training set data
train <- read.table("train/X_train.txt")

#Read the training activities
trainlabels <- read.table("train/y_train.txt")

#Read the training subjects
trainsubjects <- read.table("train/subject_train.txt")

## Add the traininglabel column to the training table
trainTable <- cbind(trainlabels,train)

## Add the trainingsubject column to the training table
trainTable <- cbind(trainsubjects,trainTable)

## Read the test set data
test <- read.table("test/X_test.txt")

## Read the test activities
testlabels <- read.table("test/y_test.txt")

## Read the test subjects
testsubjects <- read.table("test/subject_test.txt")

## Add the testlabel column to the test table
testTable <- cbind(testlabels,test)

## Add the testlabel column to the test table
testTable <- cbind(testsubjects,testTable)

## Combine the data sets
mergedTables <- rbind(trainTable,testTable)

## Label the data set with descriptive var names

## Read the column labels file
labels <- read.table("features.txt", stringsAsFactors = FALSE)

# Add rows for activity & subject
result <- rbind(c(1,"Activity"),labels)
result <- rbind(c(1,"Subject"),result)

# Set cols variable to the 2nd row of the tlabels2 file (colnames)
cols <- result[,2]

# Set the colnames of the file
colnames(mergedTables) <- cols

## Extract all columns that contain  Activity, Subject, mean or std

Table <- mergedTables[ , grepl( "Subject|Activity|mean|std" , names( mergedTables ) ) ]

## Set descriptive activity names to name the activities in the data set

Table <- Table %>% mutate(Activity = replace(Activity, Activity==1, "WALKING"))
Table <- Table %>% mutate(Activity = replace(Activity, Activity==2, "WALKING_UPSTAIRS"))
Table <- Table %>% mutate(Activity = replace(Activity, Activity==3, "WALKING_DOWNSTAIRS"))
Table <- Table %>% mutate(Activity = replace(Activity, Activity==4, "SITTING"))
Table <- Table %>% mutate(Activity = replace(Activity, Activity==5, "STANDING"))
Table <- Table %>% mutate(Activity = replace(Activity, Activity==6, "LAYING"))


## Create a second, independent tidy data set with the average of each var for
## each activity and each subject

tidyTable <- aggregate(Table[,3:80],list(Table$Subject,Table$Activity),mean)

## Update column names

colnames(tidyTable)[1:2] <- c("Subject","Activity")
