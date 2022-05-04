library(dplyr)
library(stringr)
#------------------------------------------------------------------------
#Load training data
setwd("~/R/R Projects/datasciencecoursera/Getting-and-Cleaning-Data/Week-4/final_project_data/UCI HAR Dataset/train")

X_train <- read.table("X_train.txt")
X_train <- as.data.frame(X_train)
Y_train <- read.table("Y_train.txt")
Y_train <- as.data.frame(Y_train)


setwd("~/R/R Projects/datasciencecoursera/Getting-and-Cleaning-Data/Week-4/final_project_data/UCI HAR Dataset/test")

X_test <- read.table("X_test.txt")
X_test <- as.data.frame(X_test)
Y_test <- read.table("Y_test.txt")
Y_test <- as.data.frame(Y_test)


#Loading activity labels
setwd("~/R/R Projects/datasciencecoursera/Getting-and-Cleaning-Data/Week-4/final_project_data/UCI HAR Dataset")

activity_labels <- read.table("activity_labels.txt")
activity_labels <- as.data.frame(activity_labels)


setwd("~/R/R Projects/datasciencecoursera/Getting-and-Cleaning-Data/Week-4/final_project_data/UCI HAR Dataset")


#Loading features (variable) names
features <- read.table("features.txt")
features <- as.data.frame(features)


#We combine train and test data into one dataset
X_train_test <- rbind(X_train, X_test)
Y_train_test <- rbind(Y_train, Y_test)

#Filtering for ONLY mean and std measurements--------------------------
mean_key_word <- "[Mm][Ee][Aa][Nn]"
std_key_word <- "[Ss][Tt][Dd]"


mean_indices <- grep(mean_key_word, features$V2)
std_indices <- grep(std_key_word, features$V2)


X_train_test_mean_labels <- features[mean_indices, 2]
X_train_test_mean_labels <- lapply(X_train_test_mean_labels, tolower)


X_train_test_std_labels <- features[std_indices, 2]
X_train_test_std_labels <- lapply(X_train_test_std_labels, tolower)


all_labels <- data.frame(X_train_test_mean_labels,X_train_test_std_labels)


#Here we save a txt file with only mean and std features
write.table(all_labels,"features__filtered",sep="\n", col.names = FALSE)


#Returns only mean and std features (columns)
X_train_test_means_vals <- X_train_test[ , mean_indices]
X_train_test_std_vals <- X_train_test[ , std_indices]


#Gives each mean/std column a better name
colnames(X_train_test_means_vals) <- X_train_test_mean_labels
colnames(X_train_test_std_vals) <- X_train_test_std_labels

feature_labels <- data.frame(X_train_test_mean_labels, X_train_test_std_labels)

#Combines the mean and std data frames into one data frame
full_X_train_test_data <- cbind.data.frame(X_train_test_means_vals, X_train_test_std_vals)
full_X_train_test_data_temp <- full_X_train_test_data


#-------------------------------------------------------------------------

#Include name of the activity for each observation (e.g. walking, sitting, laying, etc)

ones <- which(Y_train_test == 1)
Y_train_test[ones,1] <- activity_labels[1,2]

twos <- which(Y_train_test == 2)
Y_train_test[twos,1] <- activity_labels[2,2]

threes <- which(Y_train_test == 3)
Y_train_test[threes,1] <- activity_labels[3,2]

fours <- which(Y_train_test == 4)
Y_train_test[fours,1] <- activity_labels[4,2]

fives <- which(Y_train_test == 5)
Y_train_test[fives,1] <- activity_labels[5,2]

sixes <- which(Y_train_test == 6)
Y_train_test[sixes,1] <- activity_labels[6,2]

#---------------------------------------------------------------------

#Compile everything into one final data frame

full_X_train_test_data["activity"] <- Y_train_test



Final_Data <- full_X_train_test_data %>%
        group_by(activity) %>%
        summarise_all(funs(mean))


setwd("~/R/R Projects/datasciencecoursera/Getting_and_Cleaning_Data-Final_Project")

write.table(Final_Data, "Final_Data.txt", row.name=FALSE)


