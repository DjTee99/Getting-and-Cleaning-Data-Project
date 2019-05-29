
# read training data
trainingSubjects <- read.table("./train/subject_train.txt")
trainingFigures <- read.table("./train/X_train.txt")
trainingActivities <- read.table("./train/y_train.txt")

# read test data
testSubjects <- read.table("./test/subject_test.txt")
testFigures <- read.table("./test/X_test.txt")
testActivities <- read.table("./test/y_test.txt")

# read features and activity data

features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

# Giving descriptive col names to the training and test figures
colnames(trainingFigures) <- features$V2 
colnames(testFigures) <- features$V2

trainingActivities$activity <- trainingActivities$V1
trainingSubjects$subject <- factor(trainingSubjects$V1)
testActivities$activity <- testActivities$V1
testSubjects$subject <- factor(testSubjects$V1)


# Merging training & test figures together
dataset <- rbind(
  cbind(trainingSubjects,trainingFigures,trainingActivities),
  cbind(testSubjects,testFigures,testActivities))

# filter column names
column.names <- names(dataset)

# get only columns for standard deviation and mean values
column.names.filtered <- grep("mean|std|activity|subject",column.names,value=TRUE)
dataset.filtered <- dataset[, column.names.filtered]

#adding descriptive values for activity labels 
dataset.filtered$activity <- factor(dataset.filtered$activity,labels=activities[,2])
                                    
#creating a tidy dataset with mean values for each subject and activity
features.colnames = grep("std|mean", column.names, value=TRUE)
dataset.melt <-melt(dataset.filtered, id = c('activity', 'subject'), measure.vars = features.colnames)
dataset.tidy <- dcast(dataset.melt, activity + subject ~ variable, mean)

#creating a tidy dataset file
write.table(dataset.tidy, file = "tidydataset.txt", row.names = FALSE)