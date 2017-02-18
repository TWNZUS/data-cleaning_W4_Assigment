library(dplyr)

setwd("./DataScienceDoc/data/C3W4/UCI HAR Dataset")

### Step 1.Merges the training and the test sets to create one data set. ###

### Merge X, Y tables
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")

X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")

Merged_X <- rbind(X_test, X_train)
Merged_Y <- rbind(Y_test, Y_train)
colnames(Merged_Y) <- "Activity"

rm(X_test)
rm(Y_test)
rm(X_train)
rm(Y_train)


### Merge Subject
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

Merged_subject <- rbind(subject_test, subject_train)
colnames(Merged_subject) <- "Subject"

rm(subject_test)
rm(subject_train)


### Merge All 
Merged_dataset <- cbind(Merged_subject,	Merged_Y,	Merged_X)

rm(Merged_subject)
rm(Merged_Y)
rm(Merged_X)

### Step 2. Extracts only the measurements on the mean and standard deviation for each measurement ###

features <- read.table("./features.txt")
features_mean_std_Index <- sort( c(grep("mean", features$V2) , grep("std", features$V2 )))

Merged_dataset_mean_std <- Merged_dataset[, c(features_mean_std_Index +2,1,2)]


### Step 3. Uses descriptive activity names to name the activities in the data set ###

activity_labels <- read.table("./activity_labels.txt")
colnames(activity_labels)<- c( "Activity", "Activity Label"  )

Merged_dataset_mean_std <- merge( Merged_dataset_mean_std, activity_labels, by = "Activity" )

### Step 4. Appropriately labels the data set with descriptive variable names. ###

colnames(Merged_dataset_mean_std)[2:80]<-levels(factor(features[features_mean_std_Index, 2]))

### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ###

 Summarize_dataset <- Merged_dataset_mean_std %>% 
                      group_by(Activity,`Activity Label`,Subject )%>%
                      summarise_each(funs(mean), c(2:80) )
 
 write.table(Summarize_dataset, "Summarize_dataset.txt")






