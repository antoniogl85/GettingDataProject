## Read the activity and feature labels
activity.labels <- read.table("activity_labels.txt", col.names = c("activity_id", "activity_name"))
feature.labels <- read.table("features.txt")

## Read data from the train data set
subject.train.data <- read.table("./train/subject_train.txt", col.names = "subject_id")
x.train.data <- read.table("./train/X_train.txt", col.names = feature.labels$V2)
y.train.data <- read.table("./train/y_train.txt", col.names = "activity_id")

## Read data from the test data set
subject.test.data <- read.table("./test/subject_test.txt", col.names = "subject_id")
x.test.data <- read.table("./test/X_test.txt", col.names = feature.labels$V2)
y.test.data <- read.table("./test/y_test.txt", col.names = "activity_id")

## Join train and test data set
subject.data <- rbind(subject.train.data, subject.test.data)
x.data <- rbind(x.train.data, x.test.data)
y.data <- rbind(y.train.data, y.test.data)

## Select columns corresponding to mean and standard deviation features
selected.cols <- grep("mean\\(\\)|std\\(\\)", feature.labels$V2)
data <- cbind(subject.data, y.data, x.data[, selected.cols])

## Rename columns with more descriptive names
old.expr <- c("^t", "^f", "BodyBody", "Body", "Gravity", "Acc", "Gyro", "Jerk", "Mag",
              "X", "Y", "Z", "\\.")
new.expr <- c("time_", "frequency_", "Body", "body_", "gravity_", "accelerometer_", 
              "gyroscope_", "jerk_", "magnitude_","_X", "_Y", "_Z", "")

for (i in seq_along(old.expr)){
    names(data) <- gsub(old.expr[i], new.expr[i], names(data))
}

## Calculate mean of the selected features and create a new data frame.
## Add activity names to new data frame
library(plyr)
tidy.data <- ddply(data, .(subject_id, activity_id), colMeans)
tidy.data <- arrange(merge(activity.labels, tidy.data), activity_id, subject_id)

## Add activity names to original data frame
data <- arrange(merge(activity.labels, data), activity_id, subject_id)

## Write tidy data to a file
write.table(tidy.data, "tidy_data.txt", row.names = FALSE)

