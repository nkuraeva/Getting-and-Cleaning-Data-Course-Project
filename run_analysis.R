# download data from web
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "./")

# read data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge train and test data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# extraxt the measurements on the mean and standard deviation for each measurement
features <- read.table("./UCI HAR Dataset/features.txt") # features info
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # activity_labels set
select_features <- grep("-(mean|std).*", as.character(features[, 2]))
col_names <- features[select_features, 2]

x_data <- x_data[select_features] # extraxt the measurements on the mean 
#and standard deviation for each measurement

# create a dataset with feature names and activity labels for extracted measurements
all_data <- cbind(subject_data, y_data, x_data) #megre datatables
colnames(all_data) <- c("Subject", "Activity", col_names) # named the columns
activity <- as.character(activity_labels[, 2])
all_data$Activity <- factor(all_data$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
all_data$Subject <- as.factor(all_data$Subject)

# generate new tidy dataset
melted_data <- melt(all_data, id = c("Subject", "Activity"))
tidy_data <- dcast(melted_data, Subject + Activity ~ variable, mean)

write.table(tidy_data, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)

library(dataMaid)
Codebook <- makeCodebook(tidy_data)
