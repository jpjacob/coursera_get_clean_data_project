#Read test and train data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

#Read labels
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

colnames(x_test) = features[,2]
colnames(x_train) = features[,2]

#Name data columns
colnames(y_test) = "act_id"
colnames(y_train) = "act_id"

colnames(subject_test) = "subject_id"
colnames(subject_train) = "subject_id"

colnames(activity_labels) = c('act_id','activity_name')

#Identify only mean and standard deviation features
relevant_features <- grepl("mean",features[,2],ignore.case=T)|grepl("std",features[,2],ignore.case=T)

#subset only relevant features and stack test and training data
x_test_rel <- x_test[,relevant_features]
x_train_rel <- x_train[,relevant_features]

x_stack <- rbind(x_train_rel,x_test_rel)
y_stack <- rbind(y_train,y_test)
subject_stack <- rbind(subject_train, subject_test)

#Activity, Subject and Attribute data brought together and activity name added
almost_final_data <- cbind(subject_stack,x_stack,y_stack)
add_act_name <- merge(almost_final_data,activity_labels,by.almost_final_data="act_id",
                      by.activity_labels="act_id")

#Clean up names, not sure what the instructions exactly mean, but I am expanding the
#column names to make is more descriptive

names(add_act_name) <- gsub("\\(|\\)","",names(add_act_name))
names(add_act_name) <- gsub("Acc","Acceleration",names(add_act_name))
names(add_act_name) <- gsub('tBody','TimeBody',names(add_act_name))
names(add_act_name) <- gsub('tGravity','TimeGravity',names(add_act_name))
names(add_act_name) <- gsub('fBody','FrequencyBody',names(add_act_name))
names(add_act_name) <- gsub('Gyro','Gyroscope',names(add_act_name))
names(add_act_name) <- gsub('fGyro','FrequencyGyroscope',names(add_act_name))
names(add_act_name) <- gsub('Mag','Magnitude',names(add_act_name))
names(add_act_name) <- gsub('std','StandardDeviation',names(add_act_name))
names(add_act_name) <- gsub('BodyBody','Body',names(add_act_name))
names(add_act_name) <- gsub('meanFrequ','MeanFrequency',names(add_act_name))
names(add_act_name) <- gsub('mean','Mean',names(add_act_name))
names(add_act_name) <- gsub('act_id','activity_id',names(add_act_name))

#cleaned up dataset
final_data <- add_act_name

#summary tidy data
final_summary = aggregate(final_data[,names(final_data) != c('activity_id',
                                                             'subject_id','activity_name')],
                          by=list(activity_id=final_data$activity_id,
                                  subject_id=final_data$subject_id),FUN=mean,na.action = na.omit)

write.table(final_summary, file = "measurement_summary_activity_subject.txt",sep='\t')
