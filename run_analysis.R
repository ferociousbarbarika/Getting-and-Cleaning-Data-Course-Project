# Dependancy
require(reshape2)

# Extracting Feature Names
features <- read.table("UCI HAR Dataset/features.txt")
fnames <- features[,2]
fnames <- levels(droplevels(features[grepl(".*mean|std*.", fnames)]))

# Train Set
act <- read.table("UCI HAR Dataset/train/y_train.txt")
sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(sub, act, train)

# Test Set
act <- read.table("UCI HAR Dataset/test/Y_test.txt")
sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(sub,act,test)

# Complete Dataset
complete_dataset <- rbind(train,test)

# Extracting the needed features from the Dataset
names(complete_dataset) <- features[,2]
complete_dataset <- complete_dataset[,fnames]
names(complete_dataset)[1]<-"Subject"
names(complete_dataset)[2]<-"Activity"

# Replacing Activity Number with Names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
complete_dataset$Activity <- sapply(complete_dataset$Activity,function(num) activity_labels[num])

# Tidying Dataset
molten_dataset <- melt(complete_dataset, id=c("Subject","Activity"))
tidy_dataset <- dcast(molten_dataset, formula = Subject + Activity ~ variable, mean)
write.table(tidy_dataset,file="tidy_data.txt",row.name=FALSE,quote = FALSE)
