# Getting-and-Cleaning-Data-Course-Project
## Initial data for research
The script is invented to analyze the data from UCI HAR Dataset. It's supposed that archive is extracted to the working directory.

### The following files from the initial dataset is used:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
test/y_test.txt - activity (from 1 to 6) for each measurement from the test set
### How script works
1. Download the dataset from web if it does not already exist in the working directory.
2. Read both the train and test datasets and merge them into x(measurements), y(activity) and subject, respectively.
3. Load the data(x's) feature, activity info and extract columns named 'mean'(-mean) and 'standard'(-std). Also, modify column names to descriptive. (-mean to Mean, -std to Std, and remove symbols like -, (, ))
4. Extract data by selected columns(from step 3), and merge x, y(activity) and subject data. Also, replace y(activity) column to it's name by refering activity label (loaded step 3).
5. Generate 'Tidy Dataset' that consists of the average (mean) of each variable for each subject and each activity. The result is shown in the file tidy_dataset.txt.
6. Creat Codebook with "dataMaid" library 
