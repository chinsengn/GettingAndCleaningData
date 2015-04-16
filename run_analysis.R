# Part 1 - 	Set up things
#
	library(dplyr)  # load the dplyr library
	
	# make a lookup table of activity and their descriptive names
	ac_llk<-read.table("activity_labels.txt")
	colnames(ac_llk)<-c("activity","activity_nm")

# Part 2 - 	work on the "Train" folder
# 			merge the activity, subject and measurement variables together into 1 dataset
# 			add a column that identifies this as the "Training" set

	# switch to the 'train' folder
	mywd=".\\train"
	setwd(mywd)
	
	# read all the activity and subject id tables first
	a <- read.table("y_train.txt") 
	s <- read.table("subject_train.txt")
	
	# create the table for activity, subject id
	# also a new col that identify this is the training set
	# use a left join to add a column for descriptive name to the activity
	train <- cbind(a,s)
	colnames(train) <- c("activity","subject_id")
	train <- train %>%
	mutate(data_typ="train") %>%
	left_join(ac_llk)

	# read the descriptive names for the feature columns from 'features.txt'
	features <-read.table("..\\features.txt")
	
	# get the positions of the Mean() and Std() columns 
	meanStdColumnsPos <- grep("mean|std", features$V2, value = FALSE)
	
	# and then grab the full names of the Mean() and Std() columns
	meanStdColumnsNames <- grep("mean|std", features$V2, value = TRUE)
	
	# read in the variables value table (this is the big table)
	v <- read.table("X_train.txt")
	
	# select the mean and std columns out of the big table using
	v_meanstd_only <- select(v, meanStdColumnsPos)
	
	# rename those columns with our extracted names above
	colnames(v_meanstd_only) <-meanStdColumnsNames

	# merge the train table with the variables table
	train <- cbind(train,v_meanstd_only)
	
	# remove unnecessary objects
	rm(a,s,v,v_meanstd_only)
	


# Part 3 - 	work on the "Test" folder
# 			merge the activity, subject and measurement variables together into 1 dataset
# 			add a column that identifies this as the "Test" set

	mywd="..\\test"
	setwd(mywd)

	# read all the activity and subject id tables first
	aa <- read.table("y_test.txt") 
	ss <- read.table("subject_test.txt")	
	
	# create the table for activity, subject id
	# also a new col that identify this is the Test set
	# use a left join to add a column for descriptive name to the activity
	test <- cbind(aa,ss)
	colnames(test) <- c("activity","subject_id")
	test <- test %>%
	mutate(data_typ="test") %>%
	left_join(ac_llk)
	
	# read in the variables value table (this is the big table)
	vv <- read.table("X_test.txt")
	
	# select the mean and std columns out of the big table re-using
	# indices from Part 2
	v_meanstd_only <- select(vv, meanStdColumnsPos)
	
	# rename those columns with our previously extracted names in 
	# Part 2
	colnames(v_meanstd_only) <-meanStdColumnsNames

	# merge the train table with the variables table
	test <- cbind(test,v_meanstd_only)
	
	# remove unnecessary objects
	rm(aa,ss,vv,v_meanstd_only,meanStdColumnsNames,meanStdColumnsPos)
	

# Part 4 -  merge the rows in "Training" & "Test" data set together
	all_data <- rbind_list(train, test)
	
# Part 5 -  first throw out the data_typ and activity col,
#			then group dataset by activity_nm and subject id, 
#           and find the means of all measurement fields.
#
#			note that col names of the measurement fields were not changed 
#			with the summarise function but their values are
# 			
	summ_data <- all_data %>%
		select(-data_typ,-activity) %>%
		group_by(subject_id,activity_nm) %>%
		summarise_each(funs(mean))

	# write out the data set to a csv file 'summ_data.csv'
	write.table(summ_data, file = "..\\summ_data.txt", quote=FALSE, row.names=FALSE)
	
	# print(colnames(summ_data[1:6]))

	# clears all the objects
	# rm(list=ls(all=TRUE))
