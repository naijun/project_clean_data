run_analysis <- function(){
  ## Before running this code, please set the correct working directory
  ## which contains the data folder "UCI HAR Dataset"
  
  ## read in data: activity_labels, features, subject_test, X_test, y_test,
  ## subject_train, X_train and y_train
  activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
  features <- read.table("UCI HAR Dataset/features.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  
  ## merge the training and test data with row bind
  subject <- rbind(subject_test,subject_train)
  x <- rbind(x_test,x_train)
  y <- rbind(y_test,y_train)
  
  ## identify columns with mean and standard deviation from feature names
  column_index <- grep("mean\\(\\)|std\\(\\)", features[,2])
  
  ## extract only mean and std columns in x
  x_new <- x[,column_index]
  
  ## combine subject, x and y into one data set
  merged_data <- cbind(subject,y,x_new)
  
  ## replace column 2 with meaningful activity names using activity labels
  from <- as.character(activity_label[,1])
  to <- as.character(activity_label[,2])
  merged_data[,2] <- mapvalues(factor(merged_data[,2]),from,to)
  
  ## label the merged_data with meaningful column names from features
  ## clean up special characters and repetitive names where applicable
  colnames(merged_data) <- c("subject", "activity", as.character(features[column_index,2]))
  colnames(merged_data) <- sub("\\(\\)","",colnames(merged_data))
  colnames(merged_data) <- sub("\\-","_",colnames(merged_data))
  colnames(merged_data) <- sub("BodyBody","Body",colnames(merged_data))
  colnames(merged_data) <- sub("\\-X","_X",colnames(merged_data))
  colnames(merged_data) <- sub("\\-Y","_Y",colnames(merged_data))
  colnames(merged_data) <- sub("\\-Z","_Z",colnames(merged_data))
  
  
  ## find the average of each variable for each subject and activity
  tidydata <- aggregate(merged_data[3:68], by=list(merged_data[,1],merged_data[,2]), FUN = mean)
  
  ## rename column 1 and 2 to make it tiday
  colnames(tidydata) <- colnames(merged_data)
  
  ## write data into text file
  write.table(tidydata,"tidy_data.txt",row.names=FALSE)
  
  ## output the data
  tidydata

}
