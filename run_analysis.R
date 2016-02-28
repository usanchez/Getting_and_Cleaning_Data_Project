# Load data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Name")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "Subject_ID"

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Name")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "Subject_ID"

# Extract only the measurements on the mean and standard deviation for each measurement
mean_std_measurements <- grepl("mean|std", features)
X_test <- X_test[,mean_std_measurements]
X_train <- X_train[,mean_std_measurements]

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge train and test set to create one data set
data <- rbind(test_data, train_data)

# Label the data set with descriptive variable names
main_labels <- c("Subject_ID", "Activity_ID", "Activity_Name")
data_labels <- setdiff(colnames(data), main_labels)
melt_data <- melt(data, id = main_labels, measure.vars = data_labels)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_dataset <- dcast(melt_data, Subject_ID + Activity_Name ~ variable, mean)
write.table(tidy_dataset, file = "./tidy_dataset.txt", row.names = FALSE)
